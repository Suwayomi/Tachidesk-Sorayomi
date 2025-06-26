// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../../utils/misc/app_utils.dart';
import '../../../../../../widgets/server_image.dart';
import '../../../../../settings/presentation/reader/widgets/reader_infinity_scrolling_mode_tile/reader_infinity_scrolling_mode_tile.dart';
import '../../../../../settings/presentation/reader/widgets/reader_pinch_to_zoom/reader_pinch_to_zoom.dart';
import '../../../../../settings/presentation/reader/widgets/reader_scroll_animation_tile/reader_scroll_animation_tile.dart';
import '../../../../domain/chapter/chapter_model.dart';
import '../../../../domain/chapter_page/chapter_page_model.dart';
import '../../../../domain/manga/manga_model.dart';
import '../chapter_separator.dart';
import '../reader_wrapper.dart';
import 'enhanced_continuous_reader_mode.dart';

/// Configuration constants for improved scroll behavior
class _ScrollConfig {
  const _ScrollConfig._();

  /// Normal visibility threshold for position tracking
  static const double minVisibleAreaThreshold = 0.4;

  /// Extended delay only for programmatic navigation to prevent jumps
  static const Duration programmaticNavigationDelay =
      Duration(milliseconds: 800);
}

class ContinuousReaderMode extends HookConsumerWidget {
  const ContinuousReaderMode({
    super.key,
    required this.manga,
    required this.chapter,
    required this.chapterPages,
    this.showSeparator = false,
    this.onPageChanged,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.showReaderLayoutAnimation = false,
  });

  final MangaDto manga;
  final ChapterDto chapter;
  final bool showSeparator;
  final ValueSetter<int>? onPageChanged;
  final Axis scrollDirection;
  final bool reverse;
  final bool showReaderLayoutAnimation;
  final ChapterPagesDto chapterPages;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Check if infinity scrolling mode is enabled
    final infinityScrollingEnabled = ref.watch(infinityScrollingModeEnabledProvider).ifNull(false);
    
    // Use enhanced mode for webtoon with infinity scrolling enabled
    if (infinityScrollingEnabled && scrollDirection == Axis.vertical && !showSeparator) {
      return EnhancedContinuousReaderMode(
        manga: manga,
        chapter: chapter,
        chapterPages: chapterPages,
        onPageChanged: onPageChanged,
        scrollDirection: scrollDirection,
        reverse: reverse,
        showReaderLayoutAnimation: showReaderLayoutAnimation,
      );
    }

    final ItemScrollController scrollController =
        useMemoized(() => ItemScrollController());
    final ItemPositionsListener positionsListener =
        useMemoized(() => ItemPositionsListener.create());

    final ValueNotifier<int> currentIndex = useState(
      chapter.isRead.ifNull()
          ? 0
          : (chapter.lastPageRead).getValueOnNullOrNegative(),
    );

    // Passive position tracking that doesn't interfere with scrolling
    final ObjectRef<Timer?> positionUpdateTimer = useRef<Timer?>(null);
    final ValueNotifier<bool> isUserScrolling = useState(false);
    final ValueNotifier<bool> isNavigatingFromSlider = useState(false);
    final ValueNotifier<int> lastReportedIndex = useState(currentIndex.value);

    // Dispose timer properly
    useEffect(() {
      return () {
        positionUpdateTimer.value?.cancel();
        positionUpdateTimer.value = null;
      };
    }, []);

    // Enhanced position tracking that allows UI updates but prevents jumps
    useEffect(() {
      void listener() {
        final List<ItemPosition> positions =
            positionsListener.itemPositions.value.toList();

        if (positions.isEmpty) return;

        // Don't update position if we're navigating from slider
        if (!isNavigatingFromSlider.value) {
          // Always update position for UI display (navigation bar needs this)
          _updatePositionForDisplay(positions, currentIndex, lastReportedIndex);
        }

        // Mark as user scrolling to prevent programmatic navigation
        isUserScrolling.value = true;

        // Cancel any pending programmatic navigation
        positionUpdateTimer.value?.cancel();

        // Only allow programmatic navigation after extended delay
        positionUpdateTimer.value =
            Timer(_ScrollConfig.programmaticNavigationDelay, () {
          isUserScrolling.value = false;
          isNavigatingFromSlider.value = false; // Reset slider navigation flag
        });
      }

      positionsListener.itemPositions.addListener(listener);
      return () {
        positionsListener.itemPositions.removeListener(listener);
        positionUpdateTimer.value?.cancel();
      };
    }, []);

