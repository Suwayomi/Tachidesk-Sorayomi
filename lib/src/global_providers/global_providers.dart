// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:io';

import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/material.dart';
import 'package:queue/queue.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/db_keys.dart';
import '../constants/enum.dart';
import '../features/settings/presentation/server/widget/credential_popup/credentials_popup.dart';
import '../features/settings/widgets/server_port_tile/server_port_tile.dart';
import '../features/settings/widgets/server_url_tile/server_url_tile.dart';
import '../utils/extensions/custom_extensions.dart';
import '../utils/mixin/shared_preferences_client_mixin.dart';
import '../utils/storage/dio/dio_client.dart';
import '../utils/storage/dio/network_module.dart';

part 'global_providers.g.dart';

@riverpod
DioClient dioClientKey(DioClientKeyRef ref) => DioClient(
      dio: ref.watch(networkModuleProvider).provideDio(
            baseUrl: ref.watch(serverUrlProvider) ?? DBKeys.serverUrl.initial,
            port: ref.watch(serverPortProvider),
            addPort: ref.watch(serverPortToggleProvider).ifNull(),
            authType: ref.watch(authTypeKeyProvider) ?? DBKeys.authType.initial,
            credentials: ref.watch(credentialsProvider),
            hiveCacheStore: ref.watch(hiveCacheStoreProvider),
          ),
    );

@riverpod
class AuthTypeKey extends _$AuthTypeKey
    with SharedPreferenceEnumClientMixin<AuthType> {
  @override
  AuthType? build() => initialize(
        ref,
        initial: DBKeys.authType.initial,
        key: DBKeys.authType.name,
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
        ref,
        key: DBKeys.l10n.name,
        initial: DBKeys.l10n.initial,
        fromJson: fromJson,
        toJson: toJson,
      );
}

@riverpod
SharedPreferences sharedPreferences(ref) => throw UnimplementedError();

@riverpod
Directory? appDirectory(ref) => throw UnimplementedError();

@riverpod
HiveCacheStore hiveCacheStore(HiveCacheStoreRef ref) =>
    HiveCacheStore(ref.watch(appDirectoryProvider)?.path);

@riverpod
Queue rateLimitQueue(RateLimitQueueRef ref, [String? query]) {
  final queue = Queue(
    parallel: 3,
    delay: const Duration(milliseconds: 500),
  );
  ref.onDispose(() {
    queue.cancel();
  });
  return queue;
}
