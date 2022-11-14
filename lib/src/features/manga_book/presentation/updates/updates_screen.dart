// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// 🌎 Project imports:
import '../../../../constants/app_sizes.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/async_value_extensions.dart';
import '../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../utils/extensions/custom_extensions/int_extensions.dart';
import '../../../../utils/hooks/paging_controller_hook.dart';
import '../../../../utils/misc/toast/toast.dart';
import '../../../../widgets/emoticons.dart';
import '../../data/manga_book_repository.dart';
import '../../domain/chapter_page/chapter_page_model.dart';
import '../../widgets/update_status_popup_menu.dart';
import 'widgets/chapter_manga_list_tile.dart';

class UpdatesScreen extends HookConsumerWidget {
  const UpdatesScreen({Key? key}) : super(key: key);

  Future<void> _fetchPage(
    MangaBookRepository repository,
    PagingController controller,
    int pageKey,
  ) async {
    AsyncValue.guard(
      () async => await repository.getRecentChaptersPage(pageNo: pageKey),
    ).then(
      (value) => value.whenOrNull(
        data: (recentChaptersPage) {
          if (recentChaptersPage != null) {
            if (recentChaptersPage.hasNextPage ?? false) {
              try {
                controller.appendPage(
                    recentChaptersPage.page ?? [], pageKey + 1);
              } catch (e) {
                controller.appendPage([], pageKey);
              }
            } else {
              controller.appendLastPage(recentChaptersPage.page ?? []);
            }
          }
        },
        error: (error, stackTrace) => controller.error = error,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller =
        usePagingController<int, ChapterMangaPair>(firstPageKey: 0);
    final chapterRepository = ref.watch(mangaBookRepositoryProvider);
    final toast = ref.watch(toastProvider(context));
    useEffect(() {
      controller.addPageRequestListener((pageKey) => _fetchPage(
            chapterRepository,
            controller,
            pageKey,
          ));
      return;
    }, []);
    final selectedChapters = useState<Map<int, ChapterMangaPair>>({});
    return Scaffold(
      appBar: selectedChapters.value.isNotEmpty
          ? AppBar(
              leading: IconButton(
                onPressed: () => selectedChapters.value = {},
                icon: const Icon(Icons.close_rounded),
              ),
              title: Text(
                LocaleKeys.numSelected.tr(
                  namedArgs: {"num": "${selectedChapters.value.length}"},
                ),
              ),
            )
          : AppBar(
              title: Text(LocaleKeys.updates.tr()),
              actions: const [UpdateStatusPopupMenu()],
            ),
      bottomSheet: selectedChapters.value.isNotEmpty
          ? Padding(
              padding: KEdgeInsets.a8.size,
              child: BottomSheet(
                enableDrag: false,
                backgroundColor: context.theme.cardColor,
                shape: RoundedRectangleBorder(
                    borderRadius: KBorderRadius.r16.radius),
                onClosing: () {},
                builder: (context) {
                  final selectedList = selectedChapters.value.values;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (selectedList.any(
                          (element) => element.chapter?.bookmarked ?? false))
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark_remove_rounded),
                        ),
                      if (selectedList.any(
                          (element) => !(element.chapter?.bookmarked ?? false)))
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark_add_rounded),
                        ),
                      if (selectedList
                          .any((element) => !(element.chapter?.read ?? false)))
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.done_all_rounded),
                        ),
                      if (selectedList
                          .any((element) => (element.chapter?.read ?? false)))
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove_done_outlined),
                        ),
                      if (selectedList.any(
                          (element) => !(element.chapter?.downloaded ?? false)))
                        IconButton(
                          onPressed: () {
                            final downloadableList = <int>[];
                            for (var element in selectedList) {
                              if (!(element.chapter?.downloaded ?? true)) {
                                downloadableList.add(element.chapter!.id!);
                              }
                            }
                            AsyncValue.guard(
                              () => chapterRepository
                                  .addChaptersBatchToDownloadQueue(
                                downloadableList.toList(),
                              ),
                            ).then(
                              (val) => val.whenOrNull(
                                data: (data) => selectedChapters.value = {},
                                error: (error, _) =>
                                    val.showToastOnError(toast),
                              ),
                            );
                          },
                          icon: const Icon(Icons.download_rounded),
                        ),
                      if (selectedList.any(
                          (element) => (element.chapter?.downloaded ?? false)))
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete_rounded),
                        ),
                    ],
                  );
                },
              ),
            )
          : null,
      body: RefreshIndicator(
        onRefresh: () async => controller.refresh(),
        child: PagedListView(
          pagingController: controller,
          builderDelegate: PagedChildBuilderDelegate<ChapterMangaPair>(
            firstPageErrorIndicatorBuilder: (context) => Emoticons(
              text: controller.error.toString(),
              button: TextButton(
                onPressed: () => controller.refresh(),
                child: Text(LocaleKeys.retry.tr()),
              ),
            ),
            noItemsFoundIndicatorBuilder: (context) => Emoticons(
              text: LocaleKeys.noUpdatesFound.tr(),
              button: TextButton(
                onPressed: () => controller.refresh(),
                child: Text(LocaleKeys.refresh.tr()),
              ),
            ),
            itemBuilder: (context, item, index) {
              int? previousDate;
              try {
                previousDate =
                    controller.itemList?[index - 1].chapter?.fetchedAt;
              } catch (e) {
                previousDate = null;
              }
              final chapterTile = ChapterMangaListTile(
                pair: item,
                toast: toast,
                isSelected:
                    selectedChapters.value.containsKey(item.chapter!.id!),
                canTapSelect: selectedChapters.value.isNotEmpty,
                updatePair: () async {
                  try {
                    final chapter = (await AsyncValue.guard(() =>
                            ref.read(mangaBookRepositoryProvider).getChapter(
                                  mangaId: item.manga!.id!,
                                  chapterIndex: item.chapter!.index!,
                                )))
                        .valueOrToast(toast);
                    controller.itemList = [...?controller.itemList]
                      ..replaceRange(index, index + 1, [
                        item.copyWith(
                          chapter: chapter ?? item.chapter,
                        )
                      ]);
                  } catch (e) {
                    //
                  }
                },
                toggleSelect: (ChapterMangaPair val) {
                  if ((val.chapter?.id).isNull) return;
                  if (selectedChapters.value.containsKey(val.chapter!.id!)) {
                    selectedChapters.value = {...selectedChapters.value}
                      ..remove(val.chapter!.id!);
                  } else {
                    selectedChapters.value = {
                      ...selectedChapters.value,
                      val.chapter!.id!: val
                    };
                  }
                },
              );
              if ((item.chapter?.fetchedAt).isSameDayAs(previousDate)) {
                return chapterTile;
              } else {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(item.chapter!.fetchedAt.toDaysAgoFromSeconds),
                    ),
                    chapterTile,
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
