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
import '../../../manga_details/controller/manga_details_controller.dart';
import '../../controller/reader_controller.dart';
import '../chapter_separator.dart';
import '../reader_wrapper.dart';

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
          final double visibleArea = _calculateVisibleArea(position);

          if (visibleArea > bestVisibleArea && visibleArea > 0.4) {
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
      onPrevious: () => _handleNavigation(
        scrollController,
        positionsListener,
        isAnimationEnabled,
        isNext: false,
      ),
      onNext: () => _handleNavigation(
        scrollController,
        positionsListener,
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
          separatorBuilder: (BuildContext context, int index) => const Gap(16),
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

    // Track scroll boundary state for fallback triggering
    final isAtEnd = useState(false);
    final isAtStart = useState(false);
    final endBoundaryTimer = useRef<Timer?>(null);
    final startBoundaryTimer = useRef<Timer?>(null);

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

    // Get next and previous chapters for the currently visible chapter
    useEffect(() {
      void updateNextPrevChapters() async {
        final currentChapterId = currentVisibleChapter.value.id;
        print(
            'Debug: Getting next/prev chapters for chapter $currentChapterId');

        try {
          final nextPrevChapters = ref.read(
            getNextAndPreviousChaptersProvider(
              mangaId: manga.id,
              chapterId: currentChapterId,
            ),
          );
          nextPrevChapterPair.value = nextPrevChapters;
          print(
              'Debug: Updated next/prev chapters - next: ${nextPrevChapters?.first?.id}, prev: ${nextPrevChapters?.second?.id}');
        } catch (e) {
          print('Debug: Error getting next/prev chapters: $e');
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
        _updateCurrentIndexAndChapter(
          positions,
          currentIndex,
          loadedChapters.value,
          currentVisibleChapter,
          currentChapterPageIndex,
        );
      }

      positionsListener.itemPositions.addListener(listener);
      return () => positionsListener.itemPositions.removeListener(listener);
    }, []);

    // Cleanup timers
    useEffect(() {
      return () {
        endBoundaryTimer.value?.cancel();
        startBoundaryTimer.value?.cancel();
      };
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
      chapterPages: _createChapterPagesDto(
          loadedChapters.value, currentVisibleChapter.value),
      chapter: currentVisibleChapter.value,
      manga: manga,
      showReaderLayoutAnimation: showReaderLayoutAnimation,
      currentIndex: currentChapterPageIndex.value,
      onChanged: (index) {
        // Convert chapter-relative index to global index and scroll
        final globalIndex = _convertChapterIndexToGlobalIndex(
          index,
          loadedChapters.value,
          currentVisibleChapter.value.id,
        );
        if (globalIndex >= 0) {
          currentIndex.value = globalIndex;
          scrollController.jumpTo(index: globalIndex);
        }
      },
      onPrevious: () => _handleNavigation(
        scrollController,
        positionsListener,
        isAnimationEnabled,
        isNext: false,
      ),
      onNext: () => _handleNavigation(
        scrollController,
        positionsListener,
        isAnimationEnabled,
        isNext: true,
      ),
      child: AppUtils.wrapOn(
        !kIsWeb &&
                (Platform.isAndroid || Platform.isIOS) &&
                isPinchToZoomEnabled
            ? (Widget child) => InteractiveViewer(maxScale: 5, child: child)
            : null,
        NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            // Debug all scroll notifications
            if (notification.depth == 0) {
              print(
                  'Debug: Scroll notification type: ${notification.runtimeType}');
              print(
                  'Debug: Scroll metrics - pixels: ${notification.metrics.pixels}, maxScrollExtent: ${notification.metrics.maxScrollExtent}');
            }

            // Handle overscroll for infinity mode chapter loading
            if (notification is OverscrollNotification &&
                notification.depth == 0) {
              _handleInfinityOverscroll(
                notification,
                ref,
                nextPrevChapterPair.value,
                loadedChapters,
                loadingNext,
                loadingPrevious,
                hasReachedEnd,
                hasReachedStart,
              );
            }

            // Also check if we're at the scroll boundary for fallback
            if (notification is ScrollUpdateNotification &&
                notification.depth == 0) {
              final metrics = notification.metrics;
              final atEnd = metrics.pixels >= metrics.maxScrollExtent;
              final atStart = metrics.pixels <= metrics.minScrollExtent;

              // Handle end boundary
              if (atEnd && !isAtEnd.value) {
                isAtEnd.value = true;
                print('Debug: Reached end boundary, starting timer');
                endBoundaryTimer.value?.cancel();
                endBoundaryTimer.value =
                    Timer(const Duration(milliseconds: 200), () {
                  if (isAtEnd.value &&
                      !loadingNext.value &&
                      !hasReachedEnd.value &&
                      nextPrevChapterPair.value?.first != null) {
                    print('Debug: Fallback trigger - loading next chapter');
                    _loadNextChapter(ref, nextPrevChapterPair.value!.first!,
                        loadedChapters, loadingNext, hasReachedEnd);
                  }
                });
              } else if (!atEnd && isAtEnd.value) {
                isAtEnd.value = false;
                endBoundaryTimer.value?.cancel();
              }

              // Handle start boundary
              if (atStart && !isAtStart.value) {
                isAtStart.value = true;
                print('Debug: Reached start boundary, starting timer');
                startBoundaryTimer.value?.cancel();
                startBoundaryTimer.value =
                    Timer(const Duration(milliseconds: 200), () {
                  if (isAtStart.value &&
                      !loadingPrevious.value &&
                      !hasReachedStart.value &&
                      nextPrevChapterPair.value?.second != null) {
                    print('Debug: Fallback trigger - loading previous chapter');
                    _loadPreviousChapter(
                        ref,
                        nextPrevChapterPair.value!.second!,
                        loadedChapters,
                        loadingPrevious,
                        hasReachedStart);
                  }
                });
              } else if (!atStart && isAtStart.value) {
                isAtStart.value = false;
                startBoundaryTimer.value?.cancel();
              }
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
            itemCount: _getTotalPages(loadedChapters.value),
            minCacheExtent: context.height * 3,
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
        height: scrollDirection == Axis.vertical ? context.height * .7 : null,
        width: scrollDirection != Axis.vertical ? context.width * .7 : null,
        child: child,
      ),
    );

    // Add chapter separator at first and last page
    if (index == 0 || index == chapterPages.chapter.pageCount - 1) {
      final bool reverseDirection =
          scrollDirection == Axis.horizontal && reverse;
      final Widget separator = SizedBox(
        width: scrollDirection != Axis.vertical ? context.width * .5 : null,
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
    final chapterInfo = _getChapterInfoForIndex(index, loadedChapters);
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
        height: context.height * .7,
        child: child,
      ),
    );

    return image;
  }

  /// Handles overscroll events for infinity mode chapter loading
  void _handleInfinityOverscroll(
    OverscrollNotification notification,
    WidgetRef ref,
    ({ChapterDto? first, ChapterDto? second})? nextPrevChapterPair,
    ValueNotifier<
            List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>>
        loadedChapters,
    ValueNotifier<bool> loadingNext,
    ValueNotifier<bool> loadingPrevious,
    ValueNotifier<bool> hasReachedEnd,
    ValueNotifier<bool> hasReachedStart,
  ) {
    const double kOverscrollThreshold =
        10.0; // Minimum overscroll distance to trigger

    print(
        'Debug: Overscroll detected: ${notification.overscroll}, threshold: $kOverscrollThreshold');
    print(
        'Debug: Next chapter available: ${nextPrevChapterPair?.first != null}');
    print(
        'Debug: Loading next: ${loadingNext.value}, reached end: ${hasReachedEnd.value}');

    // Load next chapter on overscroll down
    if (notification.overscroll > kOverscrollThreshold &&
        !loadingNext.value &&
        !hasReachedEnd.value &&
        nextPrevChapterPair?.first != null) {
      print(
          'Debug: Triggering next chapter load for ${nextPrevChapterPair!.first!.id}');
      _loadNextChapter(ref, nextPrevChapterPair.first!, loadedChapters,
          loadingNext, hasReachedEnd);
    }

    // Load previous chapter on overscroll up
    if (notification.overscroll < -kOverscrollThreshold &&
        !loadingPrevious.value &&
        !hasReachedStart.value &&
        nextPrevChapterPair?.second != null) {
      print(
          'Debug: Triggering previous chapter load for ${nextPrevChapterPair!.second!.id}');
      _loadPreviousChapter(ref, nextPrevChapterPair.second!, loadedChapters,
          loadingPrevious, hasReachedStart);
    }
  }

  /// Builds separator for continuous mode
  Widget _buildSeparator(
      BuildContext context,
      int index,
      List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>
          loadedChapters) {
    final isChapterBoundary = _isChapterBoundary(index, loadedChapters);

    if (!isChapterBoundary) {
      return const Gap(16);
    }

    // Determine if this is a chapter start or end
    final separatorInfo = _getSeparatorInfo(index, loadedChapters);
    if (separatorInfo == null) return const Gap(16);

    return Column(
      children: [
        const Gap(32),
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: separatorInfo.isChapterStart
                ? context.theme.cardColor
                : context.theme.cardColor.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: separatorInfo.isChapterStart
                  ? context.theme.colorScheme.primary
                  : context.theme.colorScheme.secondary,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Icon(
                separatorInfo.isChapterStart
                    ? Icons.auto_stories_rounded
                    : Icons.bookmark_border_rounded,
                size: 32,
                color: separatorInfo.isChapterStart
                    ? context.theme.colorScheme.primary
                    : context.theme.colorScheme.secondary,
              ),
              const Gap(8),
              Text(
                separatorInfo.isChapterStart
                    ? context.l10n.chapterSeparator
                    : "Chapter Complete",
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: separatorInfo.isChapterStart
                      ? null
                      : context.theme.colorScheme.secondary,
                ),
              ),
              const Gap(4),
              Text(
                separatorInfo.chapterName,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: separatorInfo.isChapterStart
                      ? null
                      : context.theme.colorScheme.secondary,
                ),
                textAlign: TextAlign.center,
              ),
              if (!separatorInfo.isChapterStart) ...[
                const Gap(8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_downward_rounded,
                      size: 16,
                      color: context.theme.colorScheme.secondary,
                    ),
                    const Gap(4),
                    Text(
                      "Next Chapter Below",
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.theme.colorScheme.secondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
        const Gap(32),
      ],
    );
  }

  /// Get separator information for the given index
  ({String chapterName, bool isChapterStart})? _getSeparatorInfo(
    int index,
    List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>
        loadedChapters,
  ) {
    int currentIndex = 0;
    for (int i = 0; i < loadedChapters.length; i++) {
      final chapterData = loadedChapters[i];

      // Check if this is the start of a new chapter (except the first one)
      if (index == currentIndex && currentIndex > 0) {
        return (
          chapterName: chapterData.chapter.name,
          isChapterStart: true,
        );
      }

      // Check if this is the end of a chapter (except the last one)
      if (index == currentIndex + chapterData.pages.pages.length - 1 &&
          i < loadedChapters.length - 1) {
        return (
          chapterName: chapterData.chapter.name,
          isChapterStart: false,
        );
      }

      currentIndex += chapterData.pages.pages.length;
    }
    return null;
  }

  /// Load next chapter
  void _loadNextChapter(
    WidgetRef ref,
    ChapterDto nextChapter,
    ValueNotifier<
            List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>>
        loadedChapters,
    ValueNotifier<bool> loadingNext,
    ValueNotifier<bool> hasReachedEnd,
  ) async {
    print('Debug: Starting to load next chapter ${nextChapter.id}');
    loadingNext.value = true;
    try {
      final nextChapterPages = await ref
          .read(chapterPagesProvider(chapterId: nextChapter.id).future);
      if (nextChapterPages != null) {
        print(
            'Debug: Successfully loaded next chapter ${nextChapter.id} with ${nextChapterPages.pages.length} pages');
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
          print('Debug: Total loaded chapters: ${loadedChapters.value.length}');
        } else {
          print('Debug: Chapter ${nextChapter.id} already loaded, skipping');
        }
      } else {
        print(
            'Debug: Failed to load next chapter ${nextChapter.id} - nextChapterPages is null');
        hasReachedEnd.value = true;
      }
    } catch (e) {
      print('Debug: Error loading next chapter ${nextChapter.id}: $e');
      hasReachedEnd.value = true;
    } finally {
      loadingNext.value = false;
    }
  }

  /// Load previous chapter
  void _loadPreviousChapter(
    WidgetRef ref,
    ChapterDto previousChapter,
    ValueNotifier<
            List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>>
        loadedChapters,
    ValueNotifier<bool> loadingPrevious,
    ValueNotifier<bool> hasReachedStart,
  ) async {
    loadingPrevious.value = true;
    try {
      final prevChapterPages = await ref
          .read(chapterPagesProvider(chapterId: previousChapter.id).future);
      if (prevChapterPages != null) {
        // Check if chapter is already loaded to avoid duplicates
        final alreadyLoaded = loadedChapters.value
            .any((item) => item.chapterId == previousChapter.id);
        if (!alreadyLoaded) {
          // Insert at the beginning
          loadedChapters.value = [
            (
              pages: prevChapterPages,
              chapter: previousChapter,
              chapterId: previousChapter.id
            ),
            ...loadedChapters.value,
          ];
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

  /// Calculate total pages across all loaded chapters
  int _getTotalPages(
      List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>
          loadedChapters) {
    return loadedChapters.fold(
        0, (sum, chapterData) => sum + chapterData.pages.pages.length);
  }

  /// Get chapter info for a specific index
  ({String page, String chapterName, int chapterId})? _getChapterInfoForIndex(
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
  bool _isChapterBoundary(
      int index,
      List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>
          loadedChapters) {
    int currentIndex = 0;
    for (final chapterData in loadedChapters) {
      // Check if this is the start of a new chapter (except the first one)
      if (index == currentIndex && currentIndex > 0) {
        return true;
      }
      // Check if this is the end of a chapter (except the last one)
      if (index == currentIndex + chapterData.pages.pages.length - 1 &&
          currentIndex + chapterData.pages.pages.length <
              _getTotalPageCount(loadedChapters)) {
        return true;
      }
      currentIndex += chapterData.pages.pages.length;
    }
    return false;
  }

  /// Get total page count across all loaded chapters
  int _getTotalPageCount(
      List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>
          loadedChapters) {
    return loadedChapters.fold(
        0, (sum, chapter) => sum + chapter.pages.pages.length);
  }

  /// Update current index based on visible positions
  void _updateCurrentIndexAndChapter(
    List<ItemPosition> positions,
    ValueNotifier<int> currentIndex,
    List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>
        loadedChapters,
    ValueNotifier<ChapterDto> currentVisibleChapter,
    ValueNotifier<int> currentChapterPageIndex,
  ) {
    if (positions.isEmpty) return;

    // Find the item that's most visible
    ItemPosition? mostVisible;
    double bestVisibleArea = 0.0;

    for (final ItemPosition position in positions) {
      final double visibleArea = _calculateVisibleArea(position);

      if (visibleArea > bestVisibleArea && visibleArea > 0.4) {
        bestVisibleArea = visibleArea;
        mostVisible = position;
      }
    }

    if (mostVisible != null) {
      currentIndex.value = mostVisible.index;

      // Find which chapter this index belongs to and the page within that chapter
      final chapterInfo =
          _getChapterAndPageForGlobalIndex(mostVisible.index, loadedChapters);
      if (chapterInfo != null) {
        // Only update if the chapter has actually changed to avoid unnecessary rebuilds
        if (currentVisibleChapter.value.id != chapterInfo.chapter.id) {
          currentVisibleChapter.value = chapterInfo.chapter;
          print(
              'Debug: Switched to chapter ${chapterInfo.chapter.name} (ID: ${chapterInfo.chapter.id})');
        }
        currentChapterPageIndex.value = chapterInfo.pageIndex;
      }
    }
  }

  /// Get chapter and page index for a global index
  ({ChapterDto chapter, int pageIndex})? _getChapterAndPageForGlobalIndex(
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

  /// Create ChapterPagesDto for the current visible chapter
  ChapterPagesDto _createChapterPagesDto(
    List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>
        loadedChapters,
    ChapterDto currentChapter,
  ) {
    for (final chapterData in loadedChapters) {
      if (chapterData.chapterId == currentChapter.id) {
        return chapterData.pages;
      }
    }
    // Fallback to original chapter pages if not found
    return chapterPages;
  }

  /// Convert chapter-relative index to global index
  int _convertChapterIndexToGlobalIndex(
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

  /// Calculate visible area of an item position
  static double _calculateVisibleArea(ItemPosition position) {
    final double leadingEdge = position.itemLeadingEdge.clamp(0.0, 1.0);
    final double trailingEdge = position.itemTrailingEdge.clamp(0.0, 1.0);

    final double visibleStart = leadingEdge < 0 ? 0.0 : leadingEdge;
    final double visibleEnd = trailingEdge > 1 ? 1.0 : trailingEdge;

    return (visibleEnd - visibleStart).clamp(0.0, 1.0);
  }

  /// Handle navigation
  static void _handleNavigation(
    ItemScrollController scrollController,
    ItemPositionsListener positionsListener,
    bool isAnimationEnabled, {
    required bool isNext,
  }) {
    final List<ItemPosition> positions =
        positionsListener.itemPositions.value.toList();
    if (positions.isEmpty) return;

    // Find current position
    ItemPosition? currentPosition;
    for (final ItemPosition position in positions) {
      final double visibleArea = _calculateVisibleArea(position);
      if (visibleArea > 0.4) {
        currentPosition = position;
        break;
      }
    }

    if (currentPosition == null) return;

    final int targetIndex;
    final double alignment;

    if (isNext) {
      // Move to next item
      if (currentPosition.itemTrailingEdge > 0.8) {
        targetIndex = currentPosition.index + 1;
        alignment = 0.0;
      } else {
        targetIndex = currentPosition.index;
        alignment = 0.0;
      }
    } else {
      // Move to previous item
      if (currentPosition.itemLeadingEdge < 0.2) {
        targetIndex =
            (currentPosition.index - 1).clamp(0, double.infinity).toInt();
        alignment = 0.0;
      } else {
        targetIndex = currentPosition.index;
        alignment = 0.0;
      }
    }

    // Use gentle navigation
    if (isAnimationEnabled) {
      scrollController.scrollTo(
        index: targetIndex,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
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
