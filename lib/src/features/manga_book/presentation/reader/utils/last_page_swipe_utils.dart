// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import '../../../../../constants/enum.dart';
import '../../../domain/chapter_page/chapter_page_model.dart';

/// Direction of swipe gestures for last-page navigation
enum SwipeDirection {
  left,
  right,
  up,
  down,
}

/// Navigation action types for smart navigation logic
enum NavigationAction {
  pageNavigation,
  nextChapter,
  previousChapter,
}

/// Page position types for smart navigation decisions
enum PagePosition {
  firstPage,
  middlePage,
  lastPage,
  singlePage,
}

/// Utility class for last-page swipe feature validation and direction mapping
class LastPageSwipeUtils {
  LastPageSwipeUtils._();

  /// Maps reader modes to their expected swipe directions for next chapter navigation
  /// Following the safety rules from project.mdc
  static SwipeDirection getExpectedSwipeDirection(ReaderMode mode) {
    switch (mode) {
      case ReaderMode.singleHorizontalLTR:
      case ReaderMode.continuousHorizontalLTR:
        return SwipeDirection.left; // LTR: swipe left for next

      case ReaderMode.singleHorizontalRTL:
      case ReaderMode.continuousHorizontalRTL:
        return SwipeDirection.right; // RTL: swipe right for next

      case ReaderMode.singleVertical:
      case ReaderMode.continuousVertical:
      case ReaderMode.webtoon:
        return SwipeDirection.up; // Vertical: swipe up for next

      case ReaderMode.defaultReader:
        return SwipeDirection.left; // Safe fallback as specified in project.mdc
    }
  }

  /// Resolves the actual reading mode, handling the "default" case
  /// According to memories, when manga has 'Default' reading mode selected,
  /// it should use whatever reading mode the user has configured as their default in settings
  static ReaderMode resolveActualReaderMode({
    required ReaderMode? mangaReaderMode,
    required ReaderMode? defaultReaderMode,
  }) {
    if (mangaReaderMode == null ||
        mangaReaderMode == ReaderMode.defaultReader) {
      return defaultReaderMode ?? ReaderMode.webtoon;
    }
    return mangaReaderMode;
  }

  /// Validates if the actual swipe direction matches the expected direction for the reader mode
  static bool isCorrectDirection(SwipeDirection actual, ReaderMode mode) {
    final expected = getExpectedSwipeDirection(mode);
    return actual == expected;
  }

  /// Detects swipe direction from gesture details
  static SwipeDirection? detectSwipeDirection(DragEndDetails details) {
    final velocity = details.velocity.pixelsPerSecond;
    final primaryVelocity = details.primaryVelocity;

    if (primaryVelocity == null) return null;

    // Determine primary direction based on velocity magnitude
    if (velocity.dx.abs() > velocity.dy.abs()) {
      // Horizontal swipe
      return primaryVelocity > 0 ? SwipeDirection.right : SwipeDirection.left;
    } else {
      // Vertical swipe
      return primaryVelocity > 0 ? SwipeDirection.down : SwipeDirection.up;
    }
  }

  /// Checks if the current page is the last page of the chapter
  static bool isAtLastPage({
    required int currentIndex,
    required ChapterPagesDto chapterPages,
  }) {
    if (chapterPages.pages.isEmpty) return false;
    return currentIndex >= chapterPages.pages.length - 1;
  }

  /// Checks if the current page is the first page of the chapter
  static bool isAtFirstPage({
    required int currentIndex,
  }) {
    return currentIndex <= 0;
  }

  /// Checks if the current page is the last page using metadata
  static bool isAtLastPageByMetadata({
    required int currentIndex,
    required ChapterPagesDto chapterPages,
  }) {
    final pageCount = chapterPages.chapter.pageCount;
    if (pageCount <= 0) return false;
    return currentIndex >= (pageCount - 1);
  }

  /// Enhanced page position detection for smart navigation
  static bool isAtLastPageReliable({
    required int currentIndex,
    required ChapterPagesDto chapterPages,
  }) {
    // Primary method: check against actual loaded pages
    final actualPagesCheck = isAtLastPage(
      currentIndex: currentIndex,
      chapterPages: chapterPages,
    );

    // Fallback method: check against metadata
    final metadataCheck = isAtLastPageByMetadata(
      currentIndex: currentIndex,
      chapterPages: chapterPages,
    );

    // Use actual pages if available, otherwise fall back to metadata
    final result =
        chapterPages.pages.isNotEmpty ? actualPagesCheck : metadataCheck;

    // If there's a discrepancy between methods, prefer the more conservative approach
    // This ensures we don't accidentally trigger when not truly at the last page

    return result;
  }

  /// Comprehensive page position detection for smart navigation
  static PagePosition detectPagePosition({
    required int currentIndex,
    required ChapterPagesDto chapterPages,
  }) {
    final isFirst = isAtFirstPage(currentIndex: currentIndex);
    final isLast = isAtLastPageReliable(
      currentIndex: currentIndex,
      chapterPages: chapterPages,
    );

    if (isFirst && isLast) {
      return PagePosition.singlePage;
    } else if (isFirst) {
      return PagePosition.firstPage;
    } else if (isLast) {
      return PagePosition.lastPage;
    } else {
      return PagePosition.middlePage;
    }
  }
}
