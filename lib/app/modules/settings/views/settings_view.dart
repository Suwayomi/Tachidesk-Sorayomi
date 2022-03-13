import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../routes/app_pages.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.screenTitle_settings.tr),
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text(LocaleKeys.settingsScreen_appearance.tr),
              leading: Icon(Icons.color_lens_outlined),
              onTap: () => Get.toNamed(Routes.appearance),
            ),
            ListTile(
              title: Text(LocaleKeys.settingsScreen_reader.tr),
              leading: Icon(Icons.chrome_reader_mode_outlined),
              onTap: () => Get.toNamed(Routes.readerSettings),
            ),
            ListTile(
              title: Text(LocaleKeys.settingsScreen_browse.tr),
              leading: Icon(Icons.explore_outlined),
              onTap: () => Get.toNamed(Routes.browseSettings),
            ),
            ListTile(
              title: Text(LocaleKeys.settingsScreen_backup.tr),
              leading: Icon(Icons.settings_backup_restore_outlined),
              onTap: () => Get.toNamed(Routes.backup),
            ),
            ListTile(
              title: Text(LocaleKeys.settingsScreen_server.tr),
              leading: Icon(Icons.computer_outlined),
              onTap: () => Get.toNamed(Routes.serverSettings),
            ),
          ],
        ));
  }
}
