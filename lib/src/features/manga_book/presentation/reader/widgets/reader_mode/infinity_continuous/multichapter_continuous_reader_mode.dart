// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../../../widgets/server_image.dart';
import '../../../../../../history/presentation/history_controller.dart'
    as history_ctrl;
import '../../../../../../settings/presentation/reader/widgets/reader_scroll_animation_tile/reader_scroll_animation_tile.dart';
import '../../../../../data/manga_book/manga_book_repository.dart';
import '../../../../../domain/chapter/chapter_model.dart';
import '../../../../../domain/chapter_batch/chapter_batch_model.dart';
import '../../../../../domain/chapter_page/chapter_page_model.dart';
import '../../../../../domain/manga/manga_model.dart';
import '../../../../manga_details/controller/manga_details_controller.dart';
import '../../../controller/reader_controller.dart';
import '../../reader_wrapper.dart';
import 'infinity_continuous_config.dart';
import 'infinity_continuous_feedback.dart';
import 'infinity_continuous_utils.dart';

typedef _LoadedChapter = ({
  ChapterPagesDto pages,
  ChapterDto chapter,
  int chapterId,
});

/// Multi-chapter webtoon reader built on ``ScrollablePositionedList``.
///
/// Replaces the homegrown plain-``ListView`` reader. SPL anchors the
/// scroll position to a page INDEX (not an absolute pixel offset), so
/// when a lazily-loaded image above the viewport finishes decoding and
/// changes height, the page the user is reading stays put — no backward
/// "snap", no ever-growing extent. (Confirmed on-device 2026-06-17: the
/// single-chapter SPL path is smooth on tall pages; the plain-ListView
/// path jumped. See vault 2026-06-17-webtoon-reader-rebuild-decision.md.)
///
/// Multi-chapter handling:
///   * Forward (next chapter) is APPENDED — front indices are unchanged,
///     so SPL needs no re-anchor and the transition is seamless.
///   * Backward (previous chapter) is PREPENDED — every index shifts up
///     by the new chapter's page count, so right after the insert we
///     ``jumpTo`` the same content at its new index + alignment. The old
///     reader deferred this by two frames (postFrame + endOfFrame) which
///     showed one frame of wrong content; we re-anchor without the
///     double-defer.
class MultiChapterContinuousReaderMode extends HookConsumerWidget {
  const MultiChapterContinuousReaderMode({
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
    final ItemScrollController itemScrollController =
        useMemoized(() => ItemScrollController());
    final ItemPositionsListener positionsListener =
        useMemoized(() => ItemPositionsListener.create());

    final loadedChapters = useState<List<_LoadedChapter>>([
      (pages: chapterPages, chapter: chapter, chapterId: chapter.id),
    ]);
    // Mirror of loadedChapters so the (once-bound) position listener
    // always reads the latest list without rebinding on every change.
    final loadedRef = useRef<List<_LoadedChapter>>(loadedChapters.value);
    loadedRef.value = loadedChapters.value;

    final currentVisibleChapter = useState<ChapterDto>(chapter);
    final currentChapterPageIndex = useState<int>(
      chapter.isRead.ifNull()
          ? 0
          : chapter.lastPageRead.getValueOnNullOrNegative(),
    );

    final loadingNext = useState(false);
    final loadingPrevious = useState(false);
    final hasReachedEnd = useState(false);
    final hasReachedStart = useState(false);

    final lastEndFeedbackTime = useRef<DateTime?>(null);
    final lastStartFeedbackTime = useRef<DateTime?>(null);
    final completedChapterIds = useRef<Set<int>>({});
    final lastVisibleChapterId = useRef<int>(chapter.id);
    // Top-most visible (index, leadingEdge) from the previous listener
    // tick, used to derive scroll direction so neighbour chapters load
    // only when the user scrolls TOWARD an edge — never on initial open.
    final lastTop = useRef<({int index, double edge})?>(null);

    final nextPrevChapterPair =
        useState<({ChapterDto? first, ChapterDto? second})?>(null);
    useEffect(() {
      try {
        nextPrevChapterPair.value = ref.read(
          getNextAndPreviousChaptersProvider(
            mangaId: manga.id,
            chapterId: currentVisibleChapter.value.id,
          ),
        );
      } catch (_) {
        nextPrevChapterPair.value = null;
      }
      return null;
    }, [currentVisibleChapter.value.id]);

    useEffect(() {
      onPageChanged?.call(currentChapterPageIndex.value);
      return null;
    }, [currentChapterPageIndex.value]);

    final bool isAnimationEnabled =
        ref.read(readerScrollAnimationProvider).ifNull(true);

    // --- chapter loading -------------------------------------------------

    Future<void> loadNextChapter(ChapterDto next) async {
      if (loadingNext.value || hasReachedEnd.value) return;
      if (loadedRef.value.any((e) => e.chapterId == next.id)) return;
      loadingNext.value = true;
      try {
        if (context.mounted) {
          InfinityContinuousFeedback.showLoadingNextChapterFeedback(
              context, next.name);
        }
        final pages =
            await ref.read(chapterPagesProvider(chapterId: next.id).future);
        if (pages == null) {
          hasReachedEnd.value = true;
          return;
        }
        if (loadedRef.value.any((e) => e.chapterId == next.id)) return;
        loadedChapters.value = [
          ...loadedChapters.value,
          (pages: pages, chapter: next, chapterId: next.id),
        ];
        if (context.mounted) {
          InfinityContinuousFeedback.showNextChapterLoadedFeedback(
              context, next.name);
        }
      } catch (_) {
        hasReachedEnd.value = true;
      } finally {
        loadingNext.value = false;
      }
    }

    Future<void> loadPreviousChapter(ChapterDto prev) async {
      if (loadingPrevious.value || hasReachedStart.value) return;
      if (loadedRef.value.any((e) => e.chapterId == prev.id)) return;
      loadingPrevious.value = true;
      try {
        if (context.mounted) {
          InfinityContinuousFeedback.showLoadingPreviousChapterFeedback(
              context, prev.name);
        }
        final pages =
            await ref.read(chapterPagesProvider(chapterId: prev.id).future);
        if (pages == null) {
          hasReachedStart.value = true;
          return;
        }
        if (loadedRef.value.any((e) => e.chapterId == prev.id)) return;

        final newPageCount = pages.pages.length;

        // Capture the page currently anchoring the viewport so we can
        // re-pin it after every index shifts up by ``newPageCount``.
        final positions = positionsListener.itemPositions.value.toList()
          ..sort((a, b) => a.itemLeadingEdge.compareTo(b.itemLeadingEdge));
        int? anchorIndex;
        double anchorAlignment = 0.0;
        for (final p in positions) {
          // First item whose top edge is at/below the viewport top is the
          // natural anchor; fall back to the first reported position.
          if (p.itemTrailingEdge > 0) {
            anchorIndex = p.index;
            anchorAlignment = p.itemLeadingEdge.clamp(-1.0, 1.0);
            break;
          }
        }
        anchorIndex ??= positions.isNotEmpty ? positions.first.index : null;

        loadedChapters.value = [
          (pages: pages, chapter: prev, chapterId: prev.id),
          ...loadedChapters.value,
        ];
        // Indices just shifted up by newPageCount; drop the stale
        // direction sample so the next tick re-derives it cleanly.
        lastTop.value = null;

        // Re-anchor on the next frame (the rebuilt SPL must register the
        // new itemCount first). One frame, no animation, no second defer.
        if (anchorIndex != null) {
          final target = anchorIndex + newPageCount;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (itemScrollController.isAttached) {
              itemScrollController.jumpTo(
                index: target,
                alignment: anchorAlignment,
              );
            }
          });
        }

        if (context.mounted) {
          InfinityContinuousFeedback.showPreviousChapterLoadedFeedback(
              context, prev.name);
        }
      } catch (_) {
        hasReachedStart.value = true;
      } finally {
        loadingPrevious.value = false;
      }
    }

