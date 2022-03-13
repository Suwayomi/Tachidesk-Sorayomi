import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../controllers/browse_settings_controller.dart';

class BrowseSettingsView extends GetView<BrowseSettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.settingsScreen_browse.tr),
        ),
        body: ListView(
          children: [
            Obx(() => SwitchListTile(
                  value: controller.showNSFW,
                  onChanged: (value) =>
                      controller.localStorageService.showNSFW = value,
                  title: Text(LocaleKeys.browserSettingsScreen_nsfw_title.tr),
                  subtitle:
                      Text(LocaleKeys.browserSettingsScreen_nsfw_subtitle.tr),
                )),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text(LocaleKeys.browserSettingsScreen_nsfw_info.tr),
              dense: true,
            ),
            Divider(thickness: 2)
          ],
        ));
  }
}
