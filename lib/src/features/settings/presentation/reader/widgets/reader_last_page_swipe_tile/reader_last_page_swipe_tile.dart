// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../constants/db_keys.dart';
import '../../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../../utils/mixin/shared_preferences_client_mixin.dart';
import '../reader_swipe_toggle_tile/reader_swipe_chapter_toggle_tile.dart';

part 'reader_last_page_swipe_tile.g.dart';

@riverpod
class LastPageSwipeEnabled extends _$LastPageSwipeEnabled
    with SharedPreferenceClientMixin<bool> {
  @override
  bool? build() => initialize(DBKeys.lastPageSwipeEnabled);
}

class ReaderLastPageSwipeTile extends HookConsumerWidget {
  const ReaderLastPageSwipeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final swipeChapterToggle = ref.watch(swipeChapterToggleProvider);
    final lastPageSwipeEnabled = ref.watch(lastPageSwipeEnabledProvider);

    // Only show this setting when main swipe toggle is DISABLED
    final showTile = !(swipeChapterToggle ?? DBKeys.swipeToggle.initial);

    if (!showTile) return const SizedBox.shrink();

    return SwitchListTile(
      controlAffinity: ListTileControlAffinity.trailing,
      secondary: const Icon(Icons.swipe_right_rounded),
      title: Text(context.l10n.readerLastPageSwipeToggle),
      subtitle: Text(context.l10n.readerLastPageSwipeToggleDescription),
      onChanged: ref.read(lastPageSwipeEnabledProvider.notifier).update,
      value: lastPageSwipeEnabled.ifNull(),
    );
  }
}
