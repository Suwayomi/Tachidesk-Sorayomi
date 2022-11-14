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
import '../../../../../i18n/locale_keys.g.dart';
import '../../../../../utils/extensions/custom_extensions/iterable_extensions.dart';
import '../../../../../utils/misc/custom_typedef.dart';
import '../../../../../widgets/custom_circular_progress_indicator.dart';
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
    required this.manga,
    required this.mangaId,
    required this.onRefresh,
  });
  final Manga manga;
  final String mangaId;
  final AsyncValueChanged<bool> onRefresh;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = mangaChapterListProvider(mangaId: mangaId);
    final chapterList = ref.watch(provider);
    refresh() async {
      await onRefresh(false);
      ref.read(provider.notifier).refresh();
    }

    return RefreshIndicator(
      onRefresh: refresh,
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
            child: MangaChapterListWidget(
              manga: manga,
              chapterList: chapterList,
              onRefresh: refresh,
              updateData: (int index, Chapter? value) {
                if (value == null) return;
                ref.read(provider.notifier).updateChapter(index, value);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MangaChapterListWidget extends StatelessWidget {
  const MangaChapterListWidget({
    super.key,
    required this.chapterList,
    required this.onRefresh,
    required this.manga,
    required this.updateData,
  });
  final AsyncValue<List<Chapter>?> chapterList;
  final VoidCallback onRefresh;
  final void Function(int, Chapter?) updateData;
  final Manga manga;
  @override
  Widget build(BuildContext context) {
    return chapterList.when(
      data: (data) => data.isNotBlank
          ? Column(
              children: [
                ListTile(
                    title: Text(LocaleKeys.noOfChapters.tr(
                        namedArgs: {"count": manga.chapterCount.toString()}))),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => ChapterListTile(
                      key: ValueKey("${manga.id}-${data[index].id}"),
                      manga: manga,
                      chapter: data[index],
                      updateData: (val) => updateData(index, val),
                    ),
                    itemCount: data!.length,
                  ),
                ),
              ],
            )
          : Emoticons(
              text: LocaleKeys.noChaptersFound.tr(),
              button: TextButton(
                onPressed: onRefresh,
                child: Text(
                  LocaleKeys.refresh.tr(),
                ),
              ),
            ),
      error: (error, stackTrace) => Emoticons(
        text: error.toString(),
        button: TextButton(
          onPressed: onRefresh,
          child: Text(
            LocaleKeys.refresh.tr(),
          ),
        ),
      ),
      loading: () => const CenterCircularProgressIndicator(),
    );
  }
}
