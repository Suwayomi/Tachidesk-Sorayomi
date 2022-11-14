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
import '../../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../../utils/extensions/custom_extensions/iterable_extensions.dart';
import '../../../../../utils/misc/custom_typedef.dart';
import '../../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../../widgets/emoticons.dart';
import '../../../data/manga_book_repository.dart';
import '../../../domain/manga/manga_model.dart';
import '../controller/manga_details_controller.dart';
import 'chapter_list_tile.dart';
import 'manga_description.dart';

class SmallScreenMangaDetails extends ConsumerWidget {
  const SmallScreenMangaDetails({
    super.key,
    required this.manga,
    required this.mangaId,
    required this.onRefresh,
  });
  final String mangaId;
  final Manga manga;
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
                  namedArgs: {"count": "${manga.chapterCount ?? 0}"},
                ),
              ),
            ),
          ),
          chapterList.when(
            data: (data) => data.isNotBlank
                ? SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => ChapterListTile(
                        key: ValueKey("$mangaId-${data[index].id}"),
                        manga: manga,
                        chapter: data[index],
                        updateData: (value) {
                          if (value == null) return;
                          ref
                              .read(provider.notifier)
                              .updateChapter(index, value);
                        },
                      ),
                      childCount: data!.length,
                    ),
                  )
                : SliverToBoxAdapter(
                    child: Emoticons(
                      text: LocaleKeys.noChaptersFound.tr(),
                      button: TextButton(
                        onPressed: () => ref.invalidate(provider),
                        child: Text(LocaleKeys.refresh.tr()),
                      ),
                    ),
                  ),
            error: (error, stackTrace) => SliverToBoxAdapter(
              child: Emoticons(
                text: error.toString(),
                button: TextButton(
                  onPressed: () => ref.invalidate(provider),
                  child: Text(LocaleKeys.refresh.tr()),
                ),
              ),
            ),
            loading: () => SliverToBoxAdapter(
              child: SizedBox(
                height: context.height * .5,
                child: const CenterCircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
