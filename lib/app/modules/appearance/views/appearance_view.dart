import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../controllers/appearance_controller.dart';

class AppearanceView extends GetView<AppearanceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.settingsScreen_appearance.tr),
      ),
      body: ListView(
        children: [
          Obx(() => SwitchListTile(
                value: controller.isDark,
                title: Text(LocaleKeys.appearanceScreen_darkTheme_title.tr),
                subtitle:
                    Text(LocaleKeys.appearanceScreen_darkTheme_subtitle.tr),
                onChanged: (value)async =>
                    await controller.localStorageService.setIsDark (value),
              ))
        ],
      ),
    );
  }
}
