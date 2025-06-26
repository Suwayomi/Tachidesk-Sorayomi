// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
import '../../../manga_details/controller/manga_details_controller.dart';
import '../reader_wrapper.dart';
import 'infinity_continuous/infinity_continuous_chapter_loader.dart';
import 'infinity_continuous/infinity_continuous_config.dart';
import 'infinity_continuous/infinity_continuous_feedback.dart';
import 'infinity_continuous/infinity_continuous_navigation.dart';
import 'infinity_continuous/infinity_continuous_utils.dart';

/// Infinity continuous reader mode with support for multi-chapter loading
class InfinityContinuousReaderMode extends HookConsumerWidget {
  const InfinityContinuousReaderMode({
    super.key,
    required this.manga,
    required this.chapter,
    required this.chapterPages,
    this.onPageChanged,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.showReaderLayoutAnimation = false,
  });

  final MangaDto manga;
  final ChapterDto chapter;
  final ChapterPagesDto chapterPages;
  final ValueSetter<int>? onPageChanged;
  final Axis scrollDirection;
  final bool reverse;
  final bool showReaderLayoutAnimation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final infinityScrollingEnabled =
        ref.watch(infinityScrollingModeEnabledProvider).ifNull(false);

    // If continuous reading is disabled, use the normal continuous reader mode
    if (!infinityScrollingEnabled || scrollDirection != Axis.vertical) {
      return _buildNormalMode(context, ref);
    }

