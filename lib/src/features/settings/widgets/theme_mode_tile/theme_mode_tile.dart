// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../constants/db_keys.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions.dart';
import '../../../../utils/storage/local/shared_preferences_client.dart';
import '../../../../widgets/enum_popup.dart';

part 'theme_mode_tile.g.dart';

@riverpod
class ThemeModeKey extends _$ThemeModeKey
    with SharedPreferenceEnumClient<ThemeMode> {
  @override
  ThemeMode? build() {
    client = ref.watch(sharedPreferencesProvider);
    initial = DBKeys.themeMode.initial;
    key = DBKeys.themeMode.name;
    enumList = ThemeMode.values;
    return get;
  }
}

class AppThemeTile extends ConsumerWidget {
  const AppThemeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeKeyProvider);
    return ListTile(
      leading: Icon(
        context.isDarkMode ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
      ),
      subtitle: themeMode != null ? Text(themeMode.toString().tr()) : null,
      title: Text(LocaleKeys.appTheme.tr()),
      onTap: () => showDialog(
        context: context,
        builder: (context) => EnumPopup<ThemeMode>(
          enumList: ThemeMode.values,
          value: themeMode ?? ThemeMode.system,
          onChange: (enumValue) async {
            await ref.read(themeModeKeyProvider.notifier).update(enumValue);
            if (context.mounted) context.pop();
          },
        ),
      ),
    );
  }
}
