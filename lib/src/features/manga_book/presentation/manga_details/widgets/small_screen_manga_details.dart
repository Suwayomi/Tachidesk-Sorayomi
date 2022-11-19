// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../../../utils/extensions/custom_extensions/async_value_extensions.dart';
import '../../../../../i18n/locale_keys.g.dart';
import '../../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../../utils/extensions/custom_extensions/int_extensions.dart';
import '../../../../../utils/extensions/custom_extensions/iterable_extensions.dart';
import '../../../../../utils/extensions/custom_extensions/map_extensions.dart';
import '../../../../../utils/misc/custom_typedef.dart';
import '../../../../../widgets/emoticons.dart';
import '../../../data/manga_book_repository.dart';
import '../../../domain/chapter/chapter_model.dart';
import '../../../domain/manga/manga_model.dart';
import '../controller/manga_details_controller.dart';
import 'chapter_list_tile.dart';
import 'manga_description.dart';

class SmallScreenMangaDetails extends ConsumerWidget {
  const SmallScreenMangaDetails({
    super.key,
    required this.chapterList,
    required this.manga,
    required this.selectedChapters,
    required this.mangaId,
    required this.onRefresh,
  });
  final String mangaId;
  final Manga manga;
  final AsyncValueChanged<bool> onRefresh;
  final ValueNotifier<Map<int, Chapter>> selectedChapters;
  final AsyncValue<List<Chapter>?> chapterList;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredChapterList =
        ref.watch(mangaChapterListWithFilterProvider(mangaId: mangaId));

    return RefreshIndicator(
      onRefresh: () => onRefresh(false),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: MangaDescription(
                manga: manga,
                refresh: () => onRefresh(true),
                removeMangaFromLibrary: () => ref
                    .read(mangaBookRepositoryProvider)
                    .removeMangaFromLibrary(mangaId),
                addMangaToLibrary: () => ref
                    .read(mangaBookRepositoryProvider)
                    .addMangaToLibrary(mangaId),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              title: Text(
                LocaleKeys.noOfChapters.tr(
                  namedArgs: {"count": "${filteredChapterList?.length ?? 0}"},
                ),
              ),
            ),
          ),
          chapterList.showUiWhenData(
            data: (data) {
              if (data.isNotBlank) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => ChapterListTile(
                      key: ValueKey("${filteredChapterList[index].id}"),
                      manga: manga,
                      chapter: filteredChapterList[index],
                      updateData: () => onRefresh(true),
                      isSelected: selectedChapters.value
                          .containsKey(filteredChapterList[index].id),
                      canTapSelect: selectedChapters.value.isNotEmpty,
                      toggleSelect: (Chapter val) {
                        if ((val.id).isNull) return;
                        selectedChapters.value =
                            selectedChapters.value.toggleKey(val.id!, val);
                      },
                    ),
                    childCount: filteredChapterList!.length,
                  ),
                );
              } else {
                return SliverToBoxAdapter(
                  child: Emoticons(
                    text: LocaleKeys.noChaptersFound.tr(),
                    button: TextButton(
                      onPressed: () => onRefresh(false),
                      child: Text(LocaleKeys.refresh.tr()),
                    ),
                  ),
                );
              }
            },
            refresh: () => onRefresh(true),
            wrapper: (child) => SliverToBoxAdapter(
              child: SizedBox(
                height: context.height * .5,
                child: child,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: ListTile()),
        ],
      ),
    );
  }
}
