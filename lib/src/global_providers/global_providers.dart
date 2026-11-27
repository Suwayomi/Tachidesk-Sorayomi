// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:queue/queue.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/db_keys.dart';
import '../constants/endpoints.dart';
import '../constants/enum.dart';
import '../features/auth/data/auth_coordinator.dart';
import '../features/auth/data/auth_credentials_store.dart';
import '../features/auth/data/auth_state.dart';
import '../features/auth/data/suwayomi_auth_link.dart';
import '../features/settings/presentation/general/timeout_settings/timeout_settings_section.dart';
import '../features/settings/presentation/server/widget/client/server_port_tile/server_port_tile.dart';
import '../features/settings/presentation/server/widget/client/server_url_tile/server_url_tile.dart';
import '../features/settings/presentation/server/widget/credential_popup/credentials_popup.dart';
import '../utils/extensions/custom_extensions.dart';
import '../utils/logger/logger_link.dart';
import '../utils/mixin/shared_preferences_client_mixin.dart';
import '../utils/network/timeout_http_client.dart';

part 'global_providers.g.dart';

@riverpod
GraphQLClient graphQlClient(Ref ref) {
  final authType = ref.watch(authTypeKeyProvider) ?? DBKeys.authType.initial;
  final credentials = ref.watch(credentialsProvider).valueOrNull;

  // Timeout settings
  final timeoutMs = ref.watch(serverRequestTimeoutProvider) ??
      DBKeys.serverRequestTimeout.initial as int;
  final autoRetry = ref.watch(autoRefreshOnTimeoutProvider).ifNull();
  final retryDelayMs = ref.watch(autoRefreshRetryDelayProvider) ??
      DBKeys.autoRefreshRetryDelay.initial as int;

  final effectiveTimeoutMs = autoRetry
      ? (retryDelayMs < timeoutMs ? retryDelayMs : timeoutMs)
      : timeoutMs;

  final retryCount = autoRetry
      ? ((timeoutMs / retryDelayMs).ceil() - 1).clamp(0, 10)
      : 0; // cap at 10 retries for safety

  Link link = HttpLink(
    Endpoints.baseApi(
      baseUrl: ref.watch(serverUrlProvider) ?? DBKeys.serverUrl.initial,
      port: ref.watch(serverPortProvider),
      addPort: ref.watch(serverPortToggleProvider).ifNull(),
      isGraphQl: true,
    ),
    followRedirects: true,
    // httpResponseDecoder: httpResponseDecoder,
    defaultHeaders: {'Content-Type': 'application/json; charset=utf-8'},
    httpClient: TimeoutHttpClient(
      Duration(milliseconds: effectiveTimeoutMs),
      retries: retryCount,
      retryDelay: Duration(milliseconds: retryDelayMs),
    ),
  );

  // Auto retry is handled by TimeoutHttpClient retries instead of RetryLink

  // Basic authentication link (unchanged).
  if (authType == AuthType.basic && credentials.isNotBlank) {
    final AuthLink authLink = AuthLink(getToken: () => credentials);
    link = authLink.concat(link);
  }

  // simple_login / ui_login link.
  if (authType == AuthType.simpleLogin || authType == AuthType.uiLogin) {
    final suwayomiAuthLink = SuwayomiAuthLink(
      authType: () => authType,
      getHeaders: () async {
        // Synchronously read the cached snapshot — populated at startup
        // by the eager `await container.read(...future)` in main(). We
        // read via `.future` defensively in case a caller invokes a
        // GraphQL operation before the preload finishes.
        final snapshot =
            await ref.read(authCredentialsStoreProvider.future);
        return authType == AuthType.simpleLogin
            ? snapshot.simpleLoginCookieHeader
            : snapshot.uiAuthorizationHeader;
      },
      refreshAccessToken: () async {
        // Refresh path only applies to ui_login. For simple_login the
        // Link short-circuits before invoking this callback, so any
        // value works; AuthFailure is the most semantically truthful.
        if (authType != AuthType.uiLogin) {
          return const RefreshAuthFailure();
        }
        // Use a NON-authed GraphQL client to avoid recursion: the refresh
        // mutation must NOT go through SuwayomiAuthLink itself. The
        // AuthCoordinator owns single-flight dedup (R2-3), so both Link
        // instances (query + subscription) share one refresh through it.
        final rawClient = GraphQLClient(
          link: HttpLink(Endpoints.baseApi(
            baseUrl: ref.read(serverUrlProvider) ?? DBKeys.serverUrl.initial,
            port: ref.read(serverPortProvider),
            addPort: ref.read(serverPortToggleProvider).ifNull(),
            isGraphQl: true,
          )),
          cache: GraphQLCache(),
        );
        return await ref
            .read(authCoordinatorProvider.notifier)
            .refreshUiAccessToken(gqlClient: rawClient);
      },
      onNeedsReauth: () {
        ref.read(needsReauthProvider.notifier).set(true);
      },
    );
    link = suwayomiAuthLink.concat(link);
  }

  final loggerLink = LoggerLink();
  return GraphQLClient(
    link: loggerLink.concat(link),
    defaultPolicies: DefaultPolicies(
      query: Policies(fetch: FetchPolicy.noCache),
    ),
    cache: GraphQLCache(store: ref.watch(hiveStoreProvider)),
  );
}

