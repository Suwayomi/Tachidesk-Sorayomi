// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../domain/chapter/chapter_model.dart';
import '../../../../../domain/chapter_page/chapter_page_model.dart';
import '../../../controller/reader_controller.dart';
import 'infinity_continuous_utils.dart';

/// Handles chapter loading logic for infinity continuous reader mode
class InfinityContinuousChapterLoader {
  const InfinityContinuousChapterLoader._();

  /// Load next chapter
  static Future<void> loadNextChapter(
    WidgetRef ref,
    ChapterDto nextChapter,
    ValueNotifier<
            List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>>
        loadedChapters,
    ValueNotifier<bool> loadingNext,
    ValueNotifier<bool> hasReachedEnd,
  ) async {
    loadingNext.value = true;
    try {
      final ChapterPagesDto? nextChapterPages = await ref
          .read(chapterPagesProvider(chapterId: nextChapter.id).future);

      if (nextChapterPages != null) {
        // Check if chapter is already loaded to avoid duplicates
        final alreadyLoaded = loadedChapters.value
            .any((item) => item.chapterId == nextChapter.id);

        if (!alreadyLoaded) {
          loadedChapters.value = [
            ...loadedChapters.value,
            (
              pages: nextChapterPages,
              chapter: nextChapter,
              chapterId: nextChapter.id
            ),
          ];
          debugPrint(
              'Successfully loaded next chapter: ${nextChapter.name} with ${nextChapterPages.pages.length} pages');
        }
      } else {
        hasReachedEnd.value = true;
      }
    } catch (e) {
      debugPrint('Error loading next chapter: $e');
      hasReachedEnd.value = true;
    } finally {
      loadingNext.value = false;
    }
  }

  /// Load previous chapter
  static Future<void> loadPreviousChapter(
    WidgetRef ref,
    ChapterDto previousChapter,
    ValueNotifier<
            List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>>
        loadedChapters,
    ValueNotifier<bool> loadingPrevious,
    ValueNotifier<bool> hasReachedStart,
    ItemScrollController? scrollController,
    ItemPositionsListener? positionsListener,
  ) async {
    debugPrint('Starting to load previous chapter: ${previousChapter.name}');
    loadingPrevious.value = true;
    try {
      final ChapterPagesDto? prevChapterPages = await ref
          .read(chapterPagesProvider(chapterId: previousChapter.id).future);

      debugPrint(
          'Previous chapter pages loaded: ${prevChapterPages != null ? prevChapterPages.pages.length : 'null'} pages');

      if (prevChapterPages != null) {
        // Check if chapter is already loaded to avoid duplicates
        final alreadyLoaded = loadedChapters.value
            .any((item) => item.chapterId == previousChapter.id);

        debugPrint('Previous chapter already loaded: $alreadyLoaded');

        if (!alreadyLoaded) {
          // Store current scroll position before adding the chapter
          int? currentIndex;
          if (scrollController != null && positionsListener != null) {
            final positions = positionsListener.itemPositions.value.toList();
            debugPrint('Current positions count: ${positions.length}');
            if (positions.isNotEmpty) {
              // Find the most visible item
              ItemPosition? mostVisible;
              double bestVisibleArea = 0.0;
              for (final position in positions) {
                final visibleArea =
                    InfinityContinuousUtils.calculateVisibleArea(position);
                if (visibleArea > bestVisibleArea) {
                  bestVisibleArea = visibleArea;
                  mostVisible = position;
                }
              }
              currentIndex = mostVisible?.index;
              debugPrint(
                  'Current visible index before insertion: $currentIndex');
            }
          }

          final newChapterPageCount = prevChapterPages.pages.length;
          debugPrint('New chapter page count: $newChapterPageCount');

          // Insert at the beginning
          loadedChapters.value = [
            (
              pages: prevChapterPages,
              chapter: previousChapter,
              chapterId: previousChapter.id
            ),
            ...loadedChapters.value,
          ];

          debugPrint(
              'Previous chapter inserted at beginning. Total chapters now: ${loadedChapters.value.length}');

          // Adjust scroll position to maintain current view after insertion
          if (currentIndex != null && scrollController != null) {
            // The new index should be the old index plus the number of pages in the new chapter
            final newIndex = currentIndex + newChapterPageCount;
            debugPrint(
                'Adjusting scroll position from $currentIndex to $newIndex');

            // Use multiple approaches to ensure scroll position is maintained
            Future.microtask(() {
              try {
                // First attempt: direct jump
                scrollController.jumpTo(index: newIndex);
                debugPrint('Successfully jumped to index: $newIndex');
              } catch (e) {
                debugPrint('Direct jump failed: $e, trying scrollTo instead');
                // Fallback: scroll with animation
                try {
                  scrollController.scrollTo(
                    index: newIndex,
                    duration: const Duration(milliseconds: 100),
                  );
                  debugPrint('Successfully scrolled to index: $newIndex');
                } catch (e2) {
                  debugPrint('ScrollTo also failed: $e2');
                  // Final fallback: try with a longer delay
                  Future.delayed(const Duration(milliseconds: 100), () {
                    try {
                      scrollController.jumpTo(index: newIndex);
                      debugPrint('Delayed jump successful to index: $newIndex');
                    } catch (e3) {
                      debugPrint('All scroll adjustment attempts failed: $e3');
                    }
                  });
                }
              }
            });
          } else {
            debugPrint(
                'Cannot adjust scroll position - currentIndex: $currentIndex, scrollController: $scrollController');
          }
        }
      } else {
        debugPrint(
            'Previous chapter pages is null, setting hasReachedStart to true');
        hasReachedStart.value = true;
      }
    } catch (e) {
      debugPrint('Error loading previous chapter: $e');
      hasReachedStart.value = true;
    } finally {
      loadingPrevious.value = false;
      debugPrint(
          'Finished loading previous chapter, loadingPrevious set to false');
    }
  }
}
