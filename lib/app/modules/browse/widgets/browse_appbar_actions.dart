import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/utils/language.dart';
import '../controllers/browse_controller.dart';

class BrowseAppBarActions extends StatelessWidget {
  BrowseAppBarActions({Key? key}) : super(key: key);
  final BrowseController controller = Get.find<BrowseController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            controller.tabIndex == 1
                ? controller.isSearching
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
                            hintText: (controller.tabIndex == 0
                                ? LocaleKeys.browserScreen_mangaSearch.tr
                                : LocaleKeys.browserScreen_SourceSearch.tr),
                          ),
                        ),
                      )
                    : IconButton(
                        onPressed: () => controller.isSearching = true,
                        icon: Icon(Icons.search_rounded),
                      )
                : Container(),
            controller.tabIndex == 1
                ? IconButton(
                    onPressed: () => controller.installExtensionApk(),
                    icon: Icon(Icons.add_rounded),
                  )
                : Container(),
            IconButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: LocaleKeys.sourceScreen_languages.tr,
                    content: SizedBox(
                      height: 250,
                      width: 250,
                      child: ListView.builder(
                        itemCount: iSOMainLanguage.length,
                        itemBuilder: (context, index) {
                          RxBool isEnabled = controller
                              .localStorageService.sourceLanguages
                              .contains(iSOMainLanguage[index].code)
                              .obs;
                          return Obx(
                            () => SwitchListTile(
                              value: isEnabled.value,
                              title: Text(iSOMainLanguage[index].nativeName),
                              onChanged: (value) {
                                isEnabled.value = value;
                                if (value) {
                                  controller
                                      .localStorageService.sourceLanguages += [
                                    iSOMainLanguage[index].code
                                  ];
                                } else {
                                  controller
                                          .localStorageService.sourceLanguages =
                                      controller
                                          .localStorageService.sourceLanguages
                                        ..remove(iSOMainLanguage[index].code);
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    cancel: ElevatedButton(
                      onPressed: () => Get.back(),
                      child: Text(
                        LocaleKeys.sourceScreen_close.tr,
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.translate_rounded))
          ],
        ));
  }
}
