// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../constants/db_keys.dart';
import '../../../i18n/locale_keys.g.dart';
import '../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../utils/network/sembast/sembast_client.dart';
import '../../../widgets/enum_popup.dart';
import '../data/local_settings_repository.dart';

final themeModeProvider = Provider(
  (ref) => LocalEnumSettingsRepository<ThemeMode>(
    enumList: ThemeMode.values,
    client: ref.watch(settingsLocalProvider),
    key: DBKeys.themeMode,
  ),
);

final themeModeStreamProvider = StreamProvider<ThemeMode?>(
    (ref) => ref.watch(themeModeProvider).getStream());

class AppThemeTile extends HookConsumerWidget {
  const AppThemeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeStreamProvider);
    return ListTile(
      leading: Icon(
        context.isDarkMode ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
      ),
      subtitle:
          themeMode.hasValue ? Text(themeMode.value.toString().tr()) : null,
      title: Text(LocaleKeys.appearanceScreen_appTheme.tr()),
      onTap: () => showDialog(
        context: context,
        useRootNavigator: false,
        builder: (context) => EnumPopup<ThemeMode>(
          enumList: ThemeMode.values,
          value: themeMode.valueOrNull ?? ThemeMode.system,
          onChange: (enumValue) => ref
              .read(themeModeProvider)
              .update(enumValue)
              .then((value) => context.navPop()),
        ),
      ),
    );
  }
}
