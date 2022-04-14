import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../generated/locales.g.dart';
import '../../../../data/enums/reader_navigation_layout.dart';
import '../../controllers/reader_controller.dart';
import '../reader_mode_popup_menu_button.dart';

class ReaderSettingsMenu extends StatelessWidget {
  const ReaderSettingsMenu({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ReaderController controller;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => ReaderModePopupMenuButton(
              controller: controller,
              child: ListTile(
                leading: Icon(Icons.app_settings_alt_outlined),
                title: Text(LocaleKeys.readerScreen_readerMode_.tr),
                subtitle: Text(
                  (LocaleKeys.readerScreen_readerMode_ +
                          controller.readerMode.name)
                      .tr,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Obx(
            () => PopupMenuButton<ReaderNavigationLayout>(
              tooltip: LocaleKeys.readerScreen_readerNavigationLayout_.tr,
              initialValue: controller.readerNavigationLayout,
              onSelected: (ReaderNavigationLayout? e) =>
                  controller.changeReaderNavigationLayout(e),
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
                title: Text(LocaleKeys.readerScreen_readerNavigationLayout_.tr),
                subtitle: Text(
                  (LocaleKeys.readerScreen_readerNavigationLayout_ +
                          controller.readerNavigationLayout.name)
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
                LocaleKeys.readerScreen_readerNavigationLayoutInvert.tr,
              ),
              value: controller.readerNavigationLayoutInvert,
              onChanged: (bool val) =>
                  controller.changeReaderNavigationLayoutInvert(val),
              controlAffinity: ListTileControlAffinity.trailing,
            ),
          ),
        ],
      ),
    );
  }
}
