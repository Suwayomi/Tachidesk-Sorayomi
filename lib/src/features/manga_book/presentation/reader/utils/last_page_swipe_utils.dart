// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:math' as math;

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

  /// Validates if the last-page swipe feature is available for the current platform and context
  static bool isFeatureAvailable() {
    // Add platform-specific checks if needed
    // For now, available on all platforms
    return true;
  }

  /// Validates the setting and context for safe feature activation
  static bool canActivateFeature({
    required bool lastPageSwipeEnabled,
    required bool isAtLastPage,
    SwipeDirection? actualDirection,
    ReaderMode? readerMode,
  }) {
    // Basic validation
    if (!lastPageSwipeEnabled || !isAtLastPage) {
      return false;
    }

    // Direction validation if both direction and mode are provided
    if (actualDirection != null && readerMode != null) {
      final expectedDirection = getExpectedSwipeDirection(readerMode);
      return actualDirection == expectedDirection;
    }

    return true;
  }

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

  /// Enhanced swipe direction detection with diagonal handling and minimum velocity
  static SwipeDirection? detectSwipeDirectionAdvanced(DragEndDetails details) {
    final velocityPixels = details.velocity.pixelsPerSecond;

    // Minimum velocity threshold to avoid accidental triggers
    const double minVelocity = 100.0;
    if (velocityPixels.distance < minVelocity) {
      return null;
    }

    // Prioritize primary direction for diagonal swipes
    final double absX = velocityPixels.dx.abs();
    final double absY = velocityPixels.dy.abs();

    if (absX > absY) {
      // Horizontal primary direction
      return velocityPixels.dx > 0 ? SwipeDirection.right : SwipeDirection.left;
    } else {
      // Vertical primary direction
      return velocityPixels.dy > 0 ? SwipeDirection.down : SwipeDirection.up;
    }
  }

  /// Check if swipe is within acceptable angle tolerance (±15°)
  static bool isWithinAngleTolerance({
    required SwipeDirection actualDirection,
    required SwipeDirection expectedDirection,
    required DragEndDetails details,
  }) {
    final velocity = details.velocity.pixelsPerSecond;

    // Calculate swipe angle in radians
    final double angle = math.atan2(velocity.dy, velocity.dx);
    final double angleDegrees = angle * (180 / math.pi);

    // Define expected angles for each direction
    double expectedAngle;
    switch (expectedDirection) {
      case SwipeDirection.left:
        expectedAngle = 180; // or -180
        break;
      case SwipeDirection.right:
        expectedAngle = 0;
        break;
      case SwipeDirection.up:
        expectedAngle = -90;
        break;
      case SwipeDirection.down:
        expectedAngle = 90;
        break;
    }

    // Calculate angle difference with wrapping
    double diff = (angleDegrees - expectedAngle).abs();
    if (diff > 180) diff = 360 - diff;

    // ±15° tolerance
    const double toleranceDegrees = 15.0;
    return diff <= toleranceDegrees;
  }

  /// Enhanced direction validation with tolerance for slightly off-angle swipes
  static bool shouldTriggerChapterNavWithTolerance({
    required bool lastPageSwipeEnabled,
    required bool isAtLastPage,
    required SwipeDirection actualDirection,
    required ReaderMode resolvedReaderMode,
    required DragEndDetails details,
  }) {
    // Basic validation from safety rules
    if (!lastPageSwipeEnabled || !isAtLastPage) {
      return false;
    }

    // Get expected direction
    final expectedDirection = getExpectedSwipeDirection(resolvedReaderMode);

    // Exact match (preferred)
    if (actualDirection == expectedDirection) {
      return true;
    }

    // Add tolerance for slightly off-angle swipes (±15°)
    return isWithinAngleTolerance(
      actualDirection: actualDirection,
      expectedDirection: expectedDirection,
      details: details,
    );
  }

  /// Checks if the current context should trigger chapter navigation
  /// This is the main validation function following safety rules
  static bool shouldTriggerChapterNav({
    required bool lastPageSwipeEnabled,
    required bool isAtLastPage,
    required SwipeDirection actualDirection,
    required ReaderMode resolvedReaderMode,
  }) {
    // Every custom gesture must be wrapped like this (from safety rules)
    if (!lastPageSwipeEnabled || !isAtLastPage) {
      return false;
    }

    // Direction validation required (from safety rules)
    return isCorrectDirection(actualDirection, resolvedReaderMode);
  }

  /// Graceful degradation helper - returns false if any validation fails
  static bool validateWithGracefulDegradation({
    required bool lastPageSwipeEnabled,
    required bool isAtLastPage,
    SwipeDirection? actualDirection,
    ReaderMode? resolvedReaderMode,
  }) {
    try {
      if (!isFeatureAvailable()) return false;

      return canActivateFeature(
        lastPageSwipeEnabled: lastPageSwipeEnabled,
        isAtLastPage: isAtLastPage,
        actualDirection: actualDirection,
        readerMode: resolvedReaderMode,
      );
    } catch (e) {
      // Graceful degradation if feature fails
      return false;
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

  /// Validates direction matching for debugging purposes
  /// Returns true if actual direction matches expected direction for the reader mode
  static bool validateDirectionMatch({
    required SwipeDirection actualDirection,
    required ReaderMode resolvedReaderMode,
    required bool isAtLastPage,
    required bool lastPageSwipeEnabled,
  }) {
    final expectedDirection = getExpectedSwipeDirection(resolvedReaderMode);
    final isCorrect = actualDirection == expectedDirection;

    return isCorrect && isAtLastPage && lastPageSwipeEnabled;
  }
}
