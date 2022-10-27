// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';

// 🌎 Project imports:
import '../../../../i18n/locale_keys.g.dart';
import '../../../../routes/router_config.dart';
import '../../../../utils/extensions/custom_extensions/iterable_extensions.dart';

class LibrarySettingsScreen extends StatelessWidget {
  const LibrarySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.settingsScreen_library.tr()),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(LocaleKeys.screenTitle_categories.tr()),
            leading: const Icon(Icons.category_rounded),
            onTap: () => context.push([
              Routes.settings,
              Routes.librarySettings,
              Routes.editCategories
            ].toPath),
          ),
        ],
      ),
    );
  }
}
