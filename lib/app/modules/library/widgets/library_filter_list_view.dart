import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../data/enums/manga/manga_filter.dart';
import '../controllers/library_controller.dart';

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
            context.width < 700
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
            // context.width < 700 ? Container() : Divider(),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              tristate: true,
              value: controller.mangaFilter[MangaFilter.unread],
              title: Text(LocaleKeys.libraryScreen_filterUnread.tr),
              onChanged: (value) =>
                  controller.mangaFilter[MangaFilter.unread] = value,
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              tristate: true,
              value: controller.mangaFilter[MangaFilter.downloaded],
              title: Text(LocaleKeys.libraryScreen_filterDownloaded.tr),
              onChanged: (value) =>
                  controller.mangaFilter[MangaFilter.downloaded] = value,
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              tristate: true,
              value: controller.mangaFilter[MangaFilter.completed],
              title: Text(LocaleKeys.libraryScreen_filterCompleted.tr),
              onChanged: (value) =>
                  controller.mangaFilter[MangaFilter.completed] = value,
            ),
          ],
        ));
  }
}
