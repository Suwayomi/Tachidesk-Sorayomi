// Copyright (c) 2026 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:async'; // Completer — required by single-flight refresh

import 'package:flutter/foundation.dart'; // debugPrint
import 'package:graphql/client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/enum.dart';
// Input types are defined in the schema file and NOT re-exported by
// auth.graphql.dart, so we import the schema directly.
import '../../../graphql/__generated__/schema.graphql.dart'
    show Input$LoginInput, Input$RefreshTokenInput;
import 'auth_credentials_store.dart';
import 'auth_state.dart';
import 'graphql/__generated__/auth.graphql.dart';
import 'simple_login_client.dart';

part 'auth_coordinator.g.dart';

/// Result of a Test Connection attempt.
sealed class TestConnectionResult {
  const TestConnectionResult();
}

class TestConnectionSuccess extends TestConnectionResult {
  const TestConnectionSuccess();
}

class TestConnectionFailure extends TestConnectionResult {
  const TestConnectionFailure(this.kind, [this.detail]);
  final TestConnectionFailureKind kind;
  final String? detail;
}

enum TestConnectionFailureKind {
  network,
  tls,
  invalidCredentials,
  wrongAuthMode,
  unexpectedShape,
  insecureTransport,
}

/// Maps a thrown error to a typed [TestConnectionFailure]. Used by both
/// `testConnection` and the credentials popup's Save path so both surface
/// the same friendly message instead of a raw exception toString().
///
/// TLS errors (`HandshakeException: Wrong version number`) are checked
/// BEFORE network errors because their toString() also contains tokens
/// like "connection" that would otherwise collapse them into a generic
/// network failure.
TestConnectionFailure classifyAuthError(Object e) {
  if (e is SimpleLoginAuthFailure) {
    return const TestConnectionFailure(
        TestConnectionFailureKind.invalidCredentials);
  }
  if (e is SimpleLoginShapeFailure) {
    return TestConnectionFailure(
        TestConnectionFailureKind.unexpectedShape, e.message);
  }
  final msg = e.toString().toLowerCase();
  if (msg.contains('unauthor') || msg.contains('forbidden')) {
    return const TestConnectionFailure(
        TestConnectionFailureKind.invalidCredentials);
  }
  if (msg.contains('handshake') ||
      msg.contains('wrong version') ||
      msg.contains('certificate') ||
      msg.contains('tls') ||
      msg.contains(' ssl')) {
    return const TestConnectionFailure(TestConnectionFailureKind.tls);
  }
  if (msg.contains('socket') ||
      msg.contains('timeout') ||
      msg.contains('host') ||
      msg.contains('connection')) {
    return const TestConnectionFailure(TestConnectionFailureKind.network);
  }
  return TestConnectionFailure(
      TestConnectionFailureKind.unexpectedShape, e.toString());
}

/// Outcome of a refresh attempt. Top-level sealed type — DECLARED HERE
/// (above [AuthCoordinator]) so the class body that references it can
/// stay contiguous. This placement matters: in round 2 the sealed
/// classes were inserted MID-CLASS by accident, which forced
/// `testConnection` to fall outside the class and broke compilation.
sealed class RefreshOutcome {
  const RefreshOutcome();
  const factory RefreshOutcome.success(String newAccessToken) =
      RefreshSuccess;
  const factory RefreshOutcome.authFailure() = RefreshAuthFailure;
  const factory RefreshOutcome.transientFailure(Object error) =
      RefreshTransientFailure;
}

class RefreshSuccess extends RefreshOutcome {
  const RefreshSuccess(this.newAccessToken);
  final String newAccessToken;
}

class RefreshAuthFailure extends RefreshOutcome {
  const RefreshAuthFailure();
}

class RefreshTransientFailure extends RefreshOutcome {
  const RefreshTransientFailure(this.error);
  final Object error;
}

/// Process-wide single-flight slot for UI Login refresh.
///
/// Held as a TOP-LEVEL static — not a notifier field — so it survives
/// provider invalidation (Codex round-3 finding: if a Riverpod
/// invalidate recreates [AuthCoordinator] mid-refresh, an instance
/// field would silently allow a second concurrent refresh). The
/// trade-off: tests that exercise the static must reset it via
/// `debugResetAuthCoordinatorSingleFlight()` in `setUp`.
Completer<RefreshOutcome>? _refreshInFlight;

/// Test hook to clear the file-static single-flight slot between tests.
@visibleForTesting
void debugResetAuthCoordinatorSingleFlight() {
  _refreshInFlight = null;
}

