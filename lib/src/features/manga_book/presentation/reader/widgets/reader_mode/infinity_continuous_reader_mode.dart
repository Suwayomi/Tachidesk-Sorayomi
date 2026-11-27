// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../../widgets/server_image.dart';
import '../../../../../settings/presentation/reader/widgets/reader_infinity_scrolling_mode_tile/reader_infinity_scrolling_mode_tile.dart';
import '../../../../../settings/presentation/reader/widgets/reader_scroll_animation_tile/reader_scroll_animation_tile.dart';
import '../../../../domain/chapter/chapter_model.dart';
import '../../../../domain/chapter_page/chapter_page_model.dart';
import '../../../../domain/manga/manga_model.dart';
import '../reader_wrapper.dart';
import 'infinity_continuous/infinity_continuous_config.dart';
import 'infinity_continuous/infinity_continuous_navigation.dart';
import 'infinity_continuous/infinity_continuous_utils.dart';
import 'infinity_continuous/multichapter_continuous_reader_mode.dart';

/// Continuous reader entry point.
///
/// Vertical webtoon mode with infinity scrolling enabled is delegated to
/// [MultiChapterContinuousReaderMode], which loads adjacent chapters into
/// a single `ScrollablePositionedList` so reading flows seamlessly across
/// chapter boundaries.
///
/// Horizontal scroll and "infinity scrolling off" use the single-chapter
/// implementation below — it never crosses a chapter boundary inside the
/// reader, so multi-chapter machinery isn't needed.
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

    if (!infinityScrollingEnabled || scrollDirection != Axis.vertical) {
      return _buildSingleChapterMode(context, ref);
    }

    return MultiChapterContinuousReaderMode(
      manga: manga,
      chapter: chapter,
      chapterPages: chapterPages,
      onPageChanged: onPageChanged,
      scrollDirection: scrollDirection,
      reverse: reverse,
      showReaderLayoutAnimation: showReaderLayoutAnimation,
    );
  }

  Widget _buildSingleChapterMode(BuildContext context, WidgetRef ref) {
    final ItemScrollController scrollController =
        useMemoized(() => ItemScrollController());
    final ItemPositionsListener positionsListener =
        useMemoized(() => ItemPositionsListener.create());

    final ValueNotifier<int> currentIndex = useState(
      chapter.isRead.ifNull()
          ? 0
          : (chapter.lastPageRead).getValueOnNullOrNegative(),
    );

    useEffect(() {
      void listener() {
        final positions = positionsListener.itemPositions.value.toList();
        if (positions.isEmpty) return;

        ItemPosition? mostVisible;
        double bestVisibleArea = 0.0;

        for (final position in positions) {
          final visibleArea =
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

    useEffect(() {
      onPageChanged?.call(currentIndex.value);
      return null;
    }, [currentIndex.value]);

    final bool isAnimationEnabled =
        ref.read(readerScrollAnimationProvider).ifNull(true);

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
      child: ScrollablePositionedList.separated(
        itemScrollController: scrollController,
        itemPositionsListener: positionsListener,
        initialScrollIndex: chapter.isRead.ifNull()
            ? 0
            : chapter.lastPageRead.getValueOnNullOrNegative(),
        scrollDirection: scrollDirection,
        reverse: reverse,
        itemCount: chapterPages.chapter.pageCount,
        minCacheExtent: scrollDirection == Axis.vertical
            ? context.height * InfinityContinuousConfig.verticalCacheMultiplier
            : context.width *
                InfinityContinuousConfig.horizontalCacheMultiplier,
        separatorBuilder: (_, __) => const SizedBox.shrink(),
        itemBuilder: (BuildContext context, int index) {
          return _buildPageItem(context, index);
        },
      ),
    );
  }

  Widget _buildPageItem(BuildContext context, int index) {
    return ServerImage(
      showReloadButton: true,
      fit: scrollDirection == Axis.vertical
          ? BoxFit.fitWidth
          : BoxFit.fitHeight,
      appendApiToUrl: false,
      imageUrl: chapterPages.pages[index],
      progressIndicatorBuilder: (_, __, downloadProgress) => Center(
        child: CircularProgressIndicator(value: downloadProgress.progress),
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
  }
}
