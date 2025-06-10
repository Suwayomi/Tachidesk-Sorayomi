// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/enum.dart';
import '../../../../utils/extensions/custom_extensions.dart';
import '../../../history/presentation/history_controller.dart';
import '../../../settings/presentation/reader/widgets/reader_mode_tile/reader_mode_tile.dart';
import '../../data/manga_book/manga_book_repository.dart';
import '../../domain/chapter_batch/chapter_batch_model.dart';
import '../../domain/manga/manga_model.dart';
import '../manga_details/controller/manga_details_controller.dart';
import 'controller/reader_controller.dart';
import 'widgets/reader_mode/continuous_reader_mode.dart';
import 'widgets/reader_mode/single_page_reader_mode.dart';

class ReaderScreen extends HookConsumerWidget {
  const ReaderScreen({
    super.key,
    required this.mangaId,
    required this.chapterId,
    this.showReaderLayoutAnimation = false,
  });
  final int mangaId;
  final int chapterId;
  final bool showReaderLayoutAnimation;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mangaProvider = mangaWithIdProvider(mangaId: mangaId);
    final chapterProviderWithIndex = chapterProvider(chapterId: chapterId);
    final chapterPages = ref.watch(chapterPagesProvider(chapterId: chapterId));
    final manga = ref.watch(mangaProvider);
    final chapter = ref.watch(chapterProviderWithIndex);
    final defaultReaderMode = ref.watch(readerModeKeyProvider);

    final debounce = useRef<Timer?>(null);

    final updateLastRead = useCallback((int currentPage) async {
      final chapterValue = chapter.valueOrNull;
      final chapterPagesValue = chapterPages.valueOrNull;
      if (chapterValue == null || chapterPagesValue == null) return;

      // Use the actual loaded pages count, not the chapter's pageCount metadata
      final actualPageCount = chapterPagesValue.pages.length;

      // Only mark as completed if we've reached the actual last page
      final isReadingCompleted =
          (currentPage >= (actualPageCount - 1)) && actualPageCount > 0;

      await AsyncValue.guard(
        () => ref.read(mangaBookRepositoryProvider).putChapter(
              chapterId: chapterValue.id,
              patch: ChapterChange(
                lastPageRead: isReadingCompleted ? 0 : currentPage,
                isRead: isReadingCompleted,
              ),
            ),
      );

      // Invalidate history to refresh the reading progress
      ref.invalidate(readingHistoryProvider);
    }, [chapter.valueOrNull, chapterPages.valueOrNull]);

    final onPageChanged = useCallback<AsyncValueSetter<int>>(
      (int index) async {
        final chapterValue = chapter.valueOrNull;
        final chapterPagesValue = chapterPages.valueOrNull;
        if (chapterValue == null || chapterPagesValue == null) return;

        // Skip if chapter is already read or if we're going backwards
        if ((chapterValue.isRead).ifNull() ||
            (chapterValue.lastPageRead).getValueOnNullOrNegative() >= index) {
          return;
        }

        final finalDebounce = debounce.value;
        if ((finalDebounce?.isActive).ifNull()) {
          finalDebounce?.cancel();
        }

        // Use actual loaded pages count instead of chapter metadata
        final actualPageCount = chapterPagesValue.pages.length;

        if (index >= (actualPageCount - 1) && actualPageCount > 0) {
          updateLastRead(index);
        } else {
          debounce.value = Timer(
            const Duration(seconds: 2),
            () => updateLastRead(index),
          );
        }
        return;
      },
      [chapter, chapterPages],
    );

    useEffect(() {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      return () => SystemChrome.setEnabledSystemUIMode(
            SystemUiMode.manual,
            overlays: SystemUiOverlay.values,
          );
    }, []);

