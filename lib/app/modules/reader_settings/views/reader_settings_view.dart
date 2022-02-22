import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../data/enums/reader_mode.dart';
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
              () => ListTile(
                subtitle: Text(LocaleKeys.readerScreen_readerMode_.tr),
                leading: Icon(Icons.app_settings_alt_outlined),
                isThreeLine: true,
                title: DropdownButton(
                  value: controller.readerMode.value,
                  isExpanded: true,
                  hint: Text(LocaleKeys.readerScreen_readerMode_.tr),
                  items: ReaderMode.values
                      .map<DropdownMenuItem<ReaderMode>>((e) =>
                          DropdownMenuItem<ReaderMode>(
                            child: Text(
                              (LocaleKeys.readerScreen_readerMode_ + e.name).tr,
                              overflow: TextOverflow.ellipsis,
                            ),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (ReaderMode? e) => controller.localStorageService
                      .readerMode = e ?? controller.readerMode.value,
                ),
              ),
            ),
            ListTile(
              title: Text(LocaleKeys.screenTitle_categories.tr),
              leading: Icon(Icons.category_outlined),
              onTap: () => Get.toNamed(Routes.editCategories),
            ),
          ],
        ));
  }
}
