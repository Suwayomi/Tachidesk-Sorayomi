// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../domain/chapter/chapter_model.dart';
import '../../../../../domain/chapter_page/chapter_page_model.dart';

/// Utility functions for infinity continuous reader mode
class InfinityContinuousUtils {
  const InfinityContinuousUtils._();

  /// Calculate visible area of an item position
  static double calculateVisibleArea(ItemPosition position) {
    final double leadingEdge = position.itemLeadingEdge.clamp(0.0, 1.0);
    final double trailingEdge = position.itemTrailingEdge.clamp(0.0, 1.0);

    final double visibleStart = leadingEdge < 0 ? 0.0 : leadingEdge;
    final double visibleEnd = trailingEdge > 1 ? 1.0 : trailingEdge;

    return (visibleEnd - visibleStart).clamp(0.0, 1.0);
  }

  /// Calculate total pages across all loaded chapters
  static int getTotalPages(
    List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>
        loadedChapters,
  ) {
    return loadedChapters.fold(
      0,
      (sum, chapterData) => sum + chapterData.pages.pages.length,
    );
  }

  /// Get chapter info for a specific index
  static ({String page, String chapterName, int chapterId})?
      getChapterInfoForIndex(
    int index,
    List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>
        loadedChapters,
  ) {
    int currentIndex = 0;
    for (final chapterData in loadedChapters) {
      if (index >= currentIndex &&
          index < currentIndex + chapterData.pages.pages.length) {
        final pageIndex = index - currentIndex;
        return (
          page: chapterData.pages.pages[pageIndex],
          chapterName: chapterData.chapter.name,
          chapterId: chapterData.chapterId,
        );
      }
      currentIndex += chapterData.pages.pages.length;
    }
    return null;
  }

  /// Check if the index is at a chapter boundary
  static bool isChapterBoundary(
    int index,
    List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>
        loadedChapters,
  ) {
    int currentIndex = 0;
    for (final chapterData in loadedChapters) {
      // Check if this is the start of a new chapter (except the first one)
      if (index == currentIndex && currentIndex > 0) {
        return true;
      }
      // Check if this is the end of a chapter (except the last one)
      if (index == currentIndex + chapterData.pages.pages.length - 1 &&
          currentIndex + chapterData.pages.pages.length <
              getTotalPages(loadedChapters)) {
        return true;
      }
      currentIndex += chapterData.pages.pages.length;
    }
    return false;
  }

  /// Get chapter and page index for a global index
  static ({ChapterDto chapter, int pageIndex})? getChapterAndPageForGlobalIndex(
    int globalIndex,
    List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>
        loadedChapters,
  ) {
    int currentIndex = 0;
    for (final chapterData in loadedChapters) {
      if (globalIndex >= currentIndex &&
          globalIndex < currentIndex + chapterData.pages.pages.length) {
        final pageIndex = globalIndex - currentIndex;
        return (
          chapter: chapterData.chapter,
          pageIndex: pageIndex,
        );
      }
      currentIndex += chapterData.pages.pages.length;
    }
    return null;
  }

  /// Convert chapter-relative index to global index
  static int convertChapterIndexToGlobalIndex(
    int chapterIndex,
    List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>
        loadedChapters,
    int chapterId,
  ) {
    int globalIndex = 0;
    for (final chapterData in loadedChapters) {
      if (chapterData.chapterId == chapterId) {
        return globalIndex + chapterIndex;
      }
      globalIndex += chapterData.pages.pages.length;
    }
    return -1; // Chapter not found
  }

  /// Create ChapterPagesDto for the current visible chapter
  static ChapterPagesDto createChapterPagesDto(
    List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>
        loadedChapters,
    ChapterDto currentChapter,
    ChapterPagesDto fallbackChapterPages,
  ) {
    for (final chapterData in loadedChapters) {
      if (chapterData.chapterId == currentChapter.id) {
        return chapterData.pages;
      }
    }
    // Fallback to original chapter pages if not found
    return fallbackChapterPages;
  }

  /// Update current index and chapter based on visible positions
  static void updateCurrentIndexAndChapter(
    List<ItemPosition> positions,
    ValueNotifier<int> currentIndex,
    List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>
        loadedChapters,
    ValueNotifier<ChapterDto> currentVisibleChapter,
    ValueNotifier<int> currentChapterPageIndex,
    double visibilityThreshold,
  ) {
    if (positions.isEmpty) return;

    // Find the item that's most visible
    ItemPosition? mostVisible;
    double bestVisibleArea = 0.0;

    for (final ItemPosition position in positions) {
      final double visibleArea = calculateVisibleArea(position);

      if (visibleArea > bestVisibleArea && visibleArea > visibilityThreshold) {
        bestVisibleArea = visibleArea;
        mostVisible = position;
      }
    }

    if (mostVisible != null) {
      currentIndex.value = mostVisible.index;

      // Find which chapter this index belongs to and the page within that chapter
      final chapterInfo =
          getChapterAndPageForGlobalIndex(mostVisible.index, loadedChapters);
      if (chapterInfo != null) {
        // Only update if the chapter has actually changed to avoid unnecessary rebuilds
        if (currentVisibleChapter.value.id != chapterInfo.chapter.id) {
          currentVisibleChapter.value = chapterInfo.chapter;
        }
        currentChapterPageIndex.value = chapterInfo.pageIndex;
      }
    }
  }
}