/// Extracts an HTTP status code from a graphql_flutter [LinkException],
/// or `null` if the exception isn't an HTTP-layer one. Used by
/// [AuthCoordinator._refreshUiAccessTokenImpl] to tell auth failures
/// (401/403) from transient failures (sockets, 5xx, timeout). Defined
/// at file scope so tests can drive it without standing up an
/// AuthCoordinator. — Codex round-3 finding.
int? _httpStatusOfLinkException(LinkException ex) {
  if (ex is HttpLinkServerException) {
    return ex.response.statusCode;
  }
  // ResponseFormatException / ServerException / NetworkException etc.
  // don't carry a status code — treat as transient.
  return null;
}

/// Orchestrates login, re-auth, and test-connection flows for the two new
/// auth modes. Pure logic — the UI calls into this and observes the
/// resulting state via [AuthCredentialsStore] and [NeedsReauth].
@Riverpod(keepAlive: true)
class AuthCoordinator extends _$AuthCoordinator {
  @override
  void build() {}

  // ---------- Verify-only paths (no persistence) ----------
  //
  // These run the same network round-trips as the real login flows but
  // do NOT touch secure storage. Used by the credentials popup's Test
  // Connection button so a user can verify without committing anything
  // — clicking Cancel must leave the existing config untouched.
  //
  // **Caveat for simple_login (R2-11):** `verifySimpleCredentials` calls
  // `POST /login.html`, which creates a server-side session and returns a
  // cookie. Discarding the cookie does NOT delete the session — Suwayomi
  // will accumulate orphan sessions if the user hammers Test. The
  // existing simple_login docs don't expose a logout-without-cookie
  // endpoint, so we accept this as a documented limitation. UX guidance:
  // the popup should treat Test as "soft commit" — successive Tests
  // overwrite each other server-side, and Save reuses the most recent
  // verified cookie (see Task 17) so a typical Test → Save sequence
  // produces exactly one session.

  /// Verifies Simple Login credentials by POSTing to /login.html. Returns
  /// the session cookie on success; throws on failure. Caller decides
  /// whether to persist (via [loginSimple]) or discard.
  Future<String> verifySimpleCredentials({
    required String serverBaseUrl,
    required String username,
    required String password,
  }) async {
    final client = SimpleLoginClient();
    return await client.login(
      serverBaseUrl: serverBaseUrl,
      username: username,
      password: password,
    );
  }

  /// Verifies UI Login credentials by firing the `login` mutation.
  /// Returns the token pair on success; throws on failure. Caller
  /// decides whether to persist (via [loginUi]) or discard.
  Future<UiLoginTokens> verifyUiCredentials({
    required GraphQLClient gqlClient,
    required String username,
    required String password,
  }) async {
    final result = await gqlClient.mutate$Login(Options$Mutation$Login(
      variables: Variables$Mutation$Login(
        input: Input$LoginInput(
          username: username,
          password: password,
        ),
      ),
    ));
    if (result.hasException) {
      throw result.exception!;
    }
    final payload = result.parsedData?.login;
    if (payload == null) {
      throw Exception('login mutation returned null payload');
    }
    return UiLoginTokens(
      accessToken: payload.accessToken,
      refreshToken: payload.refreshToken,
    );
  }

  // ---------- Persisting login paths ----------

  /// Performs Simple Login AND persists the resulting cookie + password.
  /// Equivalent to `verifySimpleCredentials` + a store write. Used by
  /// the credentials popup's Save button.
  Future<void> loginSimple({
    required String serverBaseUrl,
    required String username,
    required String password,
  }) async {
    final cookie = await verifySimpleCredentials(
      serverBaseUrl: serverBaseUrl,
      username: username,
      password: password,
    );
    final store = ref.read(authCredentialsStoreProvider.notifier);
    await store.saveSimpleLoginCookie(cookie);
    await store.savePassword(password);
    ref.read(needsReauthProvider.notifier).set(false);
  }

  /// Performs UI Login AND persists both tokens + password.
  Future<void> loginUi({
    required GraphQLClient gqlClient,
    required String username,
    required String password,
  }) async {
    final tokens = await verifyUiCredentials(
      gqlClient: gqlClient,
      username: username,
      password: password,
    );
    final store = ref.read(authCredentialsStoreProvider.notifier);
    await store.saveUiLoginTokens(
      accessToken: tokens.accessToken,
      refreshToken: tokens.refreshToken,
    );
    await store.savePassword(password);
    ref.read(needsReauthProvider.notifier).set(false);
  }

