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
    required this.onNextPage,
    required this.onPreviousPage,
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
  final VoidCallback onNextPage;
  final VoidCallback onPreviousPage;
  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    final bool useAdvancedGestures =
        lastPageSwipeEnabled && !readerSwipeChapterToggle;

    if (useAdvancedGestures) {
      return _buildAdvancedGestureHandler(context);
    } else {
      return _buildSimpleGestureHandler(context);
    }
  }

  /// Advanced gesture handler using RawGestureDetector for proper arena competition
  Widget _buildAdvancedGestureHandler(BuildContext context) {
    return GestureDetector(
      onLongPressStart: onLongPressStart,
      onLongPressEnd: onLongPressEnd,
      onLongPressMoveUpdate: onLongPressMoveUpdate,
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      onPanEnd: (details) {
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
          allowedAxis: Axis.vertical,
        );
      },
      onVerticalDragEnd: (details) {
        _handleSwipeGesture(
          context: context,
          details: details,
          allowedAxis: Axis.horizontal,
        );
      },
      child: child,
    );
  }

  /// Enhanced swipe gesture handler with improved direction detection
  void _handleAdvancedSwipeGesture({
    required BuildContext context,
    required SwipeDirection direction,
    required DragEndDetails details,
  }) {
    // In continuous vertical readers, treat drag end as a swipe only at
    // chapter edges to avoid interfering with normal scrolling.

    final bool isContinuousVerticalMode =
        resolvedReaderMode == ReaderMode.webtoon ||
            resolvedReaderMode == ReaderMode.continuousVertical;

    // Resolve current page index for edge checks.
    if (!lastPageSwipeEnabled) {
      return;
    }
    final realTimePageIndex = pageController?.page?.round() ?? currentIndex;

    final pagePosition = LastPageSwipeUtils.detectPagePosition(
      currentIndex: realTimePageIndex,
      chapterPages: chapterPages,
    );

    final isAtLastPage = pagePosition == PagePosition.lastPage ||
        pagePosition == PagePosition.singlePage;
    final isAtFirstPage = pagePosition == PagePosition.firstPage ||
        pagePosition == PagePosition.singlePage;

    // Skip swipe handling during mid-chapter scrolling in continuous
    // vertical readers.
    if (isContinuousVerticalMode && !(isAtLastPage || isAtFirstPage)) {
      return;
    }

    final navigationAction = _determineNavigationAction(
      direction: direction,
      isAtLastPage: isAtLastPage,
      isAtFirstPage: isAtFirstPage,
    );

    _executeSmartNavigation(
      context: context,
      action: navigationAction,
      direction: direction,
    );
  }

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
      if (isAtLastPage) {
        return NavigationAction.nextChapter;
      } else {
        return NavigationAction.pageNavigation;
      }
    } else if (_isOppositeDirection(direction, expectedDirection)) {
      if (isAtFirstPage) {
        return NavigationAction.previousChapter;
      } else {
        return NavigationAction.pageNavigation;
      }
    }

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

  /// Enhanced navigation logic with error handling and fallback
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
      _performPageNavigation(direction);
    }
  }

  /// Navigate to next chapter with graceful fallback
  void _navigateToNextChapterWithFallback(BuildContext context) {
    if (prevNextChapterPair?.first != null) {
      try {
        ReaderRoute(
          mangaId: mangaId,
          chapterId: prevNextChapterPair!.first!.id,
          transVertical: scrollDirection != Axis.vertical,
        ).pushReplacement(context);
      } catch (e) {
        onNextPage();
      }
    } else {
      onNextPage();
    }
  }

  /// Navigate to previous chapter with graceful fallback
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
        onPreviousPage();
      }
    } else {
      onPreviousPage();
    }
  }

  /// Perform appropriate page navigation based on direction
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

  /// Enhanced swipe gesture handler following project.mdc safety rules
  void _handleSwipeGesture({
    required BuildContext context,
    required DragEndDetails details,
    required Axis allowedAxis,
  }) {
    if (readerSwipeChapterToggle) {
      _handleOriginalSwipeBehavior(context, details, allowedAxis);
      return;
    }

    if (!lastPageSwipeEnabled) {
      return;
    }

    if (scrollDirection != allowedAxis) {
      return;
    }

    final swipeDirection = LastPageSwipeUtils.detectSwipeDirection(details);
    if (swipeDirection == null) {
      return;
    }

    final pagePosition = LastPageSwipeUtils.detectPagePosition(
      currentIndex: currentIndex,
      chapterPages: chapterPages,
    );

    final isAtLastPage = pagePosition == PagePosition.lastPage ||
        pagePosition == PagePosition.singlePage;
    final isAtFirstPage = pagePosition == PagePosition.firstPage ||
        pagePosition == PagePosition.singlePage;

    final navigationAction = _determineNavigationAction(
      direction: swipeDirection,
      isAtLastPage: isAtLastPage,
      isAtFirstPage: isAtFirstPage,
    );

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
