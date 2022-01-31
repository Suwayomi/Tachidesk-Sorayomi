import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/enums/reader_mode.dart';
import '../controllers/reader_settings_controller.dart';

class ReaderSettingsView extends GetView<ReaderSettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ReaderSettingsView'),
        ),
        body: ListView(
          children: [
            Obx(() => ListTile(
                  leading: Text(LocaleKeys.readerScreen_readerMode_.tr),
                  title: DropdownButton(
                    value: controller.readerMode.value,
                    isExpanded: true,
                    hint: Text(LocaleKeys.readerScreen_readerMode_.tr),
                    items: ReaderMode.values
                        .map<DropdownMenuItem<ReaderMode>>((e) =>
                            DropdownMenuItem<ReaderMode>(
                              child: Text(
                                (LocaleKeys.readerScreen_readerMode_ + e.name)
                                    .tr,
                                overflow: TextOverflow.ellipsis,
                              ),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (ReaderMode? e) => controller.localStorageService
                        .readerMode = e ?? controller.readerMode.value,
                  ),
                )),
          ],
        ));
  }
}
