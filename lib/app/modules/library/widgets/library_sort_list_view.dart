import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/utils/manga/apply_manga_sort.dart';
import '../../../data/enums/manga/manga_sort.dart';
import '../controllers/library_controller.dart';

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
              leading: controller.mangaSort.key == MangaSort.title
                  ? Icon(
                      controller.mangaSort.value
                          ? Icons.arrow_upward_rounded
                          : Icons.arrow_downward_rounded,
                    )
                  : SizedBox(width: Get.theme.iconTheme.size),
              title: Text(LocaleKeys.libraryScreen_sortTitle.tr),
              onTap: () => controller.mangaSort = toggleMangaSort(
                previous: controller.mangaSort,
                present: MangaSort.title,
              ),
            ),
            ListTile(
              leading: controller.mangaSort.key == MangaSort.inLibraryAt
                  ? Icon(
                      controller.mangaSort.value
                          ? Icons.arrow_upward_rounded
                          : Icons.arrow_downward_rounded,
                    )
                  : SizedBox(width: Get.theme.iconTheme.size),
              title: Text(LocaleKeys.libraryScreen_sortInLibraryAt.tr),
              onTap: () => controller.mangaSort = toggleMangaSort(
                previous: controller.mangaSort,
                present: MangaSort.inLibraryAt,
              ),
            ),
            ListTile(
              leading: controller.mangaSort.key == MangaSort.unread
                  ? Icon(
                      controller.mangaSort.value
                          ? Icons.arrow_upward_rounded
                          : Icons.arrow_downward_rounded,
                    )
                  : SizedBox(width: Get.theme.iconTheme.size),
              title: Text(LocaleKeys.libraryScreen_sortUnread.tr),
              onTap: () => controller.mangaSort = toggleMangaSort(
                previous: controller.mangaSort,
                present: MangaSort.unread,
              ),
            ),
            ListTile(
              leading: controller.mangaSort.key == MangaSort.id
                  ? Icon(
                      controller.mangaSort.value
                          ? Icons.arrow_upward_rounded
                          : Icons.arrow_downward_rounded,
                    )
                  : SizedBox(width: Get.theme.iconTheme.size),
              title: Text(LocaleKeys.libraryScreen_sortId.tr),
              onTap: () => controller.mangaSort = toggleMangaSort(
                previous: controller.mangaSort,
                present: MangaSort.id,
              ),
            ),
          ],
        ));
  }
}