    // --- position tracking ----------------------------------------------

    useEffect(() {
      void listener() {
        final loaded = loadedRef.value;
        final total = InfinityContinuousUtils.getTotalPages(loaded);
        if (total <= 0) return;

        final positions = positionsListener.itemPositions.value
            .where((p) => p.itemTrailingEdge > 0 && p.itemLeadingEdge < 1)
            .toList();
        if (positions.isEmpty) return;

        // Most-visible page → current global index.
        ItemPosition? mostVisible;
        double bestArea = 0.0;
        for (final p in positions) {
          final area = InfinityContinuousUtils.calculateVisibleArea(p);
          if (area > bestArea &&
              area > InfinityContinuousConfig.minVisibleAreaThreshold) {
            bestArea = area;
            mostVisible = p;
          }
        }
        mostVisible ??= positions.reduce(
          (a, b) => a.itemLeadingEdge.abs() <= b.itemLeadingEdge.abs() ? a : b,
        );

        // Map the global index to (chapter, page-within-chapter).
        final globalIdx = mostVisible.index;
        int cumulative = 0;
        for (final ch in loaded) {
          final count = ch.pages.pages.length;
          if (globalIdx >= cumulative && globalIdx < cumulative + count) {
            final rel = globalIdx - cumulative;
            if (currentChapterPageIndex.value != rel) {
              currentChapterPageIndex.value = rel;
            }
            if (currentVisibleChapter.value.id != ch.chapter.id) {
              final prevId = lastVisibleChapterId.value;
              final prevPos =
                  loaded.indexWhere((e) => e.chapterId == prevId);
              final newPos =
                  loaded.indexWhere((e) => e.chapterId == ch.chapter.id);
              currentVisibleChapter.value = ch.chapter;
              lastVisibleChapterId.value = ch.chapter.id;
              // Forward boundary crossing: the chapter we just left is
              // finished → mark it read.
              if (prevPos >= 0 && newPos > prevPos) {
                final left = loaded[prevPos].chapter;
                _markChapterRead(ref, manga.id, left, completedChapterIds,
                    context);
              }
            }
            break;
          }
          cumulative += count;
        }

        // Boundary prefetch triggers — gated on scroll DIRECTION so that
        // opening a chapter (at page 0, or a short chapter) never auto-
        // loads a neighbour. A neighbour loads only when the user is
        // actively scrolling toward that edge.
        final minIdx =
            positions.map((p) => p.index).reduce((a, b) => a < b ? a : b);
        final maxIdx =
            positions.map((p) => p.index).reduce((a, b) => a > b ? a : b);

        final top = positions
            .reduce((a, b) => a.index <= b.index ? a : b);
        final prevTop = lastTop.value;
        lastTop.value = (index: top.index, edge: top.itemLeadingEdge);
        bool scrollingUp = false;
        bool scrollingDown = false;
        if (prevTop != null) {
          const eps = 0.0015;
          if (top.index < prevTop.index) {
            scrollingUp = true;
          } else if (top.index > prevTop.index) {
            scrollingDown = true;
          } else if (top.itemLeadingEdge > prevTop.edge + eps) {
            // top page slid down the screen → content moved down → up-scroll
            scrollingUp = true;
          } else if (top.itemLeadingEdge < prevTop.edge - eps) {
            scrollingDown = true;
          }
        }

        if (scrollingDown && maxIdx >= total - 2) {
          final next = nextPrevChapterPair.value?.first;
          if (next != null) {
            loadNextChapter(next);
          } else if (!hasReachedEnd.value) {
            InfinityContinuousFeedback.showEndOfMangaFeedback(
                context, lastEndFeedbackTime);
          }
        }
        if (scrollingUp && minIdx <= 0) {
          final prev = nextPrevChapterPair.value?.second;
          if (prev != null) {
            loadPreviousChapter(prev);
          } else if (!hasReachedStart.value) {
            InfinityContinuousFeedback.showStartOfMangaFeedback(
                context, lastStartFeedbackTime);
          }
        }
      }

      positionsListener.itemPositions.addListener(listener);
      return () => positionsListener.itemPositions.removeListener(listener);
      // Bind once; the listener reads loadedRef for the live chapter list.
    }, const []);

