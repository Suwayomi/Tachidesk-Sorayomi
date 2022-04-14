import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../data/enums/reader_mode.dart';
import '../../../data/enums/reader_navigation_layout.dart';
import '../../../routes/app_pages.dart';
import '../controllers/reader_settings_controller.dart';

class ReaderSettingsView extends GetView<ReaderSettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.screenTitle_readerSettingsView.tr),
        ),
        body: ListView(
          children: [
            Obx(
              () => PopupMenuButton<ReaderMode>(
                initialValue: controller.readerMode.value,
                onSelected: (ReaderMode? e) async => await controller
                    .localStorageService
                    .setReaderMode(e ?? controller.readerMode.value),
                itemBuilder: (context) {
                  return (ReaderMode.values.toList()
                        ..removeWhere(
                          (e) => e == ReaderMode.defaultReader,
                        ))
                      .map<PopupMenuEntry<ReaderMode>>(
                        (e) => PopupMenuItem(
                          value: e,
                          child: ListTile(
                            title: Text(
                              (LocaleKeys.readerScreen_readerMode_ + e.name).tr,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      )
                      .toList();
                },
                child: ListTile(
                  leading: Icon(Icons.app_settings_alt_outlined),
                  title: Text(LocaleKeys.readerSettingsScreen_readerMode.tr),
                  subtitle: Text(
                    (LocaleKeys.readerScreen_readerMode_ +
                            controller.readerMode.value.name)
                        .tr,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            Obx(
              () => PopupMenuButton<ReaderNavigationLayout>(
                initialValue: controller.readerNavigationLayout.value,
                onSelected: (ReaderNavigationLayout? e) async =>
                    await controller.localStorageService
                        .setReaderNavigationLayout(
                            e ?? controller.readerNavigationLayout.value),
                itemBuilder: (context) {
                  return ReaderNavigationLayout.values
                      .map<PopupMenuEntry<ReaderNavigationLayout>>(
                        (e) => PopupMenuItem(
                          value: e,
                          child: ListTile(
                            title: Text(
                              (LocaleKeys.readerScreen_readerNavigationLayout_ +
                                      e.name)
                                  .tr,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      )
                      .toList();
                },
                child: ListTile(
                  leading: Icon(Icons.touch_app_outlined),
                  title: Text(
                    LocaleKeys
                        .readerSettingsScreen_readerNavigationLayoutInvert.tr,
                  ),
                  subtitle: Text(
                    (LocaleKeys.readerScreen_readerNavigationLayout_ +
                            controller.readerNavigationLayout.value.name)
                        .tr,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            Obx(
              () => SwitchListTile(
                secondary: Icon(Icons.switch_left_outlined),
                title: Text(
                  LocaleKeys
                      .readerSettingsScreen_readerNavigationLayoutInvert.tr,
                ),
                value: controller.readerNavigationLayoutInvert.value,
                onChanged: (bool val) async {
                  await controller.localStorageService
                      .setReaderNavigationLayoutInvert(val);
                },
                controlAffinity: ListTileControlAffinity.trailing,
              ),
            ),
            ListTile(
              title: Text(LocaleKeys.readerSettingsScreen_category.tr),
              leading: Icon(Icons.category_outlined),
              onTap: () => Get.toNamed(Routes.editCategories),
            ),
          ],
        ));
  }
}
