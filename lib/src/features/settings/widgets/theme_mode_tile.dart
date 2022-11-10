// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 🌎 Project imports:
import 'package:tachidesk_sorayomi/src/utils/storage/local/shared_preferences_client.dart';
import '../../../constants/db_keys.dart';
import '../../../i18n/locale_keys.g.dart';
import '../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../widgets/enum_popup.dart';

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

class AppThemeTile extends HookConsumerWidget {
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
          onChange: (enumValue) => ref
              .read(themeModeKeyProvider.notifier)
              .update(enumValue)
              .then((value) => context.navPop()),
        ),
      ),
    );
  }
}
