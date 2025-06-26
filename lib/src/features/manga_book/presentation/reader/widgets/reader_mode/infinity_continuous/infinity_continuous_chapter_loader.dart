// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../domain/chapter/chapter_model.dart';
import '../../../../../domain/chapter_page/chapter_page_model.dart';
import '../../../controller/reader_controller.dart';
import 'infinity_continuous_feedback.dart';

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
          debugPrint(
              'Successfully loaded next chapter: ${nextChapter.name} with ${nextChapterPages.pages.length} pages');
              
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
      debugPrint('Error loading next chapter: $e');
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
    debugPrint('Starting to load previous chapter: ${previousChapter.name}');
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

      debugPrint(
          'Previous chapter pages loaded: ${prevChapterPages != null ? prevChapterPages.pages.length : 'null'} pages');

      if (prevChapterPages != null) {
        // Check if chapter is already loaded to avoid duplicates
        final alreadyLoaded = loadedChapters.value
            .any((item) => item.chapterId == previousChapter.id);

        debugPrint('Previous chapter already loaded: $alreadyLoaded');

        if (!alreadyLoaded) {
          // Store current scroll position before adding the chapter
          int? currentIndex;
          double? currentAlignment;
          if (scrollController != null && positionsListener != null) {
            final positions = positionsListener.itemPositions.value.toList();
            debugPrint('Current positions count: ${positions.length}');
            if (positions.isNotEmpty) {
              // Find the first visible item that's at the top of the viewport
              // This gives us a more stable reference point for scroll restoration
              ItemPosition? topItem;
              for (final position in positions) {
                if (position.itemLeadingEdge <= 0.0 &&
                    position.itemTrailingEdge > 0.0) {
                  topItem = position;
                  break;
                }
              }

              // If no item spans the top, use the first visible item
              if (topItem == null && positions.isNotEmpty) {
                topItem = positions.first;
              }

              if (topItem != null) {
                currentIndex = topItem.index;

                // Calculate alignment based on how much of the item is visible above the viewport
                // If itemLeadingEdge is negative, the item extends above the viewport
                // If itemLeadingEdge is positive, the item starts below the viewport top
                if (topItem.itemLeadingEdge <= 0.0) {
                  // Item extends above viewport - calculate how much is hidden
                  final itemHeight =
                      topItem.itemTrailingEdge - topItem.itemLeadingEdge;
                  final hiddenAbove = -topItem.itemLeadingEdge;
                  currentAlignment = hiddenAbove / itemHeight;
                  // Clamp to valid range but preserve precision
                  currentAlignment = currentAlignment.clamp(0.0, 1.0);
                } else {
                  // Item starts below viewport top
                  currentAlignment = 0.0;
                }

                debugPrint(
                    'Current visible index: $currentIndex, leading edge: ${topItem.itemLeadingEdge}, trailing edge: ${topItem.itemTrailingEdge}, calculated alignment: $currentAlignment');
              }
            }
          }

          final newChapterPageCount = prevChapterPages.pages.length;
          debugPrint('New chapter page count: $newChapterPageCount');

          // Insert at the beginning
          loadedChapters.value = [
            (
              pages: prevChapterPages,
              chapter: previousChapter,
              chapterId: previousChapter.id
            ),
            ...loadedChapters.value,
          ];

          debugPrint(
              'Previous chapter inserted at beginning. Total chapters now: ${loadedChapters.value.length}');
              
          // Show success feedback
          if (context != null && context.mounted) {
            InfinityContinuousFeedback.showPreviousChapterLoadedFeedback(
              context, 
              previousChapter.name,
            );
          }

          // Adjust scroll position to maintain current view after insertion
          if (currentIndex != null && scrollController != null) {
            // The new index should be the old index plus the number of pages in the new chapter
            final newIndex = currentIndex + newChapterPageCount;
            debugPrint(
                'Adjusting scroll position from $currentIndex to $newIndex');

            // Use scrollTo with alignment to preserve the exact position
            Future.microtask(() {
              try {
                if (currentAlignment != null) {
                  // Use scrollTo with calculated alignment to preserve exact scroll position
                  debugPrint('Preserving scroll alignment: $currentAlignment');
                  scrollController.scrollTo(
                    index: newIndex,
                    duration: Duration.zero, // Instant, no animation
                    alignment: currentAlignment, // Use the calculated alignment
                  );
                  debugPrint(
                      'Successfully preserved scroll position at index: $newIndex with alignment: $currentAlignment');
                } else {
                  // Fallback: jump to the item with default alignment
                  scrollController.jumpTo(index: newIndex);
                  debugPrint(
                      'Successfully jumped to index: $newIndex (no alignment preserved)');
                }
              } catch (e) {
                debugPrint(
                    'Scroll position adjustment failed: $e, trying fallback');
                // Final fallback: try with a delay
                Future.delayed(const Duration(milliseconds: 50), () {
                  try {
                    scrollController.jumpTo(index: newIndex);
                    debugPrint('Delayed jump successful to index: $newIndex');
                  } catch (e3) {
                    debugPrint('All scroll adjustment attempts failed: $e3');
                  }
                });
              }
            });
          } else {
            debugPrint(
                'Cannot adjust scroll position - currentIndex: $currentIndex, scrollController: $scrollController');
          }
        }
      } else {
        debugPrint(
            'Previous chapter pages is null, setting hasReachedStart to true');
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
      debugPrint('Error loading previous chapter: $e');
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
      debugPrint(
          'Finished loading previous chapter, loadingPrevious set to false');
    }
  }
}
