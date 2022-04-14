import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/reader_controller.dart';
import 'reader_settings_menu.dart';

Future<dynamic> readerSettingsBottomSheet({
  required ReaderController controller,
  Map<String, String>? headers,
}) {
  return Get.bottomSheet(
    BottomSheet(
      onClosing: () {},
      builder: (context) {
        return ReaderSettingsMenu(controller: controller);
      },
    ),
  );
}
