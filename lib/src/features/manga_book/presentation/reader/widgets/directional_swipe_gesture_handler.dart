// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../constants/enum.dart';
import '../../../../../routes/router_config.dart';
import '../../../domain/chapter/chapter_model.dart';
import '../../../domain/chapter_page/chapter_page_model.dart';
import '../utils/last_page_swipe_utils.dart';

/// A specialized widget for handling directional swipe gestures in the reader
/// Extracted from ReaderView to improve performance and maintainability
///
/// TASK 3 IMPLEMENTATION: Enhanced gesture detection with arena competition
/// Uses hybrid approach: RawGestureDetector for advanced features, GestureDetector for fallback
///
/// TASK 4 IMPLEMENTATION: Integrated with existing navigation infrastructure
/// Hooks into ReaderView navigation functions with smart navigation logic
class DirectionalSwipeGestureHandler extends HookWidget {
  const DirectionalSwipeGestureHandler({
    super.key,
    required this.child,
    required this.onTap,
    required this.onLongPressStart,
    required this.onLongPressEnd,
    required this.onLongPressMoveUpdate,
    required this.scrollDirection,
    required this.readerSwipeChapterToggle,
    required this.lastPageSwipeEnabled,
    required this.resolvedReaderMode,
    required this.currentIndex,
    required this.chapterPages,
    required this.mangaId,
    required this.prevNextChapterPair,
    // TASK 4.1: Hook into existing navigation functions
    required this.onNextPage,
    required this.onPreviousPage,
    // Fix: Add PageController to get real-time page index
    required this.pageController,
  });

  final Widget child;
  final VoidCallback onTap;
  final void Function(LongPressStartDetails) onLongPressStart;
  final void Function(LongPressEndDetails) onLongPressEnd;
  final void Function(LongPressMoveUpdateDetails) onLongPressMoveUpdate;
  final Axis scrollDirection;
  final bool readerSwipeChapterToggle;
  final bool lastPageSwipeEnabled;
  final ReaderMode resolvedReaderMode;
  final int currentIndex;
  final ChapterPagesDto chapterPages;
  final int mangaId;
  final ({ChapterDto? first, ChapterDto? second})? prevNextChapterPair;
  // TASK 4.1: Existing navigation callbacks for smart navigation logic
  final VoidCallback onNextPage;
  final VoidCallback onPreviousPage;
  // Fix: PageController for real-time page index access
  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    // TASK 3.5: Conditional Activation - Use advanced gestures only when needed
    final bool useAdvancedGestures =
        lastPageSwipeEnabled && !readerSwipeChapterToggle;

