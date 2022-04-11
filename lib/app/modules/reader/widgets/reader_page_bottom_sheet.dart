import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reader_controller.dart';
import 'reader_page_menu.dart';

Future<dynamic> readerPageBottomSheet({
  required int index,
  required ReaderController controller,
  Map<String, String>? headers,
}) {
  return Get.bottomSheet(BottomSheet(
      onClosing: () {},
      builder: (context) {
        return ReaderPageMenu(
          pageNumber: index,
          controller: controller,
          headers: headers,
        );
      }));
}
