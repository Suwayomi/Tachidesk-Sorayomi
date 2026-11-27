// Copyright (c) 2026 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:async';

import 'package:graphql/client.dart';

import '../../../constants/enum.dart';
import 'auth_coordinator.dart';

/// Custom GraphQL Link for Suwayomi's `simple_login` and `ui_login` modes.
///
/// Responsibilities:
///   1. Inject auth headers (Authorization for ui_login, Cookie for
///      simple_login) onto every outgoing request.
///   2. On HTTP 401 responses:
///      - ui_login: delegate refresh to [refreshAccessToken] (which is
///        single-flighted at the AuthCoordinator layer — see R2-3 — so
///        the query and subscription Links share one in-flight refresh).
///        On success retry once; on auth failure surface the 401; on
///        transient failure surface the original 401 unchanged.
///      - simple_login: signal needs-reauth and bubble the 401 up. No
///        refresh path exists for simple_login.
///   3. Re-check the retried response for a second 401. If the retry
///      also returns 401, treat as auth failure (clear tokens, set
///      needs-reauth) and surface the 401 to the caller — R2-4.
///
/// **Subscription caveat (Codex round-3 finding):** This Link only
/// inspects the FIRST event of each forwarded stream for 401. A
/// long-lived GraphQL subscription that emits data successfully and
/// THEN gets a 401 mid-stream (e.g. server-side session timeout while
/// the WebSocket is open) will yield the 401 to the caller without
/// triggering refresh. Suwayomi's GraphQL surface uses subscriptions
/// only for server-status/download-progress, which are short-lived and
/// rate-limited — the failure mode is mostly cosmetic (the next request
/// will hit 401, trigger refresh, and resume). If a future Suwayomi
/// version adds long-running subscriptions, this Link needs an
/// inspect-every-event variant.
class SuwayomiAuthLink extends Link {
  SuwayomiAuthLink({
    required this.authType,
    required this.getHeaders,
    required this.refreshAccessToken,
    required this.onNeedsReauth,
  });

  /// Returns the current AuthType.
  final AuthType Function() authType;

  /// Returns the headers to inject for the current auth mode, or null if
  /// nothing should be injected. Called per request.
  final Future<Map<String, String>?> Function() getHeaders;

  /// Performs a refresh and returns a typed [RefreshOutcome]. Called only
  /// for ui_login on 401. The implementation in `AuthCoordinator`
  /// handles single-flighting across both Link instances; this Link does
  /// not need its own Completer.
  final Future<RefreshOutcome> Function() refreshAccessToken;

  /// Invoked when the link concludes the session is dead. Implementations
  /// typically set NeedsReauth=true.
  final void Function() onNeedsReauth;

  @override
  Stream<Response> request(Request request, [NextLink? forward]) async* {
    final headers = await getHeaders();
    final withHeaders = headers == null
        ? request
        : request.updateContextEntry<HttpLinkHeaders>(
            (HttpLinkHeaders? entry) => HttpLinkHeaders(
              headers: <String, String>{
                ...?entry?.headers,
                ...headers,
              },
            ),
          );

    // Iterate the forwarded stream. We inspect only the FIRST event to
    // decide whether we have a 401 → retry case; every other event flows
    // through unchanged. Using `await forward!(withHeaders).first` would
    // cancel the subscription after one event, silently killing any
    // GraphQL subscription that doesn't immediately fail.
    Response? first401;
    var sawFirst = false;
    await for (final response in forward!(withHeaders)) {
      if (!sawFirst) {
        sawFirst = true;
        if (_is401(response)) {
          // Cache the 401 and break out to handle refresh/retry below.
          // We're cancelling the upstream stream here — that's fine for
          // queries/mutations (they only emit one response anyway) and
          // for subscriptions a 401 means the server rejected the
          // connection, so there's nothing useful to keep streaming.
          first401 = response;
          break;
        }
      }
      yield response;
    }

    if (first401 == null) {
      // Success path: stream already drained and yielded. Done.
      return;
    }

    // 401 path.
    if (authType() != AuthType.uiLogin) {
      // simple_login has no refresh path.
      onNeedsReauth();
      yield first401;
      return;
    }

    // ui_login: delegate refresh to AuthCoordinator. The coordinator
    // owns the single-flight Completer (R2-3) so concurrent 401s in the
    // query and subscription clients share one refresh.
    final outcome = await refreshAccessToken();
    switch (outcome) {
      case RefreshAuthFailure():
        // Refresh token rejected. Tokens already cleared by the
        // coordinator. Surface the original 401.
        onNeedsReauth();
        yield first401;
        return;
      case RefreshTransientFailure():
        // Network / server error — DON'T mark session as dead. Surface
        // the original 401 so the UI shows a normal error; the next
        // request will trigger another refresh attempt.
        yield first401;
        return;
      case RefreshSuccess(:final newAccessToken):
        // Retry once with the fresh token. R2-4: re-check the retried
        // response for a second 401. If it's still 401, the new token
        // didn't work either — treat as auth failure.
        final retried = request.updateContextEntry<HttpLinkHeaders>(
          (HttpLinkHeaders? entry) => HttpLinkHeaders(
            headers: <String, String>{
              ...?entry?.headers,
              'Authorization': 'Bearer $newAccessToken',
            },
          ),
        );
        Response? retryFirst401;
        var sawRetryFirst = false;
        await for (final response in forward(retried)) {
          if (!sawRetryFirst) {
            sawRetryFirst = true;
            if (_is401(response)) {
              retryFirst401 = response;
              break;
            }
          }
          yield response;
        }
        if (retryFirst401 != null) {
          // Second 401 after a fresh token = something's off (server
          // rotated mid-flight, fresh token rejected, etc). Clear and
          // require re-auth.
          onNeedsReauth();
          yield retryFirst401;
        }
        return;
    }
  }

  bool _is401(Response response) {
    final errors = response.errors;
    if (errors == null) return false;
    for (final err in errors) {
      final http = err.extensions?['http'] as Map?;
      final status = http?['status'];
      if (status == 401) return true;
      if (err.message.toLowerCase().contains('unauthor')) return true;
    }
    return false;
  }
}