    // Notify page changes for UI updates (navigation bar) but prevent programmatic jumps
    useEffect(() {
      final ValueSetter<int>? pageChanged = onPageChanged;
      if (pageChanged != null &&
          lastReportedIndex.value != currentIndex.value) {
        // Always notify for UI display updates
        pageChanged(currentIndex.value);
        lastReportedIndex.value = currentIndex.value;
      }
      return null;
    }, [currentIndex.value]); // Only watch currentIndex changes

    final bool isAnimationEnabled =
        ref.read(readerScrollAnimationProvider).ifNull(true);
    final bool isPinchToZoomEnabled =
        ref.read(pinchToZoomProvider).ifNull(true);

    return ReaderWrapper(
      scrollDirection: scrollDirection,
      chapterPages: chapterPages,
      chapter: chapter,
      manga: manga,
      showReaderLayoutAnimation: showReaderLayoutAnimation,
      currentIndex: currentIndex.value,
      onChanged: (index) {
        // Mark that we're navigating from slider to prevent position interference
        isNavigatingFromSlider.value = true;

        // Update current index for display
        currentIndex.value = index;

        // Force navigation for slider - bypass scroll state checks
        _jumpToPageSafely(
          scrollController,
          isUserScrolling,
          index,
          forceNavigation: true,
        );

        // Reset the flag after the navigation completes
        Timer(const Duration(milliseconds: 300), () {
          isNavigatingFromSlider.value = false;
        });
      },
      // Disable automatic previous/next navigation for webtoon to prevent jumping
      onPrevious: () => _handleNavigationSafely(
        scrollController,
        positionsListener,
        isUserScrolling,
        isAnimationEnabled,
        isNext: false,
      ),
      onNext: () => _handleNavigationSafely(
        scrollController,
        positionsListener,
        isUserScrolling,
        isAnimationEnabled,
        isNext: true,
      ),
      child: AppUtils.wrapOn(
        !kIsWeb &&
                (Platform.isAndroid || Platform.isIOS) &&
                isPinchToZoomEnabled
            ? (Widget child) => InteractiveViewer(maxScale: 5, child: child)
            : null,
        ScrollablePositionedList.separated(
          itemScrollController: scrollController,
          itemPositionsListener: positionsListener,
          initialScrollIndex: chapter.isRead.ifNull()
              ? 0
              : chapter.lastPageRead.getValueOnNullOrNegative(),
          scrollDirection: scrollDirection,
          reverse: reverse,
          itemCount: chapterPages.chapter.pageCount,
          minCacheExtent: scrollDirection == Axis.vertical
              ? context.height * 2
              : context.width * 2,
          separatorBuilder: (BuildContext context, int index) =>
              showSeparator ? const Gap(16) : const SizedBox.shrink(),
          itemBuilder: (BuildContext context, int index) {
            final Widget image = ServerImage(
              showReloadButton: true,
              fit: scrollDirection == Axis.vertical
                  ? BoxFit.fitWidth
                  : BoxFit.fitHeight,
              appendApiToUrl: false,
              imageUrl: chapterPages.pages[index],
              progressIndicatorBuilder: (_, __, downloadProgress) => Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
              ),
              wrapper: (Widget child) => SizedBox(
                height: scrollDirection == Axis.vertical
                    ? context.height * .7
                    : null,
                width: scrollDirection != Axis.vertical
                    ? context.width * .7
                    : null,
                child: child,
              ),
            );

            if (index == 0 || index == chapterPages.chapter.pageCount - 1) {
              final bool reverseDirection =
                  scrollDirection == Axis.horizontal && reverse;
              final Widget separator = SizedBox(
                width: scrollDirection != Axis.vertical
                    ? context.width * .5
                    : null,
                child: ChapterSeparator(
                  manga: manga,
                  chapter: chapter,
                  isPreviousChapterSeparator: (index == 0),
                ),
              );
              return Flex(
                direction: scrollDirection,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: ((index == 0) != reverseDirection)
                    ? [separator, image]
                    : [image, separator],
              );
            } else {
              return image;
            }
          },
        ),
      ),
    );
  }

  /// Immediate position tracking for UI display (navigation bar)
  static void _updatePositionForDisplay(
    List<ItemPosition> positions,
    ValueNotifier<int> currentIndex,
    ValueNotifier<int> lastReportedIndex,
  ) {
    if (positions.isEmpty) return;

    // Find the item that's most visible for display purposes
    ItemPosition? mostVisible;
    double bestVisibleArea = 0.0;

    for (final ItemPosition position in positions) {
      final double visibleArea = _calculateVisibleArea(position);

      if (visibleArea > bestVisibleArea &&
          visibleArea > _ScrollConfig.minVisibleAreaThreshold) {
        bestVisibleArea = visibleArea;
        mostVisible = position;
      }
    }

    if (mostVisible != null) {
      // Update current index for display but don't trigger programmatic scrolling
      currentIndex.value = mostVisible.index;
    }
  }

  /// Calculates visible area of an item position more accurately
  static double _calculateVisibleArea(ItemPosition position) {
    final double leadingEdge = position.itemLeadingEdge.clamp(0.0, 1.0);
    final double trailingEdge = position.itemTrailingEdge.clamp(0.0, 1.0);

    // Calculate the portion that's actually visible in the viewport
    final double visibleStart = leadingEdge < 0 ? 0.0 : leadingEdge;
    final double visibleEnd = trailingEdge > 1 ? 1.0 : trailingEdge;

    return (visibleEnd - visibleStart).clamp(0.0, 1.0);
  }

  /// Safe page jumping that respects user scroll state unless forced (for slider navigation)
  static void _jumpToPageSafely(
    ItemScrollController scrollController,
    ValueNotifier<bool> isUserScrolling,
    int index, {
    bool forceNavigation = false,
  }) {
    // Allow forced navigation (from slider) or when user isn't scrolling
    if (!forceNavigation && isUserScrolling.value) {
      return; // Only block automatic navigation during user scrolling
    }

    // Perform the navigation
    scrollController.jumpTo(index: index);
  }

  /// Safe navigation that only works when appropriate and doesn't interfere with scrolling
  static void _handleNavigationSafely(
      ItemScrollController scrollController,
      ItemPositionsListener positionsListener,
      ValueNotifier<bool> isUserScrolling,
      bool isAnimationEnabled,
      {required bool isNext}) {
    // Don't interfere if user is actively scrolling
    if (isUserScrolling.value) return;

    final List<ItemPosition> positions =
        positionsListener.itemPositions.value.toList();
    if (positions.isEmpty) return;

    // Find current position
    ItemPosition? currentPosition;
    for (final ItemPosition position in positions) {
      final double visibleArea = _calculateVisibleArea(position);
      if (visibleArea > _ScrollConfig.minVisibleAreaThreshold) {
        currentPosition = position;
        break;
      }
    }

    if (currentPosition == null) return;

    final int targetIndex;
    final double alignment;

    if (isNext) {
      // Move to next item with minimal scroll
      if (currentPosition.itemTrailingEdge > 0.8) {
        targetIndex = currentPosition.index + 1;
        alignment = 0.0;
      } else {
        targetIndex = currentPosition.index;
        alignment = 0.0;
      }
    } else {
      // Move to previous item with minimal scroll
      if (currentPosition.itemLeadingEdge < 0.2) {
        targetIndex =
            (currentPosition.index - 1).clamp(0, double.infinity).toInt();
        alignment = 0.0;
      } else {
        targetIndex = currentPosition.index;
        alignment = 0.0;
      }
    }

    // Use very gentle navigation
    if (isAnimationEnabled) {
      scrollController.scrollTo(
        index: targetIndex,
        duration:
            const Duration(milliseconds: 200), // Faster, gentler animation
        curve: Curves.easeOut, // Gentler curve
        alignment: alignment,
      );
    } else {
      scrollController.jumpTo(
        index: targetIndex,
        alignment: alignment,
      );
    }
  }
}
