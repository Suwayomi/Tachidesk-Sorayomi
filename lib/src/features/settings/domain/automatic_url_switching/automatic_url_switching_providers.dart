// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../constants/db_keys.dart';
import '../../../../utils/mixin/shared_preferences_client_mixin.dart';

part 'automatic_url_switching_providers.g.dart';

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
