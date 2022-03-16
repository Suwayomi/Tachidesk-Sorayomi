import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tachidesk_sorayomi/app/modules/library/controllers/library_controller.dart';
import 'package:tachidesk_sorayomi/generated/locales.g.dart';

class LibrarySortListView extends StatelessWidget {
  final LibraryController controller;
  const LibrarySortListView({
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
                        LocaleKeys.libraryScreen_sort.tr,
                      ),
                      labelStyle:
                          TextStyle(color: context.theme.indicatorColor),
                    ),
                  ),
            // context.width < 600 ? Container() : Divider(),
            ListTile(
              leading: controller.mangaFilter.sortTitle != null
                  ? Icon(
                      controller.mangaFilter.sortTitle!
                          ? Icons.arrow_upward_rounded
                          : Icons.arrow_downward_rounded,
                    )
                  : SizedBox(width: Get.theme.iconTheme.size),
              title: Text(LocaleKeys.libraryScreen_sortTitle.tr),
              onTap: () => controller.mangaFilterUpdate(
                (mf) => mf?.toggleSortTitle(),
              ),
            ),
            ListTile(
              leading: controller.mangaFilter.sortInLibraryAt != null
                  ? Icon(
                      controller.mangaFilter.sortInLibraryAt!
                          ? Icons.arrow_upward_rounded
                          : Icons.arrow_downward_rounded,
                    )
                  : SizedBox(width: Get.theme.iconTheme.size),
              title: Text(LocaleKeys.libraryScreen_sortInLibraryAt.tr),
              onTap: () => controller.mangaFilterUpdate(
                (mf) => mf?.toggleSortInLibraryAt(),
              ),
            ),
            ListTile(
              leading: controller.mangaFilter.sortUnread != null
                  ? Icon(
                      controller.mangaFilter.sortUnread!
                          ? Icons.arrow_upward_rounded
                          : Icons.arrow_downward_rounded,
                    )
                  : SizedBox(width: Get.theme.iconTheme.size),
              title: Text(LocaleKeys.libraryScreen_sortUnread.tr),
              onTap: () => controller.mangaFilterUpdate(
                (mf) => mf?.toggleSortUnread(),
              ),
            ),
          ],
        ));
  }
}
