// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

import '../../../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../domain/chapter/chapter_model.dart';
import '../../../../../domain/chapter_page/chapter_page_model.dart';
import 'infinity_continuous_config.dart';

/// UI feedback components for infinity continuous reader mode
class InfinityContinuousFeedback {
  const InfinityContinuousFeedback._();

  /// Shows feedback when user tries to scroll past the last chapter
  static void showEndOfMangaFeedback(
    BuildContext context,
    ObjectRef<DateTime?> lastFeedbackTime,
  ) {
    final now = DateTime.now();

    // Debounce to prevent spam
    if (lastFeedbackTime.value != null &&
        now.difference(lastFeedbackTime.value!) <
            InfinityContinuousConfig.feedbackCooldown) {
      return;
    }

    lastFeedbackTime.value = now;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.auto_stories_rounded,
              color: context.theme.colorScheme.onInverseSurface,
            ),
            const Gap(12),
            Expanded(
              child: Text(
                context.l10n.noMoreChaptersAhead,
                style: TextStyle(
                  color: context.theme.colorScheme.onInverseSurface,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: context.theme.colorScheme.inverseSurface,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 80),
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  /// Shows feedback when user tries to scroll past the first chapter
  static void showStartOfMangaFeedback(
    BuildContext context,
    ObjectRef<DateTime?> lastFeedbackTime,
  ) {
    final now = DateTime.now();

    // Debounce to prevent spam
    if (lastFeedbackTime.value != null &&
        now.difference(lastFeedbackTime.value!) <
            InfinityContinuousConfig.feedbackCooldown) {
      return;
    }

    lastFeedbackTime.value = now;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.first_page_rounded,
              color: context.theme.colorScheme.onInverseSurface,
            ),
            const Gap(12),
            Expanded(
              child: Text(
                context.l10n.noMoreChaptersBehind,
                style: TextStyle(
                  color: context.theme.colorScheme.onInverseSurface,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: context.theme.colorScheme.inverseSurface,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 80),
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  /// Shows feedback when loading next chapter
  static void showLoadingNextChapterFeedback(
    BuildContext context,
    String chapterName,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  context.theme.colorScheme.onInverseSurface,
                ),
              ),
            ),
            const Gap(12),
            Expanded(
              child: Text(
                context.l10n.loadingNextChapter,
                style: TextStyle(
                  color: context.theme.colorScheme.onInverseSurface,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: context.theme.colorScheme.inverseSurface,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 80),
        duration: const Duration(seconds: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  /// Shows feedback when loading previous chapter
  static void showLoadingPreviousChapterFeedback(
    BuildContext context,
    String chapterName,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  context.theme.colorScheme.onInverseSurface,
                ),
              ),
            ),
            const Gap(12),
            Expanded(
              child: Text(
                context.l10n.loadingPreviousChapter,
                style: TextStyle(
                  color: context.theme.colorScheme.onInverseSurface,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: context.theme.colorScheme.inverseSurface,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 80),
        duration: const Duration(seconds: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  /// Shows feedback when next chapter is successfully loaded
  static void showNextChapterLoadedFeedback(
    BuildContext context,
    String chapterName,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.check_circle_outline,
              color: context.theme.colorScheme.onInverseSurface,
              size: 18,
            ),
            const Gap(12),
            Expanded(
              child: Text(
                context.l10n.nextChapterLoaded(chapterName),
                style: TextStyle(
                  color: context.theme.colorScheme.onInverseSurface,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        backgroundColor: context.theme.colorScheme.inverseSurface,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 80),
        duration: const Duration(milliseconds: 1500),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  /// Shows feedback when previous chapter is successfully loaded
  static void showPreviousChapterLoadedFeedback(
    BuildContext context,
    String chapterName,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.check_circle_outline,
              color: context.theme.colorScheme.onInverseSurface,
              size: 18,
            ),
            const Gap(12),
            Expanded(
              child: Text(
                context.l10n.previousChapterLoaded(chapterName),
                style: TextStyle(
                  color: context.theme.colorScheme.onInverseSurface,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        backgroundColor: context.theme.colorScheme.inverseSurface,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 80),
        duration: const Duration(milliseconds: 1500),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  /// Shows feedback when chapter loading fails
  static void showChapterLoadFailedFeedback(
    BuildContext context,
    String chapterName, {
    bool isNext = true,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.error_outline,
              color: context.theme.colorScheme.onErrorContainer,
              size: 18,
            ),
            const Gap(12),
            Expanded(
              child: Text(
                isNext
                    ? context.l10n.failedToLoadNextChapter
                    : context.l10n.failedToLoadPreviousChapter,
                style: TextStyle(
                  color: context.theme.colorScheme.onErrorContainer,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: context.theme.colorScheme.errorContainer,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 80),
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

/// Chapter separator widget for infinity continuous mode
class InfinityContinuousChapterSeparator extends StatelessWidget {
  const InfinityContinuousChapterSeparator({
    super.key,
    required this.chapterName,
    required this.isChapterStart,
  });

  final String chapterName;
  final bool isChapterStart;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(32),
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: isChapterStart
                ? context.theme.cardColor
                : context.theme.cardColor.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isChapterStart
                  ? context.theme.colorScheme.primary
                  : context.theme.colorScheme.secondary,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Icon(
                isChapterStart
                    ? Icons.play_circle_outline_rounded
                    : Icons.bookmark_border_rounded,
                size: 32,
                color: isChapterStart
                    ? context.theme.colorScheme.primary
                    : context.theme.colorScheme.secondary,
              ),
              const Gap(8),
              if (!isChapterStart)
                Text(
                  context.l10n.finished,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.theme.colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              if (!isChapterStart) const Gap(4),
              Text(
                chapterName,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.theme.colorScheme.onSurface
                      .withValues(alpha: 0.8),
                ),
                textAlign: TextAlign.center,
              ),
              if (!isChapterStart) ...[
                const Gap(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.celebration_rounded,
                      size: 16,
                      color: context.theme.colorScheme.secondary,
                    ),
                    const Gap(4),
                    Text(
                      context.l10n.chapterCompleted,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.theme.colorScheme.secondary,
                        fontStyle: FontStyle.italic,
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
  static ({String chapterName, bool isChapterStart})? getSeparatorInfo(
    int index,
    List<({ChapterPagesDto pages, ChapterDto chapter, int chapterId})>
        loadedChapters,
  ) {
    int currentIndex = 0;
    for (int i = 0; i < loadedChapters.length; i++) {
      final chapterData = loadedChapters[i];

      // Only show separator at the end of a chapter (except the last one)
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
}
