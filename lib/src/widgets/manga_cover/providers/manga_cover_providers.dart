// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/db_keys.dart';
import '../../../utils/storage/local/shared_preferences_client.dart';

part 'manga_cover_providers.g.dart';

@riverpod
class DownloadedBadge extends _$DownloadedBadge
    with SharedPreferenceClient<bool> {
  @override
  bool? build() => initialize(
        ref,
        client: ref.watch(sharedPreferencesProvider),
        key: DBKeys.downloadedBadge.name,
        initial: DBKeys.downloadedBadge.initial,
      );
}

@riverpod
class UnreadBadge extends _$UnreadBadge with SharedPreferenceClient<bool> {
  @override
  bool? build() => initialize(
        ref,
        client: ref.watch(sharedPreferencesProvider),
        key: DBKeys.unreadBadge.name,
        initial: DBKeys.unreadBadge.initial,
      );
}

// @riverpod
// class LanguageBadge extends _$LanguageBadge
//     with SharedPreferenceClient<bool> {
//   @override
//   bool? build() => initialize(
//   client: ref.watch(sharedPreferencesProvider),
//   key: DBKeys.languageBadge.name,
//   initial: DBKeys.languageBadge.initial,
// );
// }
