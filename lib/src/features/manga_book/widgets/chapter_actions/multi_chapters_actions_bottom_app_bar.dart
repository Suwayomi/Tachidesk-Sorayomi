// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/gen/assets.gen.dart';
import '../../../../utils/extensions/custom_extensions.dart';
import '../../../../utils/misc/toast/toast.dart';
import '../../data/downloads/downloads_repository.dart';
import '../../data/manga_book/manga_book_repository.dart';
import '../../domain/chapter/chapter_model.dart';
import '../../domain/chapter_batch/chapter_batch_model.dart';
import 'multi_chapters_action_icon.dart';

class MultiChaptersActionsBottomAppBar extends HookConsumerWidget {
  const MultiChaptersActionsBottomAppBar({
    super.key,
    required this.selectedChapters,
    required this.afterOptionSelected,
    this.chapterList,
  });

  final ValueNotifier<Map<int, ChapterDto>> selectedChapters;
  final AsyncCallback afterOptionSelected;
  final List<ChapterDto>? chapterList;

  List<int> get selectedChapterList => selectedChapters.value.keys.toList();
  ChapterDto get firstChapter =>
      selectedChapters.value[selectedChapterList.first]!;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    refresh([bool triggerAfterOption = true]) async {
      selectedChapters.value = {};
      if (triggerAfterOption) await afterOptionSelected();
    }

    final selectedList = selectedChapters.value.values;

    return Padding(
      padding: KEdgeInsets.a8.size,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (selectedList.any((e) => e.isBookmarked.ifNull()))
            MultiChaptersActionIcon(
              iconData: Icons.bookmark_remove_rounded,
              chapterList: selectedChapterList,
              change: ChapterChange(isBookmarked: false),
              refresh: refresh,
            ),
          if (selectedList.any((e) => !(e.isBookmarked.ifNull())))
            MultiChaptersActionIcon(
              iconData: Icons.bookmark_add_rounded,
              chapterList: selectedChapterList,
              change: ChapterChange(isBookmarked: true),
              refresh: refresh,
            ),
          if (selectedList.isSingletonList && chapterList.isNotBlank)
            MultiChaptersActionIcon(
              chapterList: [
                for (final chapter in chapterList!)
                  if (firstChapter.index > chapter.index) chapter.id
              ],
              icon: ImageIcon(
                Assets.icons.previousDone.provider(),
                color: context.theme.cardTheme.color,
              ),
              change: ChapterChange(isRead: true),
              refresh: refresh,
            ),
          if (selectedList.any((e) => !(e.isRead.ifNull())))
            MultiChaptersActionIcon(
              iconData: Icons.done_all_rounded,
              chapterList: selectedChapterList,
              change: ChapterChange(isRead: true, lastPageRead: 0),
              refresh: refresh,
            ),
          if (selectedList.any((e) => e.isRead.ifNull()))
            MultiChaptersActionIcon(
              iconData: Icons.remove_done_rounded,
              chapterList: selectedChapterList,
              change: ChapterChange(isRead: false),
              refresh: refresh,
            ),
          if (selectedList.any((e) => !(e.isDownloaded.ifNull())))
            IconButton(
              icon: Icon(Icons.download_rounded),
              onPressed: () async {
                final result = await AsyncValue.guard(
                  () => ref
                      .read(downloadsRepositoryProvider)
                      .addChaptersBatchToDownloadQueue([
                    for (var e in selectedList)
                      if (!(e.isDownloaded.ifNull(true))) (e.id)
                  ]),
                );
                if (context.mounted) {
                  result.showToastOnError(ref.read(toastProvider));
                }
                await refresh(true);
              },
            ),
          if (selectedList.any((e) => e.isDownloaded.ifNull()))
            IconButton(
              icon: Icon(Icons.delete_rounded),
              onPressed: () async {
                final result = await AsyncValue.guard(
                  () => ref
                      .read(mangaBookRepositoryProvider)
                      .deleteChapters(selectedChapterList),
                );
                if (context.mounted) {
                  result.showToastOnError(ref.read(toastProvider));
                }
                await refresh(true);
              },
            ),
        ],
      ),
    );
  }
}
