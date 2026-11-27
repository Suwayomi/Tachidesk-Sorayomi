// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../../../utils/logger/logger.dart';
import '../../../../../domain/chapter/chapter_model.dart';
import '../../../../../domain/chapter_page/chapter_page_model.dart';
import '../../../controller/reader_controller.dart';
import 'infinity_continuous_config.dart';
import 'infinity_continuous_feedback.dart';
import 'infinity_continuous_utils.dart';

/// Internal class to store scroll state for restoration
class _ScrollState {
  const _ScrollState({
    required this.primaryIndex,
    required this.primaryAlignment,
    this.secondaryIndex,
    this.secondaryAlignment,
    required this.allPositions,
  });

  final int primaryIndex;
  final double primaryAlignment;
  final int? secondaryIndex;
  final double? secondaryAlignment;
  final List<({int index, double leadingEdge, double trailingEdge})>
      allPositions;
}

/// Handles chapter loading logic for infinity continuous reader mode
class InfinityContinuousChapterLoader {
  const InfinityContinuousChapterLoader._();

  /// Load next chapter
  static Future<void> loadNextChapter(
    WidgetRef ref,
    ChapterDto nextChapter,
    ValueNotifier<
            List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>>
        loadedChapters,
    ValueNotifier<bool> loadingNext,
    ValueNotifier<bool> hasReachedEnd,
    BuildContext? context,
  ) async {
    loadingNext.value = true;

    // Show loading feedback
    if (context != null && context.mounted) {
      InfinityContinuousFeedback.showLoadingNextChapterFeedback(
        context,
        nextChapter.name,
      );
    }

    try {
      final ChapterPagesDto? nextChapterPages = await ref
          .read(chapterPagesProvider(chapterId: nextChapter.id).future);

      if (nextChapterPages != null) {
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

          // Show success feedback
          if (context != null && context.mounted) {
            InfinityContinuousFeedback.showNextChapterLoadedFeedback(
              context,
              nextChapter.name,
            );
          }
        }
      } else {
        hasReachedEnd.value = true;
        // Show failure feedback
        if (context != null && context.mounted) {
          InfinityContinuousFeedback.showChapterLoadFailedFeedback(
            context,
            nextChapter.name,
            isNext: true,
          );
        }
      }
    } catch (e) {
      hasReachedEnd.value = true;
      // Show failure feedback
      if (context != null && context.mounted) {
        InfinityContinuousFeedback.showChapterLoadFailedFeedback(
          context,
          nextChapter.name,
          isNext: true,
        );
      }
    } finally {
      loadingNext.value = false;
    }
  }

  /// Load previous chapter
  static Future<void> loadPreviousChapter(
    WidgetRef ref,
    ChapterDto previousChapter,
    ValueNotifier<
            List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>>
        loadedChapters,
    ValueNotifier<bool> loadingPrevious,
    ValueNotifier<bool> hasReachedStart,
    ItemScrollController? scrollController,
    ItemPositionsListener? positionsListener,
    BuildContext? context,
  ) async {
    loadingPrevious.value = true;

    // Show loading feedback
    if (context != null && context.mounted) {
      InfinityContinuousFeedback.showLoadingPreviousChapterFeedback(
        context,
        previousChapter.name,
      );
    }

    try {
      final ChapterPagesDto? prevChapterPages = await ref
          .read(chapterPagesProvider(chapterId: previousChapter.id).future);

      if (prevChapterPages != null) {
        // Check if chapter is already loaded to avoid duplicates
        final alreadyLoaded = loadedChapters.value
            .any((item) => item.chapterId == previousChapter.id);

        if (!alreadyLoaded) {
          await _loadPreviousChapterWithScrollPreservation(
            prevChapterPages,
            previousChapter,
            loadedChapters,
            scrollController,
            positionsListener,
            context,
          );
        }
      } else {
        hasReachedStart.value = true;
        // Show failure feedback
        if (context != null && context.mounted) {
          InfinityContinuousFeedback.showChapterLoadFailedFeedback(
            context,
            previousChapter.name,
            isNext: false,
          );
        }
      }
    } catch (e) {
      hasReachedStart.value = true;
      // Show failure feedback
      if (context != null && context.mounted) {
        InfinityContinuousFeedback.showChapterLoadFailedFeedback(
          context,
          previousChapter.name,
          isNext: false,
        );
      }
    } finally {
      loadingPrevious.value = false;
    }
  }

  /// Atomically load previous chapter with enhanced scroll position preservation
  static Future<void> _loadPreviousChapterWithScrollPreservation(
    ChapterPagesDto prevChapterPages,
    ChapterDto previousChapter,
    ValueNotifier<
            List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>>
        loadedChapters,
    ItemScrollController? scrollController,
    ItemPositionsListener? positionsListener,
    BuildContext? context,
  ) async {
    if (scrollController == null || positionsListener == null) {
      // Simple case: no scroll controller, just add the chapter
      loadedChapters.value = [
        (
          pages: prevChapterPages,
          chapter: previousChapter,
          chapterId: previousChapter.id
        ),
        ...loadedChapters.value,
      ];

      if (context != null && context.mounted) {
        InfinityContinuousFeedback.showPreviousChapterLoadedFeedback(
          context,
          previousChapter.name,
        );
      }
      return;
    }

    // Capture comprehensive scroll state before any modifications
    final scrollState = _captureScrollState(positionsListener);
    if (scrollState == null) {
      // Fallback: no visible items, just add chapter at beginning
      loadedChapters.value = [
        (
          pages: prevChapterPages,
          chapter: previousChapter,
          chapterId: previousChapter.id
        ),
        ...loadedChapters.value,
      ];

      if (context != null && context.mounted) {
        InfinityContinuousFeedback.showPreviousChapterLoadedFeedback(
          context,
          previousChapter.name,
        );
      }
      return;
    }

    final newChapterPageCount = prevChapterPages.pages.length;

    // Perform atomic state update with scroll preservation
    await _performAtomicChapterInsertionWithScrollPreservation(
      prevChapterPages,
      previousChapter,
      loadedChapters,
      scrollController,
      scrollState,
      newChapterPageCount,
      context,
    );
  }

  /// Capture comprehensive scroll state for reliable restoration
  static _ScrollState? _captureScrollState(
      ItemPositionsListener positionsListener) {
    final positions = positionsListener.itemPositions.value.toList();
    if (positions.isEmpty) return null;

    // Check if scroll position is stable before capturing
    if (!InfinityContinuousUtils.isScrollPositionStable(
        positions, InfinityContinuousConfig.minVisibleAreaThreshold)) {
      // If not stable, wait a bit and use a simpler approach
      logger.i('Scroll position not stable, using simplified capture');
    }

    // Sort positions by index for consistent processing
    positions.sort((a, b) => a.index.compareTo(b.index));

    // Use the new stability-based reference selection
    final primaryReference =
        InfinityContinuousUtils.getMostStableReferenceItem(positions);
    if (primaryReference == null) return null;

    // Find secondary reference for validation
    ItemPosition? secondaryReference;
    if (positions.length > 1) {
      for (final position in positions) {
        if (position.index != primaryReference.index) {
          secondaryReference = position;
          break;
        }
      }
    }

    // Calculate precise alignment with improved accuracy
    double alignment = 0.0;
    if (primaryReference.itemLeadingEdge <= 0.0) {
      // Item extends above viewport
      final itemHeight =
          primaryReference.itemTrailingEdge - primaryReference.itemLeadingEdge;
      if (itemHeight > 0.0) {
        final hiddenAbove = -primaryReference.itemLeadingEdge;
        alignment = (hiddenAbove / itemHeight).clamp(0.0, 1.0);

        // Apply precision rounding to avoid floating point errors
        alignment =
            (alignment / InfinityContinuousConfig.scrollAlignmentPrecision)
                    .round() *
                InfinityContinuousConfig.scrollAlignmentPrecision;
      }
    } else {
      // Item starts below viewport top
      alignment = 0.0;
    }

    return _ScrollState(
      primaryIndex: primaryReference.index,
      primaryAlignment: alignment,
      secondaryIndex: secondaryReference?.index,
      secondaryAlignment: secondaryReference != null
          ? _calculateAlignment(secondaryReference)
          : null,
      allPositions: positions
          .map((p) => (
                index: p.index,
                leadingEdge: p.itemLeadingEdge,
                trailingEdge: p.itemTrailingEdge,
              ))
          .toList(),
    );
  }

  /// Calculate alignment for a position with precision handling
  static double _calculateAlignment(ItemPosition position) {
    if (position.itemLeadingEdge <= 0.0) {
      final itemHeight = position.itemTrailingEdge - position.itemLeadingEdge;
      if (itemHeight > 0.0) {
        final hiddenAbove = -position.itemLeadingEdge;
        final alignment = (hiddenAbove / itemHeight).clamp(0.0, 1.0);

        // Apply precision rounding
        return (alignment / InfinityContinuousConfig.scrollAlignmentPrecision)
                .round() *
            InfinityContinuousConfig.scrollAlignmentPrecision;
      }
    }
    return 0.0;
  }

  /// Perform atomic chapter insertion with reliable scroll preservation
  static Future<void> _performAtomicChapterInsertionWithScrollPreservation(
    ChapterPagesDto prevChapterPages,
    ChapterDto previousChapter,
    ValueNotifier<
            List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>>
        loadedChapters,
    ItemScrollController scrollController,
    _ScrollState scrollState,
    int newChapterPageCount,
    BuildContext? context,
  ) async {
    // Calculate new indices after insertion
    final newPrimaryIndex = scrollState.primaryIndex + newChapterPageCount;
    final newSecondaryIndex = scrollState.secondaryIndex != null
        ? scrollState.secondaryIndex! + newChapterPageCount
        : null;

    // Use WidgetsBinding to ensure proper timing with the rendering pipeline
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        // Perform the atomic state update
        loadedChapters.value = [
          (
            pages: prevChapterPages,
            chapter: previousChapter,
            chapterId: previousChapter.id
          ),
          ...loadedChapters.value,
        ];

        // Wait for the next frame to ensure the list has been rebuilt
        await WidgetsBinding.instance.endOfFrame;

        // Restore scroll position with enhanced reliability
        await _restoreScrollPosition(
          scrollController,
          newPrimaryIndex,
          scrollState.primaryAlignment,
          newSecondaryIndex,
          scrollState.secondaryAlignment,
        );

        // Show success feedback after successful restoration
        if (context != null && context.mounted) {
          InfinityContinuousFeedback.showPreviousChapterLoadedFeedback(
            context,
            previousChapter.name,
          );
        }
      } catch (e) {
        logger.w('Failed to perform atomic chapter insertion: $e');
        // Fallback: still show success feedback even if scroll restoration fails
        if (context != null && context.mounted) {
          InfinityContinuousFeedback.showPreviousChapterLoadedFeedback(
            context,
            previousChapter.name,
          );
        }
      }
    });
  }

  /// Restore scroll position with multiple fallback strategies
  static Future<void> _restoreScrollPosition(
    ItemScrollController scrollController,
    int primaryIndex,
    double primaryAlignment,
    int? secondaryIndex,
    double? secondaryAlignment,
  ) async {
    try {
      // Ensure alignment is within valid bounds with proper precision
      final clampedAlignment = primaryAlignment.clamp(0.0, 1.0);
      final preciseAlignment =
          (clampedAlignment / InfinityContinuousConfig.scrollAlignmentPrecision)
                  .round() *
              InfinityContinuousConfig.scrollAlignmentPrecision;

      // Primary strategy: Use scrollTo with calculated alignment
      await scrollController.scrollTo(
        index: primaryIndex,
        duration: Duration.zero, // Instant, no animation
        alignment: preciseAlignment,
      );

      // Validate scroll position if we have a secondary reference
      if (secondaryIndex != null && secondaryAlignment != null) {
        // Small delay to allow scroll to settle
        await Future.delayed(InfinityContinuousConfig.scrollRestorationDelay);

        // Additional validation could be added here if needed
        // For now, we trust the primary scroll operation
      }
    } catch (e) {
      logger.w('Primary scroll restoration failed: $e, attempting fallback');

      try {
        // Fallback strategy: Use jumpTo without alignment
        scrollController.jumpTo(index: primaryIndex);
      } catch (e2) {
        logger.w('Fallback scroll restoration failed: $e2');

        // Final fallback: Try with a delay
        Future.delayed(InfinityContinuousConfig.scrollRestorationFallbackDelay,
            () {
          try {
            scrollController.jumpTo(index: primaryIndex);
          } catch (e3) {
            logger.e('All scroll restoration attempts failed: $e3');
          }
        });
      }
    }
  }
}
