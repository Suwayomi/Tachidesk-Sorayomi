// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../constants/db_keys.dart';
import '../../../../../../constants/enum.dart';
import '../../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../../utils/mixin/shared_preferences_client_mixin.dart';
import '../reader_mode_tile/reader_mode_tile.dart';

part 'reader_infinity_scrolling_mode_tile.g.dart';

@riverpod
class InfinityScrollingModeEnabled extends _$InfinityScrollingModeEnabled
    with SharedPreferenceClientMixin<bool> {
  @override
  bool? build() => initialize(DBKeys.infinityScrollingMode);
}

class ReaderInfinityScrollingModeTile extends HookConsumerWidget {
  const ReaderInfinityScrollingModeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final infinityScrollingMode = ref.watch(infinityScrollingModeEnabledProvider);
    final readerMode = ref.watch(readerModeKeyProvider);

    // Only show this setting for webtoon mode
    final showTile = readerMode == ReaderMode.webtoon;

    if (!showTile) return const SizedBox.shrink();

    return SwitchListTile(
      controlAffinity: ListTileControlAffinity.trailing,
      secondary: const Icon(Icons.all_inclusive_rounded),
      title: Text(context.l10n.readerInfinityScrollingMode),
      subtitle: Text(context.l10n.readerInfinityScrollingModeDescription),
      onChanged: ref.read(infinityScrollingModeEnabledProvider.notifier).update,
      value: infinityScrollingMode.ifNull(),
    );
  }
}