@riverpod
GraphQLClient graphQlSubscriptionClient(Ref ref) {
  final authType = ref.watch(authTypeKeyProvider) ?? DBKeys.authType.initial;
  final credentials = ref.watch(credentialsProvider).valueOrNull;
  final wsUrl = Endpoints.baseApi(
    baseUrl: ref.watch(serverUrlProvider) ?? DBKeys.serverUrl.initial,
    port: ref.watch(serverPortProvider),
    addPort: ref.watch(serverPortToggleProvider).ifNull(),
    isGraphQl: true,
    isWebsocket: true,
  );

  // Authenticate the SOCKET itself, not a per-operation Link. A header /
  // context Link (AuthLink / SuwayomiAuthLink) never reaches the WebSocket,
  // so it leaves the connection unauthenticated and any @requireAuth
  // subscription (e.g. downloadStatusChanged) fails with "Unauthorized" —
  // while auth-exempt subscriptions (updateStatusChanged) still work, which
  // is what made this look downloads-specific.
  //
  // graphql-transport-ws carries auth two ways, matching Suwayomi-Server:
  //   * ui_login  -> connection_init payload `{Authorization: <bare token>}`
  //                  (server `onInit` does NOT strip "Bearer "; the WebUI
  //                  sends the bare token, so we do too).
  //   * simple_login / basic -> the WS handshake (upgrade) headers.
  dynamic initialPayload;
  Map<String, String>? handshakeHeaders;
  if (authType == AuthType.uiLogin) {
    initialPayload = () async {
      final snapshot = await ref.read(authCredentialsStoreProvider.future);
      final token = snapshot.uiAccessToken;
      return (token == null || token.isEmpty)
          ? <String, dynamic>{}
          : <String, dynamic>{'Authorization': token};
    };
  } else if (authType == AuthType.simpleLogin) {
    handshakeHeaders = ref
        .read(authCredentialsStoreProvider)
        .valueOrNull
        ?.simpleLoginCookieHeader;
  } else if (authType == AuthType.basic && credentials.isNotBlank) {
    handshakeHeaders = {'Authorization': credentials!};
  }

  final Link link = WebSocketLink(
    wsUrl,
    subProtocol: GraphQLProtocol.graphqlTransportWs,
    config: SocketClientConfig(
      initialPayload: initialPayload,
      headers: handshakeHeaders,
    ),
  );

  final loggerLink = LoggerLink();
  return GraphQLClient(
    link: loggerLink.concat(link),
    defaultPolicies: DefaultPolicies(
      query: Policies(fetch: FetchPolicy.noCache),
    ),
    cache: GraphQLCache(store: ref.watch(hiveStoreProvider)),
  );
}

@riverpod
ValueNotifier<GraphQLClient> graphQlClientNotifier(Ref ref) {
  final notifier = ValueNotifier(ref.watch(graphQlClientProvider));
  // Dispose of the notifier when the provider is destroyed
  ref.onDispose(notifier.dispose);

  // Notify listeners of this provider whenever the ValueNotifier updates.
  notifier.addListener(ref.notifyListeners);

  return notifier;
}

@riverpod
class AuthTypeKey extends _$AuthTypeKey
    with SharedPreferenceEnumClientMixin<AuthType> {
  @override
  AuthType? build() => initialize(
        DBKeys.authType,
        enumList: AuthType.values,
      );
}

@riverpod
class L10n extends _$L10n with SharedPreferenceClientMixin<Locale> {
  Map<String, String> toJson(Locale locale) => {
        if (locale.countryCode.isNotBlank) "countryCode": locale.countryCode!,
        if (locale.languageCode.isNotBlank) "languageCode": locale.languageCode,
        if (locale.scriptCode.isNotBlank) "scriptCode": locale.scriptCode!,
      };
  Locale? fromJson(dynamic json) =>
      json is! Map<String, dynamic> || (json["languageCode"] == null)
          ? null
          : Locale.fromSubtags(
              languageCode: json["languageCode"]!.toString(),
              scriptCode: json["scriptCode"]?.toString(),
              countryCode: json["countryCode"]?.toString(),
            );
  @override
  Locale? build() => initialize(
        DBKeys.l10n,
        fromJson: fromJson,
        toJson: toJson,
      );
}

@riverpod
SharedPreferences sharedPreferences(ref) => throw UnimplementedError();

@riverpod
HiveStore hiveStore(Ref ref) => throw UnimplementedError();

@riverpod
Queue rateLimitQueue(Ref ref, [String? query]) {
  final queue = Queue(
    parallel: 3,
    delay: const Duration(milliseconds: 500),
  );
  ref.onDispose(() {
    queue.cancel();
  });
  return queue;
}
