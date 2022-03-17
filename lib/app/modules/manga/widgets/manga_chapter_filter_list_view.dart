import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../data/enums/chapter/chapter_filter.dart';
import '../controllers/manga_controller.dart';

class MangaChapterFilterListView extends StatelessWidget {
  final MangaController controller;
  const MangaChapterFilterListView({
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
                        LocaleKeys.mangaScreen_filter.tr,
                      ),
                      labelStyle:
                          TextStyle(color: context.theme.indicatorColor),
                    ),
                  ),
            // context.width < 600 ? Container() : Divider(),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              tristate: true,
              value: controller.chapterFilter[ChapterFilter.unread],
              title: Text(LocaleKeys.mangaScreen_filterUnread.tr),
              onChanged: (value) =>
                  controller.chapterFilter[ChapterFilter.unread] = value,
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              tristate: true,
              value: controller.chapterFilter[ChapterFilter.downloaded],
              title: Text(LocaleKeys.mangaScreen_filterDownloaded.tr),
              onChanged: (value) =>
                  controller.chapterFilter[ChapterFilter.downloaded] = value,
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              tristate: true,
              value: controller.chapterFilter[ChapterFilter.bookmarked],
              title: Text(LocaleKeys.mangaScreen_filterBookmarked.tr),
              onChanged: (value) =>
                  controller.chapterFilter[ChapterFilter.bookmarked] = value,
            ),
          ],
        ));
  }
}