    // --- navigation ------------------------------------------------------

    void jumpToChapterRelative(int chapterIdx) {
      final globalIndex =
          InfinityContinuousUtils.convertChapterIndexToGlobalIndex(
        chapterIdx,
        loadedChapters.value,
        currentVisibleChapter.value.id,
      );
      if (globalIndex < 0) return;
      currentChapterPageIndex.value = chapterIdx;
      if (itemScrollController.isAttached) {
        itemScrollController.jumpTo(index: globalIndex, alignment: 0.0);
      }
    }

    void handlePageNavigation({required bool isNext}) {
      final globalIndex =
          InfinityContinuousUtils.convertChapterIndexToGlobalIndex(
        currentChapterPageIndex.value + (isNext ? 1 : -1),
        loadedChapters.value,
        currentVisibleChapter.value.id,
      );
      if (globalIndex < 0) return;
      if (!itemScrollController.isAttached) return;
      if (isAnimationEnabled) {
        itemScrollController.scrollTo(
          index: globalIndex,
          alignment: 0.0,
          duration: InfinityContinuousConfig.scrollAnimationDuration,
          curve: InfinityContinuousConfig.scrollAnimationCurve,
        );
      } else {
        itemScrollController.jumpTo(index: globalIndex, alignment: 0.0);
      }
    }

