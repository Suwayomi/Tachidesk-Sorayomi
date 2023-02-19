// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/db_keys.dart';
import '../constants/enum.dart';
import '../features/settings/presentation/server/widget/credential_popup/credentials_popup.dart';
import '../features/settings/widgets/server_url_tile/server_url_tile.dart';
import '../utils/extensions/custom_extensions.dart';
import '../utils/storage/dio/dio_client.dart';
import '../utils/storage/dio/network_module.dart';
import '../utils/storage/local/shared_preferences_client.dart';

part 'global_providers.g.dart';

@riverpod
DioClient dioClientKey(ref) => DioClient(
      dio: ref.watch(networkModuleProvider).provideDio(
            baseUrl: ref.watch(serverUrlProvider) ?? DBKeys.serverUrl.initial,
            authType: ref.watch(authTypeKeyProvider) ?? DBKeys.authType.initial,
            credentials: ref.watch(credentialsProvider),
          ),
    );

@riverpod
class AuthTypeKey extends _$AuthTypeKey
    with SharedPreferenceEnumClient<AuthType> {
  @override
  AuthType? build() => initialize(
        ref,
        initial: DBKeys.authType.initial,
        key: DBKeys.authType.name,
        enumList: AuthType.values,
      );
}

@riverpod
class L10n extends _$L10n with SharedPreferenceClient<Locale> {
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
