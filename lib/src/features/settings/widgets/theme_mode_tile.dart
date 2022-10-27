// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import 'package:tachidesk_sorayomi/src/utils/storage/local/shared_preferences_client.dart';
import '../../../constants/db_keys.dart';
import '../../../i18n/locale_keys.g.dart';
import '../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../widgets/enum_popup.dart';

final themeModeProvider =
    StateNotifierProvider<SharedPreferenceEnumNotifier<ThemeMode>, ThemeMode?>(
  (ref) {
    final client = ref.watch(sharedPreferencesProvider);
    final initial = client.getInt(DBKeys.themeMode.name);
    return SharedPreferenceEnumNotifier<ThemeMode>(
      enumList: ThemeMode.values,
      client: client,
      key: DBKeys.themeMode.name,
      initial: initial == null
          ? DBKeys.themeMode.initial
          : ThemeMode.values[initial],
    );
  },
);

class AppThemeTile extends HookConsumerWidget {
  const AppThemeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return ListTile(
      leading: Icon(
        context.isDarkMode ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
      ),
      subtitle: themeMode != null ? Text(themeMode.toString().tr()) : null,
      title: Text(LocaleKeys.appearanceScreen_appTheme.tr()),
      onTap: () => showDialog(
        context: context,
        useRootNavigator: false,
        builder: (context) => EnumPopup<ThemeMode>(
          enumList: ThemeMode.values,
          value: themeMode ?? ThemeMode.system,
          onChange: (enumValue) => ref
              .read(themeModeProvider.notifier)
              .update(enumValue)
              .then((value) => context.navPop()),
        ),
      ),
    );
  }
}
