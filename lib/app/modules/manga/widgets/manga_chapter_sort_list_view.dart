import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/utils/chapter/apply_chapter_sort.dart';
import '../../../data/enums/chapter/chapter_sort.dart';
import '../controllers/manga_controller.dart';

class MangaChapterSortListView extends StatelessWidget {
  final MangaController controller;
  const MangaChapterSortListView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView(
          children: [
            context.width < 700
                ? Container()
                : ListTile(
                    leading: Chip(
                      backgroundColor:
                          context.theme.indicatorColor.withOpacity(.3),
                      label: Text(
                        LocaleKeys.mangaScreen_sort.tr,
                      ),
                      labelStyle:
                          TextStyle(color: context.theme.indicatorColor),
                    ),
                  ),
            // context.width < 700 ? Container() : Divider(),
            ListTile(
              leading: controller.chapterSort.key == ChapterSort.fetchedAt
                  ? Icon(
                      controller.chapterSort.value
                          ? Icons.arrow_upward_rounded
                          : Icons.arrow_downward_rounded,
                    )
                  : SizedBox(width: Get.theme.iconTheme.size),
              title: Text(LocaleKeys.mangaScreen_sortFetchedAt.tr),
              onTap: () => controller.chapterSort = toggleChapterSort(
                previous: controller.chapterSort,
                present: ChapterSort.fetchedAt,
              ),
            ),
            ListTile(
              leading: controller.chapterSort.key == ChapterSort.chapterIndex
                  ? Icon(
                      controller.chapterSort.value
                          ? Icons.arrow_upward_rounded
                          : Icons.arrow_downward_rounded,
                    )
                  : SizedBox(width: Get.theme.iconTheme.size),
              title: Text(LocaleKeys.mangaScreen_sortSource.tr),
              onTap: () => controller.chapterSort = toggleChapterSort(
                previous: controller.chapterSort,
                present: ChapterSort.chapterIndex,
              ),
            ),
            ListTile(
              leading: controller.chapterSort.key == ChapterSort.scanlator
                  ? Icon(
                      controller.chapterSort.value
                          ? Icons.arrow_upward_rounded
                          : Icons.arrow_downward_rounded,
                    )
                  : SizedBox(width: Get.theme.iconTheme.size),
              title: Text(LocaleKeys.mangaScreen_sortScanlator.tr),
              onTap: () => controller.chapterSort = toggleChapterSort(
                previous: controller.chapterSort,
                present: ChapterSort.scanlator,
              ),
            ),
          ],
        ));
  }
}