    // --- build -----------------------------------------------------------

    final total = InfinityContinuousUtils.getTotalPages(loadedChapters.value);

    Widget buildItem(BuildContext context, int index) {
      final loc = _locate(index, loadedChapters.value);
      if (loc == null) {
        return SizedBox(
          height: context.height *
              InfinityContinuousConfig.verticalPageHeightRatio,
        );
      }
      return ServerImage(
        showReloadButton: true,
        fit: BoxFit.fitWidth,
        appendApiToUrl: false,
        imageUrl: loc.imageUrl,
        progressIndicatorBuilder: (_, __, progress) => SizedBox(
          height: context.height *
              InfinityContinuousConfig.verticalPageHeightRatio,
          child: Center(
            child: CircularProgressIndicator(value: progress.progress),
          ),
        ),
      );
    }

    Widget buildSeparator(BuildContext context, int index) {
      if (loadedChapters.value.length <= 1) return const SizedBox.shrink();
      if (!InfinityContinuousUtils.isChapterBoundary(
          index, loadedChapters.value)) {
        return const SizedBox.shrink();
      }
      final info = InfinityContinuousChapterSeparator.getSeparatorInfo(
          index, loadedChapters.value);
      if (info == null) return const SizedBox.shrink();
      return InfinityContinuousChapterSeparator(
        chapterName: info.chapterName,
        isChapterStart: info.isChapterStart,
      );
    }

    final positionedList = ScrollablePositionedList.separated(
      itemScrollController: itemScrollController,
      itemPositionsListener: positionsListener,
      initialScrollIndex: chapter.isRead.ifNull()
          ? 0
          : chapter.lastPageRead.getValueOnNullOrNegative(),
      scrollDirection: scrollDirection,
      reverse: reverse,
      itemCount: total,
      minCacheExtent:
          context.height * InfinityContinuousConfig.verticalCacheMultiplier,
      itemBuilder: buildItem,
      separatorBuilder: buildSeparator,
    );

    return ReaderWrapper(
      scrollDirection: scrollDirection,
      // Slider/title reflect the chapter the user is currently in, and
      // the slider tracks progress WITHIN that chapter (no totalPageCount).
      chapterPages: InfinityContinuousUtils.createChapterPagesDto(
          loadedChapters.value, currentVisibleChapter.value, chapterPages),
      chapter: currentVisibleChapter.value,
      manga: manga,
      showReaderLayoutAnimation: showReaderLayoutAnimation,
      currentIndex: currentChapterPageIndex.value,
      onChanged: jumpToChapterRelative,
      onPrevious: () => handlePageNavigation(isNext: false),
      onNext: () => handlePageNavigation(isNext: true),
      child: positionedList,
    );
  }
}

/// Mark [chapter] read once and reconcile the relevant providers. Tracks
/// already-marked ids in [completedChapterIds] so repeated boundary
/// crossings don't re-fire the mutation.
void _markChapterRead(
  WidgetRef ref,
  int mangaId,
  ChapterDto chapter,
  ObjectRef<Set<int>> completedChapterIds,
  BuildContext context,
) {
  if (chapter.isRead.ifNull()) return;
  if (completedChapterIds.value.contains(chapter.id)) return;
  completedChapterIds.value = {...completedChapterIds.value, chapter.id};
  AsyncValue.guard(
    () => ref.read(mangaBookRepositoryProvider).putChapter(
          chapterId: chapter.id,
          patch: ChapterChange(isRead: true, lastPageRead: 0),
        ),
  ).then((result) {
    if (!context.mounted) return;
    if (result.hasError) {
      completedChapterIds.value = {...completedChapterIds.value}
        ..remove(chapter.id);
    } else {
      ref.invalidate(chapterProvider(chapterId: chapter.id));
      ref.invalidate(mangaChapterListProvider(mangaId: mangaId));
      ref.invalidate(history_ctrl.readingHistoryProvider);
    }
  });
}

class _PageLoc {
  const _PageLoc(this.imageUrl);
  final String imageUrl;
}

_PageLoc? _locate(int globalIndex, List<_LoadedChapter> loaded) {
  int cumulative = 0;
  for (final entry in loaded) {
    final n = entry.pages.pages.length;
    if (globalIndex < cumulative + n) {
      return _PageLoc(entry.pages.pages[globalIndex - cumulative]);
    }
    cumulative += n;
  }
  return null;
}
