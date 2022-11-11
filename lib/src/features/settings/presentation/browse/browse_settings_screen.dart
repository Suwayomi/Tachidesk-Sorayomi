// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';

// 🌎 Project imports:
import '../../../../i18n/locale_keys.g.dart';
import 'widgets/show_nsfw_switch/show_nsfw_switch.dart';

class BrowseSettingsScreen extends StatelessWidget {
  const BrowseSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.browse.tr())),
      body: ListView(
        children: [
          const ShowNSFWTile(),
          ListTile(
            subtitle: Text(LocaleKeys.nsfw_info.tr()),
            leading: const Icon(Icons.info_rounded),
            dense: true,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
