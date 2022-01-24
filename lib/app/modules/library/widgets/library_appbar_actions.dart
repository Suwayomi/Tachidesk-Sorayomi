import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tachidesk_flutter/app/modules/library/controllers/library_controller.dart';
import '../../../../generated/locales.g.dart';

class LibraryAppBarActions extends StatelessWidget {
  LibraryAppBarActions({Key? key}) : super(key: key);
  final LibraryController controller = Get.find<LibraryController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isSearching
        ? Container(
            padding: EdgeInsets.all(8.0),
            width: min(context.width * .5, 300),
            child: TextField(
              controller: controller.textEditingController,
              cursorColor: context.theme.colorScheme.secondary,
              autofocus: true,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: context.theme.colorScheme.secondary,
                  ),
                  onPressed: () {
                    controller.isSearching = false;
                    controller.textEditingController.clear();
                  },
                ),
                border: OutlineInputBorder(),
                hintText: LocaleKeys.libraryScreen_mangaSearch.tr,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: context.theme.colorScheme.secondary,
                  ),
                ),
              ),
            ))
        : IconButton(
            onPressed: () => controller.isSearching = true,
            icon: Icon(Icons.search_rounded),
          ));
  }
}
