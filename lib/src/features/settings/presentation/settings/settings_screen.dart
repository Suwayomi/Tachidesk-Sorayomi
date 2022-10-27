// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';

// 🌎 Project imports:
import '../../../../i18n/locale_keys.g.dart';
import '../../../../routes/router_config.dart';
import '../../../../utils/extensions/custom_extensions/iterable_extensions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.screenTitle_settings.tr()),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(LocaleKeys.settingsScreen_appearance.tr()),
            leading: const Icon(Icons.color_lens_rounded),
            onTap: () => context
                .push([Routes.settings, Routes.appearanceSettings].toPath),
          ),
          ListTile(
            title: Text(LocaleKeys.settingsScreen_library.tr()),
            leading: const Icon(Icons.collections_bookmark_rounded),
            onTap: () =>
                context.push([Routes.settings, Routes.librarySettings].toPath),
          ),
          ListTile(
            title: Text(LocaleKeys.settingsScreen_reader.tr()),
            leading: const Icon(Icons.chrome_reader_mode_rounded),
            onTap: () =>
                context.push([Routes.settings, Routes.readerSettings].toPath),
          ),
          ListTile(
            title: Text(LocaleKeys.settingsScreen_browse.tr()),
            leading: const Icon(Icons.explore_rounded),
            onTap: () => context
                .push([Routes.settings, Routes.browseSettingsScreen].toPath),
          ),
          ListTile(
            title: Text(LocaleKeys.settingsScreen_backup.tr()),
            leading: const Icon(Icons.settings_backup_restore_rounded),
            onTap: () => context.push([Routes.settings, Routes.backup].toPath),
          ),
          ListTile(
            title: Text(LocaleKeys.settingsScreen_server.tr()),
            leading: const Icon(Icons.computer_rounded),
            onTap: () =>
                context.push([Routes.settings, Routes.serverSettings].toPath),
          ),
        ],
      ),
    );
  }
}