    return PopScope(
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) {
          ref.invalidate(chapterProviderWithIndex);
          ref.invalidate(mangaChapterListProvider(mangaId: mangaId));
        }
      },
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SafeArea(
          child: manga.showUiWhenData(
            context,
            (data) {
              if (data == null) return const SizedBox.shrink();
              return chapter.showUiWhenData(
                context,
                (chapterData) {
                  if (chapterData == null) return const SizedBox.shrink();
                  return chapterPages.showUiWhenData(
                    context,
                    (chapterPagesData) {
                      if (chapterPagesData == null) {
                        return const SizedBox.shrink();
                      }
                      return switch (
                          data.metaData.readerMode ?? defaultReaderMode) {
                        ReaderMode.singleVertical => SinglePageReaderMode(
                            chapter: chapterData,
                            manga: data,
                            onPageChanged: onPageChanged,
                            scrollDirection: Axis.vertical,
                            showReaderLayoutAnimation:
                                showReaderLayoutAnimation,
                            chapterPages: chapterPagesData,
                          ),
                        ReaderMode.singleHorizontalRTL => SinglePageReaderMode(
                            chapter: chapterData,
                            manga: data,
                            onPageChanged: onPageChanged,
                            reverse: true,
                            showReaderLayoutAnimation:
                                showReaderLayoutAnimation,
                            chapterPages: chapterPagesData,
                          ),
                        ReaderMode.continuousHorizontalLTR =>
                          ContinuousReaderMode(
                            chapter: chapterData,
                            manga: data,
                            onPageChanged: onPageChanged,
                            scrollDirection: Axis.horizontal,
                            showReaderLayoutAnimation:
                                showReaderLayoutAnimation,
                            chapterPages: chapterPagesData,
                          ),
                        ReaderMode.continuousHorizontalRTL =>
                          ContinuousReaderMode(
                            chapter: chapterData,
                            manga: data,
                            onPageChanged: onPageChanged,
                            scrollDirection: Axis.horizontal,
                            reverse: true,
                            showReaderLayoutAnimation:
                                showReaderLayoutAnimation,
                            chapterPages: chapterPagesData,
                          ),
                        ReaderMode.singleHorizontalLTR => SinglePageReaderMode(
                            chapter: chapterData,
                            manga: data,
                            onPageChanged: onPageChanged,
                            chapterPages: chapterPagesData,
                          ),
                        ReaderMode.continuousVertical => ContinuousReaderMode(
                            chapter: chapterData,
                            manga: data,
                            onPageChanged: onPageChanged,
                            showSeparator: true,
                            showReaderLayoutAnimation:
                                showReaderLayoutAnimation,
                            chapterPages: chapterPagesData,
                          ),
                        ReaderMode.webtoon => ContinuousReaderMode(
                            chapter: chapterData,
                            manga: data,
                            onPageChanged: onPageChanged,
                            showReaderLayoutAnimation:
                                showReaderLayoutAnimation,
                            chapterPages: chapterPagesData,
                          ),
                        ReaderMode.defaultReader || null => switch (
                              defaultReaderMode ?? ReaderMode.webtoon) {
                            ReaderMode.singleHorizontalLTR =>
                              SinglePageReaderMode(
                                chapter: chapterData,
                                manga: data,
                                onPageChanged: onPageChanged,
                                chapterPages: chapterPagesData,
                              ),
                            ReaderMode.singleHorizontalRTL =>
                              SinglePageReaderMode(
                                chapter: chapterData,
                                manga: data,
                                onPageChanged: onPageChanged,
                                reverse: true,
                                showReaderLayoutAnimation:
                                    showReaderLayoutAnimation,
                                chapterPages: chapterPagesData,
                              ),
                            ReaderMode.singleVertical => SinglePageReaderMode(
                                chapter: chapterData,
                                manga: data,
                                onPageChanged: onPageChanged,
                                scrollDirection: Axis.vertical,
                                showReaderLayoutAnimation:
                                    showReaderLayoutAnimation,
                                chapterPages: chapterPagesData,
                              ),
                            ReaderMode.continuousHorizontalLTR =>
                              ContinuousReaderMode(
                                chapter: chapterData,
                                manga: data,
                                onPageChanged: onPageChanged,
                                scrollDirection: Axis.horizontal,
                                showReaderLayoutAnimation:
                                    showReaderLayoutAnimation,
                                chapterPages: chapterPagesData,
                              ),
                            ReaderMode.continuousHorizontalRTL =>
                              ContinuousReaderMode(
                                chapter: chapterData,
                                manga: data,
                                onPageChanged: onPageChanged,
                                scrollDirection: Axis.horizontal,
                                reverse: true,
                                showReaderLayoutAnimation:
                                    showReaderLayoutAnimation,
                                chapterPages: chapterPagesData,
                              ),
                            ReaderMode.continuousVertical =>
                              ContinuousReaderMode(
                                chapter: chapterData,
                                manga: data,
                                onPageChanged: onPageChanged,
                                showSeparator: true,
                                showReaderLayoutAnimation:
                                    showReaderLayoutAnimation,
                                chapterPages: chapterPagesData,
                              ),
                            ReaderMode.webtoon ||
                            ReaderMode.defaultReader ||
                            null =>
                              ContinuousReaderMode(
                                chapter: chapterData,
                                manga: data,
                                onPageChanged: onPageChanged,
                                showReaderLayoutAnimation:
                                    showReaderLayoutAnimation,
                                chapterPages: chapterPagesData,
                              ),
                          }
                      };
                    },
                  );
                },
                refresh: () => ref.refresh(chapterProviderWithIndex.future),
                addScaffoldWrapper: true,
              );
            },
            addScaffoldWrapper: true,
            refresh: () => ref.refresh(mangaProvider.future),
          ),
        ),
      ),
    );
  }
}