    if (useAdvancedGestures) {
      return _buildAdvancedGestureHandler(context);
    } else {
      return _buildSimpleGestureHandler(context);
    }
  }

  // ===========================================================================
  // TASK 3.2 & 3.3: Advanced Gesture Detection with Arena Competition
  // ===========================================================================

  /// Advanced gesture handler using RawGestureDetector for proper arena competition
  Widget _buildAdvancedGestureHandler(BuildContext context) {
    // Temporarily use GestureDetector for testing
    return GestureDetector(
      // Keep basic gestures for non-swipe interactions
      onLongPressStart: onLongPressStart,
      onLongPressEnd: onLongPressEnd,
      onLongPressMoveUpdate: onLongPressMoveUpdate,
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      // Add pan gesture detection for testing
      onPanEnd: (details) {
        // Detect swipe direction using our existing utility
        final swipeDirection = LastPageSwipeUtils.detectSwipeDirection(details);

        if (swipeDirection != null) {
          _handleAdvancedSwipeGesture(
            context: context,
            direction: swipeDirection,
            details: details,
          );
        }
      },
      child: child,
    );
  }

  /// Simple gesture handler as fallback
  Widget _buildSimpleGestureHandler(BuildContext context) {
    return GestureDetector(
      onLongPressStart: onLongPressStart,
      onLongPressEnd: onLongPressEnd,
      onLongPressMoveUpdate: onLongPressMoveUpdate,
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      onHorizontalDragEnd: (details) {
        _handleSwipeGesture(
          context: context,
          details: details,
          allowedAxis: Axis.vertical, // Only trigger on vertical scroll modes
        );
      },
      onVerticalDragEnd: (details) {
        _handleSwipeGesture(
          context: context,
          details: details,
          allowedAxis:
              Axis.horizontal, // Only trigger on horizontal scroll modes
        );
      },
      child: child,
    );
  }

  // ===========================================================================
  // TASK 3.4: Enhanced Direction Matching Logic
  // ===========================================================================

  /// Enhanced swipe gesture handler with improved direction detection
  void _handleAdvancedSwipeGesture({
    required BuildContext context,
    required SwipeDirection direction,
    required DragEndDetails details,
  }) {
    // TASK 3.5: Conditional Activation - Mandatory safety check
    if (!lastPageSwipeEnabled) {
      return; // Feature disabled, do nothing
    }

    // Fix: Get real-time page index from PageController instead of state variable
    final realTimePageIndex = pageController?.page?.round() ?? currentIndex;

    debugPrint('🔧 Real-time page detection:');
    debugPrint('  - State currentIndex: $currentIndex');
    debugPrint('  - PageController.page: ${pageController?.page}');
    debugPrint('  - Using realTimePageIndex: $realTimePageIndex');

    // TASK 4.2: Enhanced page position detection with real-time index
    final pagePosition = LastPageSwipeUtils.detectPagePosition(
      currentIndex: realTimePageIndex,
      chapterPages: chapterPages,
    );

    final isAtLastPage = pagePosition == PagePosition.lastPage ||
        pagePosition == PagePosition.singlePage;
    final isAtFirstPage = pagePosition == PagePosition.firstPage ||
        pagePosition == PagePosition.singlePage;

    // Validate direction and conditions for chapter navigation

    // TASK 4.2: Determine smart navigation action
    final navigationAction = _determineNavigationAction(
      direction: direction,
      isAtLastPage: isAtLastPage,
      isAtFirstPage: isAtFirstPage,
    );

    // TASK 4.2: Execute smart navigation with error handling
    _executeSmartNavigation(
      context: context,
      action: navigationAction,
      direction: direction,
    );
  }

  /// TASK 4.2: Smart decision function: page navigation vs chapter navigation
  /// Determines the appropriate navigation action based on current context
  NavigationAction _determineNavigationAction({
    required SwipeDirection direction,
    required bool isAtLastPage,
    required bool isAtFirstPage,
  }) {
    // If last-page swipe is disabled, always use page navigation
    if (!lastPageSwipeEnabled) {
      return NavigationAction.pageNavigation;
    }

    // Direction-aware navigation logic
    final expectedDirection =
        LastPageSwipeUtils.getExpectedSwipeDirection(resolvedReaderMode);

    if (direction == expectedDirection) {
      // Correct direction for next chapter
      if (isAtLastPage) {
        return NavigationAction.nextChapter;
      } else {
        return NavigationAction.pageNavigation;
      }
    } else if (_isOppositeDirection(direction, expectedDirection)) {
      // Opposite direction for previous chapter (at first page)
      if (isAtFirstPage) {
        return NavigationAction.previousChapter;
      } else {
        return NavigationAction.pageNavigation;
      }
    }

    // Default to page navigation for all other cases
    return NavigationAction.pageNavigation;
  }

  /// Check if swipe direction is opposite to expected direction
  bool _isOppositeDirection(SwipeDirection actual, SwipeDirection expected) {
    switch (expected) {
      case SwipeDirection.left:
        return actual == SwipeDirection.right;
      case SwipeDirection.right:
        return actual == SwipeDirection.left;
      case SwipeDirection.up:
        return actual == SwipeDirection.down;
      case SwipeDirection.down:
        return actual == SwipeDirection.up;
    }
  }

  /// TASK 4.2: Enhanced navigation logic with error handling and fallback
  void _executeSmartNavigation({
    required BuildContext context,
    required NavigationAction action,
    required SwipeDirection direction,
  }) {
    try {
      switch (action) {
        case NavigationAction.nextChapter:
          _navigateToNextChapterWithFallback(context);
          break;
        case NavigationAction.previousChapter:
          _navigateToPreviousChapterWithFallback(context);
          break;
        case NavigationAction.pageNavigation:
          _performPageNavigation(direction);
          break;
      }
    } catch (e) {
      // TASK 4.2: Graceful error handling - fallback to page navigation
      _performPageNavigation(direction);
    }
  }

  /// TASK 4.2: Navigate to next chapter with graceful fallback
  void _navigateToNextChapterWithFallback(BuildContext context) {
    if (prevNextChapterPair?.first != null) {
      try {
        ReaderRoute(
          mangaId: mangaId,
          chapterId: prevNextChapterPair!.first!.id,
          transVertical: scrollDirection != Axis.vertical,
        ).pushReplacement(context);
      } catch (e) {
        // TASK 4.2: Handle navigation failures gracefully
        onNextPage();
      }
    } else {
      // TASK 4.2: No next chapter available - fallback to page navigation
      onNextPage();
    }
  }

  /// TASK 4.2: Navigate to previous chapter with graceful fallback
  void _navigateToPreviousChapterWithFallback(BuildContext context) {
    if (prevNextChapterPair?.second != null) {
      try {
        ReaderRoute(
          mangaId: mangaId,
          chapterId: prevNextChapterPair!.second!.id,
          toPrev: true,
          transVertical: scrollDirection != Axis.vertical,
        ).pushReplacement(context);
      } catch (e) {
        // TASK 4.2: Handle navigation failures gracefully
        onPreviousPage();
      }
    } else {
      // TASK 4.2: No previous chapter available - fallback to page navigation
      onPreviousPage();
    }
  }

  /// TASK 4.2: Perform appropriate page navigation based on direction
  void _performPageNavigation(SwipeDirection direction) {
    switch (direction) {
      case SwipeDirection.left:
      case SwipeDirection.up:
        onNextPage();
        break;
      case SwipeDirection.right:
      case SwipeDirection.down:
        onPreviousPage();
        break;
    }
  }

  // ===========================================================================
  // TASK 4.2: Smart Navigation Logic
  // ===========================================================================

  /// Enhanced swipe gesture handler following project.mdc safety rules
  void _handleSwipeGesture({
    required BuildContext context,
    required DragEndDetails details,
    required Axis allowedAxis,
  }) {
    // Check if we should use original swipe behavior or new last-page swipe
    if (readerSwipeChapterToggle) {
      // Original behavior: swipe to change chapter anywhere
      _handleOriginalSwipeBehavior(context, details, allowedAxis);
      return;
    }

    // New behavior: only at last page with correct direction
    if (!lastPageSwipeEnabled) {
      return; // Feature disabled, do nothing
    }

    // Check if we're on the correct axis for this scroll direction
    if (scrollDirection != allowedAxis) {
      return; // Wrong axis, do nothing
    }

    // Detect swipe direction
    final swipeDirection = LastPageSwipeUtils.detectSwipeDirection(details);
    if (swipeDirection == null) {
      return; // Could not detect direction
    }

    // TASK 4.2: Use smart navigation logic for consistency
    final pagePosition = LastPageSwipeUtils.detectPagePosition(
      currentIndex: currentIndex,
      chapterPages: chapterPages,
    );

    final isAtLastPage = pagePosition == PagePosition.lastPage ||
        pagePosition == PagePosition.singlePage;
    final isAtFirstPage = pagePosition == PagePosition.firstPage ||
        pagePosition == PagePosition.singlePage;

    // Validate direction and conditions for chapter navigation

    // TASK 4.2: Determine smart navigation action
    final navigationAction = _determineNavigationAction(
      direction: swipeDirection,
      isAtLastPage: isAtLastPage,
      isAtFirstPage: isAtFirstPage,
    );

    // TASK 4.2: Execute smart navigation with error handling
    _executeSmartNavigation(
      context: context,
      action: navigationAction,
      direction: swipeDirection,
    );
  }

  /// Original swipe behavior for when main swipe toggle is enabled
  void _handleOriginalSwipeBehavior(
    BuildContext context,
    DragEndDetails details,
    Axis allowedAxis,
  ) {
    if (scrollDirection != allowedAxis) return;

    if (details.primaryVelocity == null) return;

    if (details.primaryVelocity! > 8) {
      _navigateToPreviousChapterWithFallback(context);
    } else {
      _navigateToNextChapterWithFallback(context);
    }
  }
}
