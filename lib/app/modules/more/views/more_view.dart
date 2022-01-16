import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/constants/api_url.dart';
import '../../../routes/app_pages.dart';
import '../controllers/more_controller.dart';

class MoreView extends GetView<MoreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: context.height * .05),
            child: Image.asset(
              logoURL,
              height: context.height * .1,
              cacheHeight: (context.height * .1).toInt(),
            ),
          ),
          Divider(thickness: 2),
          ListTile(
            title: Text(LocaleKeys.screenTitle_categories.tr),
            leading: Icon(Icons.category_outlined),
            onTap: () => Get.toNamed(Routes.editCategories),
          ),
          Obx(() => SwitchListTile(
                value: controller.isDark,
                secondary: Icon(
                  controller.isDark
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined,
                ),
                title: Text(LocaleKeys.appearanceScreen_darkTheme_title.tr),
                subtitle:
                    Text(LocaleKeys.appearanceScreen_darkTheme_subtitle.tr),
                onChanged: (value) =>
                    controller.localStorageService.changeTheme(value),
              )),
          ListTile(
            title: Text(LocaleKeys.settingsScreen_backup.tr),
            leading: Icon(Icons.settings_backup_restore_outlined),
            onTap: () => Get.toNamed(Routes.backup),
          ),
          Divider(thickness: 2),
          ListTile(
            title: Text(LocaleKeys.screenTitle_settings.tr),
            leading: Icon(Icons.settings_outlined),
            onTap: () => Get.toNamed(Routes.settings),
          ),
          ListTile(
            title: Text(LocaleKeys.screenTitle_about.tr),
            leading: Icon(Icons.info_outlined),
            onTap: () => Get.toNamed(Routes.about),
          ),
        ],
      ),
    );
  }
}
