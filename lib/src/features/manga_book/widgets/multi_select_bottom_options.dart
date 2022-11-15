// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../domain/chapter_batch/chapter_batch_model.dart';
import '../../../utils/extensions/custom_extensions/async_value_extensions.dart';
import '../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../utils/misc/custom_typedef.dart';
import '../../../utils/misc/toast/toast.dart';
import '../../../widgets/custom_circular_progress_indicator.dart';
import '../../../constants/app_sizes.dart';
import '../data/downloads/downloads_repository.dart';
import '../data/manga_book_repository.dart';
import '../domain/chapter_page/chapter_page_model.dart';

class MultiSelectBottomOptions extends HookConsumerWidget {
  const MultiSelectBottomOptions({
    Key? key,
    required this.selectedChapters,
    required this.afterOptionSelected,
  }) : super(key: key);

  final ValueNotifier<Map<int, ChapterMangaPair>> selectedChapters;
  final AsyncVoidCallBack afterOptionSelected;

  List<int> get chapterList => selectedChapters.value.keys.toList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    refresh() async {
      await afterOptionSelected();
      selectedChapters.value = {};
    }

    return Padding(
      padding: KEdgeInsets.a8.size,
      child: BottomSheet(
        enableDrag: false,
        backgroundColor: context.theme.cardColor,
        shape: RoundedRectangleBorder(borderRadius: KBorderRadius.r16.radius),
        onClosing: () {},
        builder: (context) {
          final selectedList = selectedChapters.value.values;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (selectedList
                  .any((element) => element.chapter?.bookmarked ?? false))
                MultiSelectIcon(
                  icon: Icons.bookmark_remove_rounded,
                  chapterList: chapterList,
                  change: ChapterChange(isBookmarked: false),
                  refresh: refresh,
                ),
              if (selectedList
                  .any((element) => !(element.chapter?.bookmarked ?? false)))
                MultiSelectIcon(
                  icon: Icons.bookmark_add_rounded,
                  chapterList: chapterList,
                  change: ChapterChange(isBookmarked: true),
                  refresh: refresh,
                ),
              if (selectedList
                  .any((element) => !(element.chapter?.read ?? false)))
                MultiSelectIcon(
                  icon: Icons.done_all_rounded,
                  chapterList: chapterList,
                  change: ChapterChange(isRead: true),
                  refresh: refresh,
                ),
              if (selectedList
                  .any((element) => (element.chapter?.read ?? false)))
                MultiSelectIcon(
                  icon: Icons.remove_done_outlined,
                  chapterList: chapterList,
                  change: ChapterChange(isRead: false),
                  refresh: refresh,
                ),
              if (selectedList
                  .any((element) => !(element.chapter?.downloaded ?? false)))
                MultiSelectIcon(
                  icon: Icons.download_rounded,
                  chapterList: <int>[
                    for (var element in selectedList)
                      if (!(element.chapter?.downloaded ?? true))
                        (element.chapter!.id!)
                  ],
                  refresh: refresh,
                ),
              if (selectedList
                  .any((element) => (element.chapter?.downloaded ?? false)))
                MultiSelectIcon(
                  icon: Icons.delete_rounded,
                  chapterList: chapterList,
                  change: ChapterChange(delete: true),
                  refresh: refresh,
                ),
            ],
          );
        },
      ),
    );
  }
}

class MultiSelectIcon extends HookConsumerWidget {
  const MultiSelectIcon({
    required this.icon,
    required this.chapterList,
    this.change,
    required this.refresh,
    super.key,
  });
  final List<int> chapterList;
  final ChapterChange? change;
  final AsyncVoidCallBack refresh;
  final IconData icon;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final toast = ref.watch(toastProvider(context));
    return IconButton(
      onPressed: isLoading.value
          ? null
          : () async {
              isLoading.value = true;
              (await AsyncValue.guard(
                () => change == null
                    ? ref
                        .read(downloadsRepositoryProvider)
                        .addChaptersBatchToDownloadQueue(chapterList)
                    : ref.read(mangaBookRepositoryProvider).modifyBulkChapters(
                          batch: ChapterBatch(
                            chapterIds: chapterList,
                            change: change,
                          ),
                        ),
              ))
                  .showToastOnError(toast);

              await refresh();
              isLoading.value = false;
            },
      icon: isLoading.value
          ? const MiniCircularProgressIndicator(padding: EdgeInsets.zero)
          : Icon(icon),
    );
  }
}
