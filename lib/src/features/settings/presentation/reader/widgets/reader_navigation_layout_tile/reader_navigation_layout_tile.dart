// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 🌎 Project imports:
import '../../../../../../constants/db_keys.dart';
import '../../../../../../constants/enum.dart';
import '../../../../../../i18n/locale_keys.g.dart';
import '../../../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../../../utils/storage/local/shared_preferences_client.dart';
import '../../../../../../widgets/enum_popup.dart';

part 'reader_navigation_layout_tile.g.dart';

@riverpod
class ReaderNavigationLayoutKey extends _$ReaderNavigationLayoutKey
    with SharedPreferenceEnumClient<ReaderNavigationLayout> {
  @override
  ReaderNavigationLayout? build() {
    client = ref.watch(sharedPreferencesProvider);
    initial = DBKeys.readerNavigationLayout.initial;
    key = DBKeys.readerNavigationLayout.name;
    enumList = ReaderNavigationLayout.values;
    return get;
  }
}

class ReaderNavigationLayoutTile extends ConsumerWidget {
  const ReaderNavigationLayoutTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readerNavigationLayout = ref.watch(readerNavigationLayoutKeyProvider);
    return ListTile(
      leading: const Icon(Icons.touch_app_rounded),
      subtitle: readerNavigationLayout != null
          ? Text(readerNavigationLayout.toString().tr())
          : null,
      title: Text(LocaleKeys.readerNavigationLayout.tr()),
      onTap: () => showDialog(
        context: context,
        builder: (context) => EnumPopup<ReaderNavigationLayout>(
          enumList: ReaderNavigationLayout.values.sublist(1),
          value: readerNavigationLayout ?? ReaderNavigationLayout.disabled,
          onChange: (enumValue) => ref
              .read(readerNavigationLayoutKeyProvider.notifier)
              .update(enumValue)
              .then((value) => context.navPop()),
        ),
      ),
    );
  }
}