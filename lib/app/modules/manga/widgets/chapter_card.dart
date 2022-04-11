import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/utils/days_ago.dart';
import '../../../data/chapter_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/manga_controller.dart';
import 'chapter_download_state.dart';

class ChapterCard extends StatelessWidget {
  const ChapterCard({
    Key? key,
    required this.chapter,
    required this.controller,
  }) : super(key: key);

  final Chapter? chapter;
  final MangaController controller;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (() async {
        await Get.toNamed(
            Routes.manga + "/${chapter!.mangaId}/chapter/${chapter!.index}");
        controller.loadChapterList();
      }),
      title: Text(
        chapter?.name ?? chapter?.chapterNumber!.toString() ?? "",
        style: TextStyle(
          color: (chapter?.read ?? false) ? Colors.grey : null,
          fontWeight: (chapter?.read ?? false) ? null : FontWeight.bold,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        (chapter?.scanlator ?? "") +
            " " +
            convertToAgo(
              DateTime.fromMillisecondsSinceEpoch(
                chapter?.uploadDate ?? 0,
              ),
            ),
        //  + (chapter?.lastPageRead != 0 && chapter?.lastPageRead != 1
        //     ? " · Page: " + (chapter?.lastPageRead.toString() ?? "")
        //     : ""),
        style: context.textTheme.caption?.copyWith(
          height: 1.5,
          color: (chapter?.read ?? false) ? Colors.grey : null,
          fontWeight: (chapter?.read ?? false) ? null : FontWeight.bold,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      leading: ChapterDownloadState(controller: controller, item: chapter!),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          (chapter?.bookmarked ?? false) ? Icon(Icons.bookmark) : Container(),
          SizedBox(width: 10),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  chapter?.bookmarked ?? false
                      ? LocaleKeys.mangaScreen_chapterList_removeBookmark.tr
                      : LocaleKeys.mangaScreen_chapterList_bookmark.tr,
                ),
                onTap: () {
                  controller.modifyChapter(
                    chapter!,
                    'bookmarked',
                    !(chapter?.bookmarked ?? true),
                  );
                },
              ),
              PopupMenuItem(
                child: Text(
                  chapter?.read ?? false
                      ? LocaleKeys.mangaScreen_chapterList_markAsUnread.tr
                      : LocaleKeys.mangaScreen_chapterList_markAsRead.tr,
                ),
                onTap: () {
                  controller.modifyChapter(
                    chapter!,
                    'read',
                    !(chapter?.read ?? true),
                  );
                },
              ),
              PopupMenuItem(
                child:
                    Text(LocaleKeys.mangaScreen_chapterList_markPrevAsRead.tr),
                onTap: () {
                  controller.modifyChapter(
                    chapter!,
                    'markPrevRead',
                    true,
                  );
                },
              ),
              PopupMenuItem(
                child: Text(
                    LocaleKeys.mangaScreen_chapterList_markPrevAsUnread.tr),
                onTap: () {
                  controller.modifyChapter(
                    chapter!,
                    'markPrevRead',
                    false,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
