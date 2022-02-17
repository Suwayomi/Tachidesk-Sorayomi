import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../controllers/library_controller.dart';

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
              autofocus: true,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.close,
                  ),
                  onPressed: () {
                    controller.isSearching = false;
                    controller.textEditingController.clear();
                  },
                ),
                border: OutlineInputBorder(),
                hintText: LocaleKeys.libraryScreen_mangaSearch.tr,
              ),
            ))
        : IconButton(
            onPressed: () => controller.isSearching = true,
            icon: Icon(Icons.search_rounded),
          ));
  }
}
