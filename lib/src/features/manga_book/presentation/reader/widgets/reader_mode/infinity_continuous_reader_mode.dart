// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

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

    // Get next and previous chapters
    final nextPrevChapterPair = ref.watch(
      getNextAndPreviousChaptersProvider(
        mangaId: manga.id,
        chapterId: chapter.id,
      ),
    );

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

    // Load next chapter when near the end
    useEffect(() {
      void listener() {
        final List<ItemPosition> positions =
            positionsListener.itemPositions.value.toList();
        if (positions.isEmpty) return;

        final totalPages = _getTotalPages(loadedChapters.value);
        final lastVisible =
            positions.map((p) => p.index).reduce((a, b) => a > b ? a : b);
        final firstVisible =
            positions.map((p) => p.index).reduce((a, b) => a < b ? a : b);

        // Debug information
        print(
            'Debug: totalPages=$totalPages, lastVisible=$lastVisible, firstVisible=$firstVisible');
        print(
            'Debug: loadingNext=${loadingNext.value}, hasReachedEnd=${hasReachedEnd.value}');
        print(
            'Debug: loadingPrevious=${loadingPrevious.value}, hasReachedStart=${hasReachedStart.value}');
        print(
            'Debug: nextChapter=${nextPrevChapterPair?.first?.id}, prevChapter=${nextPrevChapterPair?.second?.id}');
        print(
            'Debug: loadedChapters=[${loadedChapters.value.map((c) => c.chapterId).join(", ")}]');

        // Load next chapter when approaching the end (within 5 pages of the end)
        if (!loadingNext.value &&
            !hasReachedEnd.value &&
            nextPrevChapterPair?.first != null &&
            totalPages > 0 &&
            lastVisible >= totalPages - 5) {
          print(
              'Debug: Loading next chapter ${nextPrevChapterPair!.first!.id}');
          _loadNextChapter(ref, nextPrevChapterPair.first!, loadedChapters,
              loadingNext, hasReachedEnd);
        }

        // Load previous chapter when approaching the start (within 5 pages of the start)
        if (!loadingPrevious.value &&
            !hasReachedStart.value &&
            nextPrevChapterPair?.second != null &&
            firstVisible <= 5) {
          print(
              'Debug: Loading previous chapter ${nextPrevChapterPair!.second!.id}');
          _loadPreviousChapter(ref, nextPrevChapterPair.second!, loadedChapters,
              loadingPrevious, hasReachedStart);
        }

        // Update current index
        _updateCurrentIndex(positions, currentIndex, loadedChapters.value);
      }

      positionsListener.itemPositions.addListener(listener);
      return () => positionsListener.itemPositions.removeListener(listener);
    }, [nextPrevChapterPair]);

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
      totalPageCount: _getTotalPages(loadedChapters.value),
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

    final chapterInfo = _getChapterInfoForIndex(index, loadedChapters);
    if (chapterInfo == null) return const Gap(16);

    return Column(
      children: [
        const Gap(32),
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: context.theme.cardColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Icon(
                Icons.auto_stories_rounded,
                size: 32,
                color: context.theme.colorScheme.primary,
              ),
              const Gap(8),
              Text(
                context.l10n.chapterSeparator,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(4),
              Text(
                chapterInfo.chapterName,
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const Gap(32),
      ],
    );
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
    print('Debug: Starting to load previous chapter ${previousChapter.id}');
    loadingPrevious.value = true;
    try {
      final prevChapterPages = await ref
          .read(chapterPagesProvider(chapterId: previousChapter.id).future);
      if (prevChapterPages != null) {
        print(
            'Debug: Successfully loaded previous chapter ${previousChapter.id} with ${prevChapterPages.pages.length} pages');

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
          print('Debug: Total loaded chapters: ${loadedChapters.value.length}');
        } else {
          print(
              'Debug: Chapter ${previousChapter.id} already loaded, skipping');
        }
      } else {
        print(
            'Debug: Failed to load previous chapter ${previousChapter.id} - prevChapterPages is null');
        hasReachedStart.value = true;
      }
    } catch (e) {
      print('Debug: Error loading previous chapter ${previousChapter.id}: $e');
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
      if (index == currentIndex && currentIndex > 0) {
        return true;
      }
      currentIndex += chapterData.pages.pages.length;
    }
    return false;
  }

  /// Update current index based on visible positions
  void _updateCurrentIndex(
    List<ItemPosition> positions,
    ValueNotifier<int> currentIndex,
    List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>
        loadedChapters,
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
    }
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
