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
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/async_value_extensions.dart';
import '../../../../utils/extensions/custom_extensions/int_extensions.dart';
import '../../../../utils/extensions/custom_extensions/map_extensions.dart';
import '../../../../utils/hooks/paging_controller_hook.dart';
import '../../../../utils/misc/toast/toast.dart';
import '../../../../widgets/emoticons.dart';
import '../../data/manga_book_repository.dart';
import '../../data/updates/updates_repository.dart';
import '../../domain/chapter/chapter_model.dart';
import '../../domain/chapter_page/chapter_page_model.dart';
import '../../widgets/multi_select_bottom_options.dart';
import '../../widgets/update_status_popup_menu.dart';
import 'widgets/chapter_manga_list_tile.dart';

class UpdatesScreen extends HookConsumerWidget {
  const UpdatesScreen({super.key});

  Future<void> _fetchPage(
    UpdatesRepository repository,
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
                controller.appendPage(recentChaptersPage.page!, pageKey + 1);
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
    final updatesRepository = ref.watch(updatesRepositoryProvider);
    final toast = ref.watch(toastProvider(context));
    useEffect(() {
      controller.addPageRequestListener((pageKey) => _fetchPage(
            updatesRepository,
            controller,
            pageKey,
          ));
      return;
    }, []);
    final selectedChapters = useState<Map<int, Chapter>>({});
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
          ? MultiSelectBottomOptions(
              selectedChapters: selectedChapters,
              afterOptionSelected: () async => controller.refresh(),
            )
          : null,
      body: RefreshIndicator(
        onRefresh: () async {
          selectedChapters.value = {};
          controller.refresh();
        },
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
                updatePair: () async {
                  if (item.manga?.id == null || item.chapter?.index == null) {
                    return;
                  } else {
                    final chapter = (await AsyncValue.guard(
                      () => ref.read(mangaBookRepositoryProvider).getChapter(
                            mangaId: item.manga!.id!,
                            chapterIndex: item.chapter!.index!,
                          ),
                    ))
                        .valueOrToast(toast);
                    try {
                      controller.itemList = [...?controller.itemList]
                        ..replaceRange(index, index + 1, [
                          item.copyWith(
                            chapter: chapter ?? item.chapter,
                          )
                        ]);
                    } catch (e) {
                      //
                    }
                  }
                },
                isSelected:
                    selectedChapters.value.containsKey(item.chapter!.id!),
                canTapSelect: selectedChapters.value.isNotEmpty,
                toggleSelect: (Chapter val) {
                  if ((val.id).isNull) return;
                  selectedChapters.value =
                      selectedChapters.value.toggleKey(val.id!, val);
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
