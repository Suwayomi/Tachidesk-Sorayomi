// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:queue/queue.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/db_keys.dart';
import '../constants/endpoints.dart';
import '../constants/enum.dart';
import '../features/settings/domain/automatic_url_switching/external_url_config.dart';
import '../features/settings/domain/automatic_url_switching/local_network_config.dart';
import '../features/settings/domain/network_detector/network_detector.dart';
import '../features/settings/presentation/server/widget/client/server_port_tile/server_port_tile.dart';
import '../features/settings/presentation/server/widget/client/server_url_tile/server_url_tile.dart';
import '../features/settings/presentation/server/widget/credential_popup/credentials_popup.dart';
import '../utils/extensions/custom_extensions.dart';
import '../utils/logger/logger_link.dart';
import '../utils/mixin/shared_preferences_client_mixin.dart';

part 'global_providers.g.dart';

@riverpod
GraphQLClient graphQlClient(Ref ref) {
  final authType = ref.watch(authTypeKeyProvider) ?? DBKeys.authType.initial;
  final credentials = ref.watch(credentialsProvider);

  // Use automatic URL switching if enabled, otherwise fall back to manual URL
  final automaticSwitching = ref.watch(automaticUrlSwitchingProvider);
  String baseUrl;

  if (automaticSwitching == true) {
    // Watch the active server URL which handles automatic switching
    final activeUrl = ref.watch(activeServerUrlProvider);
    baseUrl = activeUrl.when(
      data: (url) =>
          url ?? ref.watch(serverUrlProvider) ?? DBKeys.serverUrl.initial,
      loading: () => ref.watch(serverUrlProvider) ?? DBKeys.serverUrl.initial,
      error: (_, __) =>
          ref.watch(serverUrlProvider) ?? DBKeys.serverUrl.initial,
    );
  } else {
    baseUrl = ref.watch(serverUrlProvider) ?? DBKeys.serverUrl.initial;
  }

  Link link = HttpLink(
    Endpoints.baseApi(
      baseUrl: baseUrl,
      port: ref.watch(serverPortProvider),
      addPort: ref.watch(serverPortToggleProvider).ifNull(),
      isGraphQl: true,
    ),
    followRedirects: true,
    // httpResponseDecoder: httpResponseDecoder,
    defaultHeaders: {'Content-Type': 'application/json; charset=utf-8'},
  );
  if (authType == AuthType.basic && credentials.isNotBlank) {
    final AuthLink authLink = AuthLink(getToken: () => credentials);
    link = authLink.concat(link);
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
  final credentials = ref.watch(credentialsProvider);

  // Use automatic URL switching if enabled, otherwise fall back to manual URL
  final automaticSwitching = ref.watch(automaticUrlSwitchingProvider);
  String baseUrl;

  if (automaticSwitching == true) {
    // Watch the active server URL which handles automatic switching
    final activeUrl = ref.watch(activeServerUrlProvider);
    baseUrl = activeUrl.when(
      data: (url) =>
          url ?? ref.watch(serverUrlProvider) ?? DBKeys.serverUrl.initial,
      loading: () => ref.watch(serverUrlProvider) ?? DBKeys.serverUrl.initial,
      error: (_, __) =>
          ref.watch(serverUrlProvider) ?? DBKeys.serverUrl.initial,
    );
  } else {
    baseUrl = ref.watch(serverUrlProvider) ?? DBKeys.serverUrl.initial;
  }

  Link link = WebSocketLink(
      Endpoints.baseApi(
        baseUrl: baseUrl,
        port: ref.watch(serverPortProvider),
        addPort: ref.watch(serverPortToggleProvider).ifNull(),
        isGraphQl: true,
        isWebsocket: true,
      ),
      subProtocol: GraphQLProtocol.graphqlTransportWs);
  if (authType == AuthType.basic && credentials.isNotBlank) {
    final AuthLink authLink = AuthLink(getToken: () => credentials);
    link = authLink.concat(link);
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

// Automatic URL Switching providers
@riverpod
class AutomaticUrlSwitching extends _$AutomaticUrlSwitching
    with SharedPreferenceClientMixin<bool> {
  @override
  bool? build() => initialize(DBKeys.automaticUrlSwitching);
}

@riverpod
class LocalNetworkWifiName extends _$LocalNetworkWifiName
    with SharedPreferenceClientMixin<String> {
  @override
  String? build() => initialize(DBKeys.localNetworkWifiName);
}

@riverpod
class LocalNetworkServerUrl extends _$LocalNetworkServerUrl
    with SharedPreferenceClientMixin<String> {
  @override
  String? build() => initialize(DBKeys.localNetworkServerUrl);
}

@riverpod
class LocalNetworkConfigs extends _$LocalNetworkConfigs {
  @override
  List<LocalNetworkConfig>? build() {
    final stringList = ref.read(sharedPreferencesProvider).getStringList(DBKeys.localNetworkConfigs.name);
    if (stringList == null) return null;
    
    return stringList.map((jsonString) {
      try {
        final json = Map<String, dynamic>.from(
          jsonDecode(jsonString) as Map
        );
        return LocalNetworkConfig.fromJson(json);
      } catch (e) {
        // For backward compatibility, treat as plain config
        return LocalNetworkConfig(
          wifiName: 'Unknown',
          serverUrl: jsonString,
        );
      }
    }).toList();
  }

  void addLocalNetwork(LocalNetworkConfig config) {
    final currentList = state ?? <LocalNetworkConfig>[];
    if (!currentList.any((item) => item.wifiName == config.wifiName)) {
      final updatedList = [...currentList, config];
      _saveToPreferences(updatedList);
      state = updatedList;
    }
  }

  void removeLocalNetwork(String wifiName) {
    final currentList = state ?? <LocalNetworkConfig>[];
    final updatedList = currentList.where((item) => item.wifiName != wifiName).toList();
    _saveToPreferences(updatedList);
    state = updatedList;
  }

  void updateLocalNetwork(int index, LocalNetworkConfig newConfig) {
    final currentList = state ?? <LocalNetworkConfig>[];
    if (index >= 0 && index < currentList.length) {
      final updatedList = [...currentList];
      updatedList[index] = newConfig;
      _saveToPreferences(updatedList);
      state = updatedList;
    }
  }

  void _saveToPreferences(List<LocalNetworkConfig> configs) {
    final jsonStrings = configs.map((config) => 
      jsonEncode(config.toJson())
    ).toList();
    ref.read(sharedPreferencesProvider).setStringList(DBKeys.localNetworkConfigs.name, jsonStrings);
  }
}

// Keep the old provider for backward compatibility but deprecate it
@riverpod
class ExternalNetworkUrlConfigs extends _$ExternalNetworkUrlConfigs {
  @override
  List<ExternalUrlConfig>? build() {
    final stringList = ref.read(sharedPreferencesProvider).getStringList(DBKeys.externalNetworkUrls.name);
    if (stringList == null) return null;
    
    return stringList.map((jsonString) {
      try {
        final json = Map<String, dynamic>.from(
          jsonDecode(jsonString) as Map
        );
        return ExternalUrlConfig.fromJson(json);
      } catch (e) {
        // For backward compatibility, treat as plain URL with no auth
        return ExternalUrlConfig(url: jsonString);
      }
    }).toList();
  }

  void addExternalUrl(ExternalUrlConfig config) {
    final currentList = state ?? <ExternalUrlConfig>[];
    if (!currentList.any((item) => item.url == config.url)) {
      final updatedList = [...currentList, config];
      _saveToPreferences(updatedList);
      state = updatedList;
    }
  }

  void removeExternalUrl(String url) {
    final currentList = state ?? <ExternalUrlConfig>[];
    final updatedList = currentList.where((item) => item.url != url).toList();
    _saveToPreferences(updatedList);
    state = updatedList;
  }

  void updateExternalUrl(int index, ExternalUrlConfig newConfig) {
    final currentList = state ?? <ExternalUrlConfig>[];
    if (index >= 0 && index < currentList.length) {
      final updatedList = [...currentList];
      updatedList[index] = newConfig;
      _saveToPreferences(updatedList);
      state = updatedList;
    }
  }

  void _saveToPreferences(List<ExternalUrlConfig> configs) {
    final jsonStrings = configs.map((config) => 
      jsonEncode(config.toJson())
    ).toList();
    ref.read(sharedPreferencesProvider).setStringList(DBKeys.externalNetworkUrls.name, jsonStrings);
  }
}

// Keep the old provider for backward compatibility but deprecate it
@riverpod
class ExternalNetworkUrls extends _$ExternalNetworkUrls
    with SharedPreferenceClientMixin<List<String>> {
  @override
  List<String>? build() => initialize(DBKeys.externalNetworkUrls);

  void addExternalUrl(String url) {
    final currentList = state ?? <String>[];
    if (!currentList.contains(url)) {
      update([...currentList, url]);
    }
  }

  void removeExternalUrl(String url) {
    final currentList = state ?? <String>[];
    update(currentList.where((item) => item != url).toList());
  }

  void updateExternalUrl(int index, String newUrl) {
    final currentList = state ?? <String>[];
    if (index >= 0 && index < currentList.length) {
      final updatedList = [...currentList];
      updatedList[index] = newUrl;
      update(updatedList);
    }
  }
}

@riverpod
class ActiveServerUrl extends _$ActiveServerUrl {
  @override
  Future<String?> build() async {
    // Listen to all relevant providers
    final automaticSwitching = ref.watch(automaticUrlSwitchingProvider);
    final localNetworkConfigs = ref.watch(localNetworkConfigsProvider);
    final externalUrlConfigs = ref.watch(externalNetworkUrlConfigsProvider);
    final manualServerUrl = ref.watch(serverUrlProvider);
    final serverPort = ref.watch(serverPortProvider);

    // If automatic switching is disabled, return manual URL
    if (automaticSwitching != true) {
      return manualServerUrl;
    }

    // Get current WiFi name
    final currentWifi = await NetworkDetector.getCurrentWifiName();

    // Check if we're on any configured local network
    if (currentWifi != null && localNetworkConfigs != null && localNetworkConfigs.isNotEmpty) {
      for (final config in localNetworkConfigs) {
        if (currentWifi.toLowerCase().contains(config.wifiName.toLowerCase())) {
          // Generate local network URL
          final generatedUrl = await NetworkDetector.generateLocalNetworkUrl(
            config.serverUrl,
            serverPort,
          );
          if (generatedUrl != null) {
            // Verify local server is reachable
            final isReachable =
                await NetworkDetector.isServerReachable(generatedUrl);
            if (isReachable) {
              return generatedUrl;
            }
          }
        }
      }
    }

    // Try external URLs (Note: Authentication will be handled separately in the future)
    if (externalUrlConfigs != null && externalUrlConfigs.isNotEmpty) {
      for (final config in externalUrlConfigs) {
        final isReachable = await NetworkDetector.isServerReachable(config.url);
        if (isReachable) {
          return config.url;
        }
      }
    }

    // Fallback to manual URL
    return manualServerUrl;
  }

  /// Force refresh the active URL
  void refresh() {
    ref.invalidateSelf();
  }
}