  /// Calls the `refreshToken` mutation. Returns a typed [RefreshOutcome].
  /// Process-wide single-flight is handled via the FILE-STATIC
  /// `_refreshInFlight` Completer declared above this class (Codex
  /// round-3 finding: instance-field placement breaks if the notifier
  /// is invalidated mid-refresh).
  ///
  /// On `success`: updates the store's access token.
  /// On `authFailure`: clears tokens and sets `needsReauth = true`.
  /// On `transientFailure`: leaves state untouched; caller logs/retries.
  ///
  /// Concurrent callers share one in-flight refresh.
  Future<RefreshOutcome> refreshUiAccessToken({
    required GraphQLClient gqlClient,
  }) async {
    final inFlight = _refreshInFlight;
    if (inFlight != null) return inFlight.future;

    final completer = Completer<RefreshOutcome>();
    _refreshInFlight = completer;
    try {
      final outcome = await _refreshUiAccessTokenImpl(gqlClient);
      completer.complete(outcome);
      return outcome;
    } catch (e, st) {
      // _refreshUiAccessTokenImpl handles its own errors; this catch is
      // strictly defensive. A throw here is a programmer error, not an
      // auth/network failure — surface it transient so we don't wipe
      // tokens for the wrong reason.
      debugPrint('refreshUiAccessToken: unexpected throw: $e\n$st');
      final outcome = RefreshOutcome.transientFailure(e);
      completer.complete(outcome);
      return outcome;
    } finally {
      _refreshInFlight = null;
    }
  }

  Future<RefreshOutcome> _refreshUiAccessTokenImpl(
      GraphQLClient gqlClient) async {
    final store = ref.read(authCredentialsStoreProvider.notifier);
    final tokens = store.uiLoginTokens();
    if (tokens == null) {
      // No tokens to refresh = nothing more we can do. This is treated
      // as auth failure (the user must log in again) rather than
      // transient — there's no path forward without re-auth.
      ref.read(needsReauthProvider.notifier).set(true);
      return const RefreshOutcome.authFailure();
    }

    final QueryResult<Mutation$RefreshToken> result;
    try {
      result = await gqlClient.mutate$RefreshToken(
        Options$Mutation$RefreshToken(
          variables: Variables$Mutation$RefreshToken(
            input: Input$RefreshTokenInput(refreshToken: tokens.refreshToken),
          ),
        ),
      );
    } catch (e, st) {
      // Network/socket/timeout — DON'T clear tokens. The refresh token
      // may still be perfectly good; we just couldn't reach the server.
      debugPrint('refreshToken network error: $e\n$st');
      return RefreshOutcome.transientFailure(e);
    }

    final exception = result.exception;
    if (exception != null) {
      // Distinguish network-style GraphQL errors (linkException) from
      // server-rejected auth errors (graphqlErrors with 401-ish status).
      //
      // Codex round-3 finding: not every linkException is transient.
      // Suwayomi's refresh-token rejection can arrive as
      // `HttpLinkServerException` with HTTP 401/403 — that's an AUTH
      // failure, not a network blip. We need to inspect the inner
      // exception's status code before classifying.
      final link = exception.linkException;
      if (link != null) {
        final status = _httpStatusOfLinkException(link);
        if (status == 401 || status == 403) {
          // Server actively rejected the refresh token at the HTTP
          // layer. Treat as auth failure.
          await store.clearUiLoginTokens();
          ref.read(needsReauthProvider.notifier).set(true);
          return const RefreshOutcome.authFailure();
        }
        // Other link exceptions (socket, timeout, server 5xx) are
        // transient — keep tokens, let the user retry.
        return RefreshOutcome.transientFailure(exception);
      }
      // GraphQL errors (non-link) here mean the server actively
      // rejected the refresh token at the GraphQL layer — clear and
      // prompt re-auth.
      await store.clearUiLoginTokens();
      ref.read(needsReauthProvider.notifier).set(true);
      return const RefreshOutcome.authFailure();
    }

    final newAccess = result.parsedData?.refreshToken.accessToken;
    if (newAccess == null) {
      // No exception, but no token either — treat as auth failure.
      await store.clearUiLoginTokens();
      ref.read(needsReauthProvider.notifier).set(true);
      return const RefreshOutcome.authFailure();
    }
    await store.updateUiLoginAccessToken(newAccess);
    return RefreshOutcome.success(newAccess);
  }

  /// Runs the appropriate verify-only round-trip and returns a typed
  /// [TestConnectionResult]. **Does not persist credentials** — caller
  /// must call [loginSimple] / [loginUi] explicitly to commit. This way
  /// hitting Test → Cancel leaves prior config untouched.
  Future<TestConnectionResult> testConnection({
    required AuthType authType,
    required String serverBaseUrl,
    required String username,
    required String password,
    required GraphQLClient Function() makeGqlClient,
  }) async {
    try {
      if (authType == AuthType.simpleLogin) {
        await verifySimpleCredentials(
          serverBaseUrl: serverBaseUrl,
          username: username,
          password: password,
        );
      } else if (authType == AuthType.uiLogin) {
        await verifyUiCredentials(
          gqlClient: makeGqlClient(),
          username: username,
          password: password,
        );
      } else {
        return const TestConnectionFailure(
            TestConnectionFailureKind.unexpectedShape,
            'testConnection only supports simpleLogin or uiLogin');
      }
    } catch (e) {
      return classifyAuthError(e);
    }
    return const TestConnectionSuccess();
  }
}
