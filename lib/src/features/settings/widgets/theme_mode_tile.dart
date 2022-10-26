import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tachidesk_sorayomi/src/features/settings/data/local_settings_repository.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';

import 'package:tachidesk_sorayomi/src/constants/db_keys.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/context_extensions.dart';
import 'package:tachidesk_sorayomi/src/utils/network/sembast/sembast_client.dart';
import 'package:tachidesk_sorayomi/src/widgets/enum_popup.dart';

final themeModeProvider = Provider.autoDispose(
  (ref) => LocalEnumSettingsRepository<ThemeMode>(
    enumList: ThemeMode.values,
    client: ref.watch(settingsLocalProvider),
    key: DBKeys.themeMode,
  ),
);

class AppThemeTile extends HookConsumerWidget {
  const AppThemeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode =
        useStream<ThemeMode?>(ref.watch(themeModeProvider).getStream());
    return ListTile(
      leading: Icon(
        context.isDarkMode ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
      ),
      subtitle: themeMode.hasData ? Text(themeMode.data.toString().tr()) : null,
      title: Text(LocaleKeys.appearanceScreen_appTheme.tr()),
      onTap: () => showDialog(
        context: context,
        useRootNavigator: false,
        builder: (context) => EnumPopup<ThemeMode>(
          enumList: ThemeMode.values,
          value: themeMode.data ?? ThemeMode.system,
          onChange: (enumValue) => ref
              .read(themeModeProvider)
              .update(enumValue)
              .then((value) => context.navPop()),
          onCancel: context.navPop,
        ),
      ),
    );
  }
}
