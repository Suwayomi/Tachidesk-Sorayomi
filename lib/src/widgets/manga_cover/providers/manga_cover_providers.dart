// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/db_keys.dart';
import '../../../utils/mixin/shared_preferences_client_mixin.dart';

part 'manga_cover_providers.g.dart';

@riverpod
class DownloadedBadge extends _$DownloadedBadge
    with SharedPreferenceClientMixin<bool> {
  @override
  bool? build() => initialize(DBKeys.downloadedBadge);
}

@riverpod
class UnreadBadge extends _$UnreadBadge with SharedPreferenceClientMixin<bool> {
  @override
  bool? build() => initialize(DBKeys.unreadBadge);
}

// @riverpod
// class LanguageBadge extends _$LanguageBadge
//     with SharedPreferenceClient<bool> {
//   @override
//   bool? build() => initialize(
//
//   key: DBKeys.languageBadge.name,
//   initial: DBKeys.languageBadge.initial,
// );
// }
