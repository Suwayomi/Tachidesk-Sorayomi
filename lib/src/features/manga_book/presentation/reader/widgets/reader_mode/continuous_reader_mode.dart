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
import '../../../../../settings/presentation/reader/widgets/reader_pinch_to_zoom/reader_pinch_to_zoom.dart';
import '../../../../../settings/presentation/reader/widgets/reader_scroll_animation_tile/reader_scroll_animation_tile.dart';
import '../../../../domain/chapter/chapter_model.dart';
import '../../../../domain/chapter_page/chapter_page_model.dart';
import '../../../../domain/manga/manga_model.dart';
import '../chapter_separator.dart';
import '../reader_wrapper.dart';

/// Configuration constants for improved scroll behavior
class _ScrollConfig {
  const _ScrollConfig._();

  /// Debounce duration for position updates during scrolling
  static const Duration positionUpdateDebounce = Duration(milliseconds: 300);

  /// Threshold for detecting significant position changes
  static const double positionChangeThreshold = 0.5;

  /// Minimum visible area required to consider an item "current"
  static const double minVisibleAreaThreshold = 0.3;
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
    final ValueNotifier<int> lastReportedIndex = useState(currentIndex.value);

    // Dispose timer properly
    useEffect(() {
      return () {
        positionUpdateTimer.value?.cancel();
        positionUpdateTimer.value = null;
      };
    }, []);

    // Completely passive position tracking that only observes
    useEffect(() {
      void listener() {
        // Mark as user scrolling to prevent interference
        isUserScrolling.value = true;

        final List<ItemPosition> positions =
            positionsListener.itemPositions.value.toList();

        if (positions.isEmpty) return;

        // Cancel any pending position updates
        positionUpdateTimer.value?.cancel();

        // Use longer debounce to ensure scroll has settled
        positionUpdateTimer.value =
            Timer(_ScrollConfig.positionUpdateDebounce, () {
          _updateCurrentPositionPassively(
              positions, currentIndex, lastReportedIndex);
          isUserScrolling.value = false;
        });
      }

      positionsListener.itemPositions.addListener(listener);
      return () {
        positionsListener.itemPositions.removeListener(listener);
        positionUpdateTimer.value?.cancel();
      };
    }, []);

    // Notify page changes only when they're significant
    useEffect(() {
      final ValueSetter<int>? pageChanged = onPageChanged;
      if (pageChanged != null &&
          lastReportedIndex.value != currentIndex.value) {
        pageChanged(currentIndex.value);
        lastReportedIndex.value = currentIndex.value;
      }
      return null;
    }, [currentIndex.value]);

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
      onChanged: (int index) => _jumpToPageSafely(
        scrollController,
        isUserScrolling,
        index,
      ),
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

  /// Passive position tracking that only observes scroll position without interfering
  static void _updateCurrentPositionPassively(
    List<ItemPosition> positions,
    ValueNotifier<int> currentIndex,
    ValueNotifier<int> lastReportedIndex,
  ) {
    if (positions.isEmpty) return;

    // Find the item that's most prominently visible
    ItemPosition? bestCandidate;
    double bestVisibleArea = 0.0;

    for (final ItemPosition position in positions) {
      final double visibleArea = _calculateVisibleArea(position);

      // Only consider items that are significantly visible
      if (visibleArea > _ScrollConfig.minVisibleAreaThreshold &&
          visibleArea > bestVisibleArea) {
        bestCandidate = position;
        bestVisibleArea = visibleArea;
      }
    }

    // Only update if we found a good candidate and it's a significant change
    if (bestCandidate != null) {
      final int newIndex = bestCandidate.index;
      final double indexDifference =
          (newIndex - currentIndex.value).abs().toDouble();

      if (indexDifference >= _ScrollConfig.positionChangeThreshold) {
        currentIndex.value = newIndex;
      }
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

  /// Safe page jumping that respects user scroll state
  static void _jumpToPageSafely(
    ItemScrollController scrollController,
    ValueNotifier<bool> isUserScrolling,
    int index,
  ) {
    // Only jump if user is not actively scrolling
    if (!isUserScrolling.value) {
      scrollController.jumpTo(index: index);
    }
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