    return _buildContinuousMode(context, ref);
  }

  /// Builds the normal continuous reader mode
  Widget _buildNormalMode(BuildContext context, WidgetRef ref) {
    final ItemScrollController scrollController =
        useMemoized(() => ItemScrollController());
    final ItemPositionsListener positionsListener =
        useMemoized(() => ItemPositionsListener.create());

    final ValueNotifier<int> currentIndex = useState(
      chapter.isRead.ifNull()
          ? 0
          : (chapter.lastPageRead).getValueOnNullOrNegative(),
    );

    // Enhanced position tracking that allows UI updates but prevents jumps
    useEffect(() {
      void listener() {
        final List<ItemPosition> positions =
            positionsListener.itemPositions.value.toList();

        if (positions.isEmpty) return;

        // Find the item that's most visible for display purposes
        ItemPosition? mostVisible;
        double bestVisibleArea = 0.0;

        for (final ItemPosition position in positions) {
          final double visibleArea =
              InfinityContinuousUtils.calculateVisibleArea(position);

          if (visibleArea > bestVisibleArea &&
              visibleArea > InfinityContinuousConfig.minVisibleAreaThreshold) {
            bestVisibleArea = visibleArea;
            mostVisible = position;
          }
        }

        if (mostVisible != null) {
          currentIndex.value = mostVisible.index;
        }
      }

      positionsListener.itemPositions.addListener(listener);
      return () => positionsListener.itemPositions.removeListener(listener);
    }, []);

    // Notify page changes for UI updates
    useEffect(() {
      final ValueSetter<int>? pageChanged = onPageChanged;
      if (pageChanged != null) {
        pageChanged(currentIndex.value);
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
      onChanged: (index) {
        currentIndex.value = index;
        scrollController.jumpTo(index: index);
      },
      onPrevious: () => InfinityContinuousNavigation.handleNavigation(
        scrollController,
        positionsListener,
        isAnimationEnabled,
        isNext: false,
      ),
      onNext: () => InfinityContinuousNavigation.handleNavigation(
        scrollController,
        positionsListener,
        isAnimationEnabled,
        isNext: true,
      ),
      child: AppUtils.wrapOn(
        !kIsWeb &&
                (Platform.isAndroid || Platform.isIOS) &&
                isPinchToZoomEnabled
            ? (Widget child) => InteractiveViewer(
                  maxScale: InfinityContinuousConfig.maxZoomScale,
                  child: child,
                )
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
              ? context.height *
                  InfinityContinuousConfig.verticalCacheMultiplier
              : context.width *
                  InfinityContinuousConfig.horizontalCacheMultiplier,
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox.shrink(),
          itemBuilder: (BuildContext context, int index) {
            return _buildPageItem(context, index);
          },
        ),
      ),
    );
  }

  /// Builds the continuous reading mode with multi-chapter support
  Widget _buildContinuousMode(BuildContext context, WidgetRef ref) {
    final ItemScrollController scrollController =
        useMemoized(() => ItemScrollController());
    final ItemPositionsListener positionsListener =
        useMemoized(() => ItemPositionsListener.create());

    final ValueNotifier<int> currentIndex = useState(
      chapter.isRead.ifNull()
          ? 0
          : (chapter.lastPageRead).getValueOnNullOrNegative(),
    );

    // Track which chapters are loaded with their metadata in order
    final loadedChapters = useState<
        List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>>([
      (pages: chapterPages, chapter: chapter, chapterId: chapter.id),
    ]);

    // Track chapter loading states
    final loadingNext = useState(false);
    final loadingPrevious = useState(false);
    final hasReachedEnd = useState(false);
    final hasReachedStart = useState(false);

    // Track the currently visible chapter for UI updates
    final currentVisibleChapter = useState<ChapterDto>(chapter);
    final currentChapterPageIndex = useState(
      chapter.isRead.ifNull()
          ? 0
          : (chapter.lastPageRead).getValueOnNullOrNegative(),
    );

    // Track next/previous chapters dynamically based on current visible chapter
    final nextPrevChapterPair =
        useState<({ChapterDto? first, ChapterDto? second})?>(null);

    // Debouncing for user feedback to prevent spam
    final lastEndFeedbackTime = useRef<DateTime?>(null);
    final lastStartFeedbackTime = useRef<DateTime?>(null);

    // Get next and previous chapters for the currently visible chapter
    useEffect(() {
      void updateNextPrevChapters() async {
        final currentChapterId = currentVisibleChapter.value.id;

        try {
          final nextPrevChapters = ref.read(
            getNextAndPreviousChaptersProvider(
              mangaId: manga.id,
              chapterId: currentChapterId,
            ),
          );
          nextPrevChapterPair.value = nextPrevChapters;
        } catch (e) {
          nextPrevChapterPair.value = null;
        }
      }

      updateNextPrevChapters();
      return null;
    }, [currentVisibleChapter.value.id]);

    // Update current index based on scroll position
    useEffect(() {
      void listener() {
        final List<ItemPosition> positions =
            positionsListener.itemPositions.value.toList();
        if (positions.isEmpty) return;

        // Update current index for UI display and track visible chapter
        InfinityContinuousUtils.updateCurrentIndexAndChapter(
          positions,
          currentIndex,
          loadedChapters.value,
          currentVisibleChapter,
          currentChapterPageIndex,
          InfinityContinuousConfig.minVisibleAreaThreshold,
        );
      }

      positionsListener.itemPositions.addListener(listener);
      return () => positionsListener.itemPositions.removeListener(listener);
    }, []);

    // Notify page changes for UI updates
    useEffect(() {
      final ValueSetter<int>? pageChanged = onPageChanged;
      if (pageChanged != null) {
        // Use the chapter-relative page index for callback
        pageChanged(currentChapterPageIndex.value);
      }
      return null;
    }, [currentChapterPageIndex.value]);

    final bool isAnimationEnabled =
        ref.read(readerScrollAnimationProvider).ifNull(true);
    final bool isPinchToZoomEnabled =
        ref.read(pinchToZoomProvider).ifNull(true);

    return ReaderWrapper(
      scrollDirection: scrollDirection,
      chapterPages: InfinityContinuousUtils.createChapterPagesDto(
          loadedChapters.value, currentVisibleChapter.value, chapterPages),
      chapter: currentVisibleChapter.value,
      manga: manga,
      showReaderLayoutAnimation: showReaderLayoutAnimation,
      currentIndex: currentChapterPageIndex.value,
      onChanged: (index) {
        // Convert chapter-relative index to global index and scroll
        final globalIndex =
            InfinityContinuousUtils.convertChapterIndexToGlobalIndex(
          index,
          loadedChapters.value,
          currentVisibleChapter.value.id,
        );
        if (globalIndex >= 0) {
          currentIndex.value = globalIndex;
          scrollController.jumpTo(index: globalIndex);
        }
      },
      onPrevious: () => InfinityContinuousNavigation.handleNavigation(
        scrollController,
        positionsListener,
        isAnimationEnabled,
        isNext: false,
      ),
      onNext: () => InfinityContinuousNavigation.handleNavigation(
        scrollController,
        positionsListener,
        isAnimationEnabled,
        isNext: true,
      ),
      child: AppUtils.wrapOn(
        !kIsWeb &&
                (Platform.isAndroid || Platform.isIOS) &&
                isPinchToZoomEnabled
            ? (Widget child) => InteractiveViewer(
                  maxScale: InfinityContinuousConfig.maxZoomScale,
                  child: child,
                )
            : null,
        NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            if (notification is OverscrollNotification) {
              _handleInfinityOverscroll(
                notification,
                ref,
                context,
                nextPrevChapterPair.value,
                loadedChapters,
                loadingNext,
                loadingPrevious,
                hasReachedEnd,
                hasReachedStart,
                lastEndFeedbackTime,
                lastStartFeedbackTime,
                scrollController,
                positionsListener,
              );
            }
            return false;
          },
          child: ScrollablePositionedList.separated(
            itemScrollController: scrollController,
            itemPositionsListener: positionsListener,
            initialScrollIndex: chapter.isRead.ifNull()
                ? 0
                : chapter.lastPageRead.getValueOnNullOrNegative(),
            scrollDirection: scrollDirection,
            reverse: reverse,
            itemCount:
                InfinityContinuousUtils.getTotalPages(loadedChapters.value),
            minCacheExtent: context.height *
                InfinityContinuousConfig.verticalCacheMultiplier,
            separatorBuilder: (BuildContext context, int index) =>
                _buildSeparator(context, index, loadedChapters.value),
            itemBuilder: (BuildContext context, int index) {
              return _buildContinuousPageItem(
                context,
                index,
                loadedChapters.value,
                loadingNext.value,
                loadingPrevious.value,
                hasReachedEnd.value,
                hasReachedStart.value,
              );
            },
          ),
        ),
      ),
    );
  }

  /// Builds a page item for normal mode
  Widget _buildPageItem(BuildContext context, int index) {
    final Widget image = ServerImage(
      showReloadButton: true,
      fit:
          scrollDirection == Axis.vertical ? BoxFit.fitWidth : BoxFit.fitHeight,
      appendApiToUrl: false,
      imageUrl: chapterPages.pages[index],
      progressIndicatorBuilder: (_, __, downloadProgress) => Center(
        child: CircularProgressIndicator(
          value: downloadProgress.progress,
        ),
      ),
      wrapper: (Widget child) => SizedBox(
        height: scrollDirection == Axis.vertical
            ? context.height * InfinityContinuousConfig.verticalPageHeightRatio
            : null,
        width: scrollDirection != Axis.vertical
            ? context.width * InfinityContinuousConfig.horizontalPageWidthRatio
            : null,
        child: child,
      ),
    );

    return image;
  }

  /// Builds a page item for continuous mode
  Widget _buildContinuousPageItem(
    BuildContext context,
    int index,
    List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>
        loadedChapters,
    bool loadingNext,
    bool loadingPrevious,
    bool hasReachedEnd,
    bool hasReachedStart,
  ) {
    final chapterInfo =
        InfinityContinuousUtils.getChapterInfoForIndex(index, loadedChapters);
    if (chapterInfo == null) {
      return const SizedBox(
          height: 100, child: Center(child: CircularProgressIndicator()));
    }

    final Widget image = ServerImage(
      showReloadButton: true,
      fit: BoxFit.fitWidth,
      appendApiToUrl: false,
      imageUrl: chapterInfo.page,
      progressIndicatorBuilder: (_, __, downloadProgress) => Center(
        child: CircularProgressIndicator(
          value: downloadProgress.progress,
        ),
      ),
      wrapper: (Widget child) => SizedBox(
        height:
            context.height * InfinityContinuousConfig.verticalPageHeightRatio,
        child: child,
      ),
    );

    return image;
  }

  /// Handles overscroll events for infinity mode chapter loading
  void _handleInfinityOverscroll(
    OverscrollNotification notification,
    WidgetRef ref,
    BuildContext context,
    ({ChapterDto? first, ChapterDto? second})? nextPrevChapterPair,
    ValueNotifier<
            List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>>
        loadedChapters,
    ValueNotifier<bool> loadingNext,
    ValueNotifier<bool> loadingPrevious,
    ValueNotifier<bool> hasReachedEnd,
    ValueNotifier<bool> hasReachedStart,
    ObjectRef<DateTime?> lastEndFeedbackTime,
    ObjectRef<DateTime?> lastStartFeedbackTime,
    ItemScrollController scrollController,
    ItemPositionsListener positionsListener,
  ) {
    // Load next chapter on overscroll down
    if (notification.overscroll >
            InfinityContinuousConfig.overscrollThreshold &&
        !loadingNext.value &&
        !hasReachedEnd.value &&
        nextPrevChapterPair?.first != null) {
      InfinityContinuousChapterLoader.loadNextChapter(
        ref,
        nextPrevChapterPair!.first!,
        loadedChapters,
        loadingNext,
        hasReachedEnd,
      );
    }

    // Load previous chapter on overscroll up
    if (notification.overscroll <
            -InfinityContinuousConfig.overscrollThreshold &&
        !loadingPrevious.value &&
        !hasReachedStart.value &&
        nextPrevChapterPair?.second != null) {
      InfinityContinuousChapterLoader.loadPreviousChapter(
        ref,
        nextPrevChapterPair!.second!,
        loadedChapters,
        loadingPrevious,
        hasReachedStart,
        scrollController,
        positionsListener,
      );
    }

    // Show user feedback when trying to scroll past the last chapter
    if (notification.overscroll > InfinityContinuousConfig.feedbackThreshold &&
        hasReachedEnd.value &&
        !loadingNext.value &&
        nextPrevChapterPair?.first == null) {
      InfinityContinuousFeedback.showEndOfMangaFeedback(
          context, lastEndFeedbackTime);
    }

    // Show user feedback when trying to scroll past the first chapter
    if (notification.overscroll < -InfinityContinuousConfig.feedbackThreshold &&
        hasReachedStart.value &&
        !loadingPrevious.value &&
        nextPrevChapterPair?.second == null) {
      InfinityContinuousFeedback.showStartOfMangaFeedback(
          context, lastStartFeedbackTime);
    }
  }

  /// Builds separator for continuous mode
  Widget _buildSeparator(
      BuildContext context,
      int index,
      List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>
          loadedChapters) {
    final isChapterBoundary =
        InfinityContinuousUtils.isChapterBoundary(index, loadedChapters);

    if (!isChapterBoundary) {
      return const SizedBox
          .shrink(); // No separator for pages within the same chapter
    }

    // Double-check: ensure we have multiple chapters loaded before showing separator
    if (loadedChapters.length <= 1) {
      return const SizedBox
          .shrink(); // Don't show separator if only one chapter is loaded
    }

    // Determine if this is a chapter start or end
    final separatorInfo = InfinityContinuousChapterSeparator.getSeparatorInfo(
        index, loadedChapters);
    if (separatorInfo == null) return const SizedBox.shrink();

    return InfinityContinuousChapterSeparator(
      chapterName: separatorInfo.chapterName,
      isChapterStart: separatorInfo.isChapterStart,
    );
  }
}
