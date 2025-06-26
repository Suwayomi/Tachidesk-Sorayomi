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
        }
      } else {
        hasReachedEnd.value = true;
      }
    } catch (e) {
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
    loadingPrevious.value = true;
    try {
      final ChapterPagesDto? prevChapterPages = await ref
          .read(chapterPagesProvider(chapterId: previousChapter.id).future);
      if (prevChapterPages != null) {
        // Check if chapter is already loaded to avoid duplicates
        final alreadyLoaded = loadedChapters.value
            .any((item) => item.chapterId == previousChapter.id);
        if (!alreadyLoaded) {
          // Store current scroll position before adding the chapter
          int? currentIndex;
          if (scrollController != null && positionsListener != null) {
            final positions = positionsListener.itemPositions.value.toList();
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
            }
          }

          final newChapterPageCount = prevChapterPages.pages.length;

          // Insert at the beginning
          loadedChapters.value = [
            (
              pages: prevChapterPages,
              chapter: previousChapter,
              chapterId: previousChapter.id
            ),
            ...loadedChapters.value,
          ];

          // Adjust scroll position to maintain current view after insertion
          if (currentIndex != null && scrollController != null) {
            // The new index should be the old index plus the number of pages in the new chapter
            final newIndex = currentIndex + newChapterPageCount;

            // Use a slight delay to ensure the list has been updated
            Future.microtask(() {
              try {
                scrollController.jumpTo(index: newIndex);
              } catch (e) {
                // Fallback if jump fails
                debugPrint(
                    'Failed to adjust scroll position after loading previous chapter: $e');
              }
            });
          }
        }
      } else {
        hasReachedStart.value = true;
      }
    } catch (e) {
      hasReachedStart.value = true;
    } finally {
      loadingPrevious.value = false;
    }
  }
}
