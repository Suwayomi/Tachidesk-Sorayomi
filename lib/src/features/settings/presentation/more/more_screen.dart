import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tachidesk_sorayomi/src/constants/gen/assets.gen.dart';
import 'package:tachidesk_sorayomi/src/constants/urls.dart';
import 'package:tachidesk_sorayomi/src/features/settings/widgets/theme_mode_tile.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';

import 'package:tachidesk_sorayomi/src/features/settings/widgets/server_url_tile.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/context_extensions.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/iterable_extensions.dart';
import 'package:tachidesk_sorayomi/src/utils/launch_url_in_web.dart';

import '../../../../routes/router_config.dart';
import '../../../../utils/misc/toast.dart';

class MoreScreen extends ConsumerWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toast = ref.watch(toastProvider(context));
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.screenTitle_more.tr()),
      ),
      body: ListView(
        children: [
          ImageIcon(
            AssetImage(Assets.icons.darkIcon.path),
            size: context.height * .2,
          ),
          const Divider(),
          const ServerUrlTile(),
          ListTile(
            title: Text(LocaleKeys.screenTitle_categories.tr()),
            leading: const Icon(Icons.category_rounded),
            onTap: () => context.push([
              Routes.settings,
              Routes.librarySettings,
              Routes.editCategories
            ].toPath),
          ),
          const AppThemeTile(),
          ListTile(
            title: Text(LocaleKeys.settingsScreen_backup.tr()),
            leading: const Icon(Icons.settings_backup_restore_rounded),
            onTap: () => context.push([Routes.settings, Routes.backup].toPath),
          ),
          const Divider(),
          ListTile(
            title: Text(LocaleKeys.screenTitle_settings.tr()),
            leading: const Icon(Icons.settings_rounded),
            onTap: () => context.push(Routes.settings),
          ),
          ListTile(
            title: Text(LocaleKeys.screenTitle_about.tr()),
            leading: const Icon(Icons.info_rounded),
            onTap: () => context.push(Routes.about),
          ),
          ListTile(
            title: Text(LocaleKeys.settingsScreen_help.tr()),
            leading: const Icon(Icons.help_rounded),
            onTap: () => launchUrlInWeb(AppUrls.tachideskHelp.url, toast),
          ),
        ],
      ),
    );
  }
}
