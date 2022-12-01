// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../i18n/locale_keys.g.dart';
import '../../../../../utils/extensions/custom_extensions/async_value_extensions.dart';
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

class BigScreenMangaDetails extends ConsumerWidget {
  const BigScreenMangaDetails({
    super.key,
    required this.chapterList,
    required this.manga,
    required this.mangaId,
    required this.selectedChapters,
    required this.onRefresh,
  });
  final Manga manga;
  final String mangaId;
  final AsyncValueChanged<bool> onRefresh;
  final ValueNotifier<Map<int, Chapter>> selectedChapters;
  final AsyncValue<List<Chapter>?> chapterList;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredChapterList =
        ref.watch(mangaChapterListWithFilterProvider(mangaId: mangaId));

    return RefreshIndicator(
      onRefresh: () => onRefresh(false),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: MangaDescription(
                manga: manga,
                removeMangaFromLibrary: (() => ref
                    .read(mangaBookRepositoryProvider)
                    .removeMangaFromLibrary(mangaId)),
                addMangaToLibrary: (() => ref
                    .read(mangaBookRepositoryProvider)
                    .addMangaToLibrary(mangaId)),
                refresh: () => onRefresh(true),
              ),
            ),
          ),
          const VerticalDivider(width: 0),
          Expanded(
            child: chapterList.showUiWhenData(
              (data) {
                if (data.isNotBlank) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          LocaleKeys.noOfChapters.tr(namedArgs: {
                            "count":
                                (filteredChapterList?.length ?? 0).toString()
                          }),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            if (filteredChapterList.length == index) {
                              return const ListTile();
                            }
                            final key =
                                ValueKey("${filteredChapterList[index].id}");
                            final chapter = filteredChapterList[index];
                            return ChapterListTile(
                              key: key,
                              manga: manga,
                              chapter: chapter,
                              updateData: () => onRefresh(true),
                              isSelected: selectedChapters.value
                                  .containsKey(chapter.id),
                              canTapSelect: selectedChapters.value.isNotEmpty,
                              toggleSelect: (Chapter val) {
                                if ((val.id).isNull) return;
                                selectedChapters.value = selectedChapters.value
                                    .toggleKey(val.id!, val);
                              },
                            );
                          },
                          itemCount: filteredChapterList!.length + 1,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Emoticons(
                    text: LocaleKeys.noChaptersFound.tr(),
                    button: TextButton(
                      onPressed: () => onRefresh(false),
                      child: Text(LocaleKeys.refresh.tr()),
                    ),
                  );
                }
              },
              refresh: () => onRefresh(true),
            ),
          ),
        ],
      ),
    );
  }
}
