import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tachidesk_sorayomi/app/modules/library/controllers/library_controller.dart';
import 'package:tachidesk_sorayomi/generated/locales.g.dart';

class LibraryFilterListView extends StatelessWidget {
  final LibraryController controller;
  const LibraryFilterListView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView(
          children: [
            context.width < 600
                ? Container()
                : ListTile(
                    leading: Chip(
                      backgroundColor:
                          context.theme.indicatorColor.withOpacity(.3),
                      label: Text(
                        LocaleKeys.libraryScreen_filter.tr,
                      ),
                      labelStyle:
                          TextStyle(color: context.theme.indicatorColor),
                    ),
                  ),
            // context.width < 600 ? Container() : Divider(),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              tristate: true,
              value: controller.mangaFilter.filterUnread,
              title: Text(LocaleKeys.libraryScreen_filterUnread.tr),
              onChanged: (value) => controller
                  .mangaFilterUpdate((mf) => mf?.filterUnread = value),
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              tristate: true,
              value: controller.mangaFilter.filterDownloaded,
              title: Text(LocaleKeys.libraryScreen_filterDownloaded.tr),
              onChanged: (value) => controller
                  .mangaFilterUpdate((mf) => mf?.filterDownloaded = value),
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              tristate: true,
              value: controller.mangaFilter.filterCompleted,
              title: Text(LocaleKeys.libraryScreen_filterCompleted.tr),
              onChanged: (value) {
                print(value);
                controller
                    .mangaFilterUpdate((mf) => mf?.filterCompleted = value);
              },
            ),
          ],
        ));
  }
}
