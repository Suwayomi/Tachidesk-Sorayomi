// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_android_volume_keydown/flutter_android_volume_keydown.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../constants/app_constants.dart';
import '../../../../../constants/app_sizes.dart';
import '../../../../../constants/db_keys.dart';
import '../../../../../constants/enum.dart';
import '../../../../../constants/reader_keyboard_shortcuts.dart';
import '../../../../../routes/router_config.dart';
import '../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../utils/launch_url_in_web.dart';
import '../../../../../utils/misc/toast/toast.dart';
import '../../../../../widgets/popup_widgets/radio_list_popup.dart';
import '../../../../settings/presentation/reader/widgets/reader_initial_overlay_tile/reader_initial_overlay_tile.dart';
import '../../../../settings/presentation/reader/widgets/reader_invert_tap_tile/reader_invert_tap_tile.dart';
import '../../../../settings/presentation/reader/widgets/reader_last_page_swipe_tile/reader_last_page_swipe_tile.dart';
import '../../../../settings/presentation/reader/widgets/reader_magnifier_size_slider/reader_magnifier_size_slider.dart';
import '../../../../settings/presentation/reader/widgets/reader_mode_tile/reader_mode_tile.dart';
import '../../../../settings/presentation/reader/widgets/reader_padding_slider/reader_padding_slider.dart';
import '../../../../settings/presentation/reader/widgets/reader_swipe_toggle_tile/reader_swipe_chapter_toggle_tile.dart';
import '../../../../settings/presentation/reader/widgets/reader_volume_tap_invert_tile/reader_volume_tap_invert_tile.dart';
import '../../../../settings/presentation/reader/widgets/reader_volume_tap_tile/reader_volume_tap_tile.dart';
import '../../../data/manga_book/manga_book_repository.dart';
import '../../../domain/chapter/chapter_model.dart';
import '../../../domain/chapter_batch/chapter_batch_model.dart';
import '../../../domain/chapter_page/chapter_page_model.dart';
import '../../../domain/manga/manga_model.dart';
import '../../../widgets/chapter_actions/single_chapter_action_icon.dart';
import '../../manga_details/controller/manga_details_controller.dart';
import '../controller/reader_controller.dart';
import '../utils/last_page_swipe_utils.dart';
import 'directional_swipe_gesture_handler.dart';
import 'page_number_slider.dart';
import 'reader_navigation_layout/reader_navigation_layout.dart';

class ReaderWrapper extends HookConsumerWidget {
  const ReaderWrapper({
    super.key,
    required this.child,
    required this.manga,
    required this.chapter,
    required this.onChanged,
    required this.currentIndex,
    required this.onNext,
    required this.onPrevious,
    required this.scrollDirection,
    this.showReaderLayoutAnimation = false,
    required this.chapterPages,
    this.pageController,
  });
  final Widget child;
  final MangaDto manga;
  final ChapterDto chapter;
  final ValueChanged<int> onChanged;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final int currentIndex;
  final Axis scrollDirection;
  final bool showReaderLayoutAnimation;
  final ChapterPagesDto chapterPages;
  final PageController? pageController;

  /// Determine transition direction based on reading mode for proper animations
  /// Returns true for vertical transitions, false for horizontal transitions
  bool _shouldUseVerticalTransition(ReaderMode readerMode) {
    switch (readerMode) {
      // Vertical/Webtoon modes should use vertical transitions (slide up from bottom)
      case ReaderMode.singleVertical:
      case ReaderMode.continuousVertical:
      case ReaderMode.webtoon:
        return true;

      // Horizontal LTR/RTL modes should use horizontal transitions
      // This allows the system to animate from right (LTR) or left (RTL) based on toPrev flag
      case ReaderMode.singleHorizontalLTR:
      case ReaderMode.continuousHorizontalLTR:
      case ReaderMode.singleHorizontalRTL:
      case ReaderMode.continuousHorizontalRTL:
        return false;

      // Default case - use horizontal transition as fallback
      case ReaderMode.defaultReader:
        return false;
    }
  }

  /// Determine if the reading mode is RTL for proper animation direction
  /// Returns true for RTL modes, false for LTR/Vertical modes
  bool _isRTLReaderMode(ReaderMode readerMode) {
    switch (readerMode) {
      // RTL modes
      case ReaderMode.singleHorizontalRTL:
      case ReaderMode.continuousHorizontalRTL:
        return true;

      // LTR and Vertical modes
      case ReaderMode.singleHorizontalLTR:
      case ReaderMode.continuousHorizontalLTR:
      case ReaderMode.singleVertical:
      case ReaderMode.continuousVertical:
      case ReaderMode.webtoon:
      case ReaderMode.defaultReader:
        return false;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nextPrevChapterPair = ref.watch(
      getNextAndPreviousChaptersProvider(
        mangaId: manga.id,
        chapterId: chapter.id,
      ),
    );
    final invertTap = ref.watch(invertTapProvider).ifNull();

    final bool volumeTap = ref.watch(volumeTapProvider).ifNull();
    final bool volumeTapInvert = ref.watch(volumeTapInvertProvider).ifNull();

    final double localMangaReaderPadding =
        ref.watch(readerPaddingKeyProvider) ?? DBKeys.readerPadding.initial;

    final bool readerSwipeChapterToggle =
        ref.watch(swipeChapterToggleProvider) ?? DBKeys.swipeToggle.initial;

    final bool lastPageSwipeEnabled = ref.watch(lastPageSwipeEnabledProvider) ??
        DBKeys.lastPageSwipeEnabled.initial;

    final double localMangaReaderMagnifierSize =
        ref.watch(readerMagnifierSizeKeyProvider) ??
            DBKeys.readerMagnifierSize.initial;

    final visibility =
        useState(ref.read(readerInitialOverlayProvider).ifNull());
    final mangaReaderPadding =
        useState(manga.metaData.readerPadding ?? localMangaReaderPadding);
    final mangaReaderMagnifierSize = useState(
      manga.metaData.readerMagnifierSize ?? localMangaReaderMagnifierSize,
    );

    final mangaReaderMode =
        manga.metaData.readerMode ?? ReaderMode.defaultReader;
    final mangaReaderNavigationLayout = manga.metaData.readerNavigationLayout ??
        ReaderNavigationLayout.defaultNavigation;

    final defaultReaderMode = ref.watch(readerModeKeyProvider);

    // Performance optimization: memoize resolved reader mode to avoid recalculation
    final resolvedReaderMode = useMemoized(
      () => LastPageSwipeUtils.resolveActualReaderMode(
        mangaReaderMode: mangaReaderMode,
        defaultReaderMode: defaultReaderMode,
      ),
      [mangaReaderMode, defaultReaderMode],
    );

    final showReaderModePopup = useCallback(
      () => showDialog(
        context: context,
        builder: (context) => RadioListPopup<ReaderMode>(
          optionList: ReaderMode.values,
          getOptionTitle: (value) => value.toLocale(context),
          value: mangaReaderMode,
          title: context.l10n.readerMode,
          onChange: (enumValue) async {
            if (context.mounted) Navigator.pop(context);
            await AsyncValue.guard(
              () => ref.read(mangaBookRepositoryProvider).patchMangaMeta(
                    mangaId: manga.id,
                    key: MangaMetaKeys.readerMode.key,
                    value: enumValue.name,
                  ),
            );
            ref.invalidate(mangaWithIdProvider(mangaId: manga.id));
          },
        ),
      ),
      [mangaReaderMode],
    );

    final showReaderNavigationLayoutPopup = useCallback(
      () => showDialog(
        context: context,
        builder: (context) => RadioListPopup<ReaderNavigationLayout>(
          optionList: ReaderNavigationLayout.values,
          getOptionTitle: (value) => value.toLocale(context),
          title: context.l10n.readerNavigationLayout,
          value: mangaReaderNavigationLayout,
          onChange: (enumValue) async {
            if (context.mounted) Navigator.pop(context);
            await AsyncValue.guard(
              () => ref.read(mangaBookRepositoryProvider).patchMangaMeta(
                    mangaId: manga.id,
                    key: MangaMetaKeys.readerNavigationLayout.key,
                    value: enumValue.name,
                  ),
            );
            ref.invalidate(mangaWithIdProvider(mangaId: manga.id));
          },
        ),
      ),
      [mangaReaderNavigationLayout],
    );

    useEffect(() {
      if (!visibility.value) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      }
      return null;
    }, [visibility.value]);

    // Enhanced navigation callbacks with last-page swipe logic
    final enhancedOnNext = useCallback(() {
      if (lastPageSwipeEnabled && !readerSwipeChapterToggle) {
        // Check if we're at the last page
        final isAtLastPage = currentIndex >= (chapterPages.pages.length - 1);

        if (isAtLastPage && nextPrevChapterPair?.first != null) {
          // Navigate to next chapter
          ReaderRoute(
            mangaId: manga.id,
            chapterId: nextPrevChapterPair!.first!.id,
            transVertical: scrollDirection != Axis.vertical,
          ).pushReplacement(context);
          return;
        }
      }

      // Use normal page navigation
      onNext();
    }, [
      lastPageSwipeEnabled,
      readerSwipeChapterToggle,
      currentIndex,
      chapterPages.pages.length,
      nextPrevChapterPair
    ]);

    final enhancedOnPrevious = useCallback(() {
      if (lastPageSwipeEnabled && !readerSwipeChapterToggle) {
        // Check if we're at the first page
        final isAtFirstPage = currentIndex <= 0;

        if (isAtFirstPage && nextPrevChapterPair?.second != null) {
          // Navigate to previous chapter
          ReaderRoute(
            mangaId: manga.id,
            chapterId: nextPrevChapterPair!.second!.id,
            toPrev: true,
            transVertical: scrollDirection != Axis.vertical,
          ).pushReplacement(context);
          return;
        }
      }

      // Use normal page navigation
      onPrevious();
    }, [
      lastPageSwipeEnabled,
      readerSwipeChapterToggle,
      currentIndex,
      nextPrevChapterPair
    ]);

    // Chapter navigation callbacks with direction-aware animations
    final onNextChapter = useCallback(() {
      if (nextPrevChapterPair?.first != null) {
        // Determine transition direction and RTL handling
        final transVertical = _shouldUseVerticalTransition(resolvedReaderMode);
        final isRTL = _isRTLReaderMode(resolvedReaderMode);
        final toPrev =
            isRTL; // For RTL, next chapter should slide from left (toPrev=true)

        ReaderRoute(
          mangaId: manga.id,
          chapterId: nextPrevChapterPair!.first!.id,
          transVertical: transVertical,
          toPrev: toPrev,
        ).pushReplacement(context);
      }
    }, [nextPrevChapterPair, manga.id, resolvedReaderMode]);

    final onPreviousChapter = useCallback(() {
      if (nextPrevChapterPair?.second != null) {
        // Determine transition direction and RTL handling
        final transVertical = _shouldUseVerticalTransition(resolvedReaderMode);
        final isRTL = _isRTLReaderMode(resolvedReaderMode);
        final toPrev =
            !isRTL; // For RTL, previous chapter should slide from right (toPrev=false)

        ReaderRoute(
          mangaId: manga.id,
          chapterId: nextPrevChapterPair!.second!.id,
          toPrev: toPrev,
          transVertical: transVertical,
        ).pushReplacement(context);
      }
    }, [nextPrevChapterPair, manga.id, resolvedReaderMode]);

    useEffect(() {
      StreamSubscription<HardwareButton>? subscription;
      if (volumeTap) {
        subscription = FlutterAndroidVolumeKeydown.stream.listen(
          (event) => (switch (event) {
            HardwareButton.volume_up =>
              volumeTapInvert ? enhancedOnNext() : enhancedOnPrevious(),
            HardwareButton.volume_down =>
              volumeTapInvert ? enhancedOnPrevious() : enhancedOnNext(),
          }),
        );
      }
      return () => subscription?.cancel();
    }, [volumeTap, volumeTapInvert, enhancedOnNext, enhancedOnPrevious]);

    return Theme(
      data: context.theme.copyWith(
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      child: Scaffold(
        appBar: visibility.value
            ? AppBar(
                title: ListTile(
                  title: (manga.title).isNotBlank
                      ? Text(
                          manga.title,
                          overflow: TextOverflow.ellipsis,
                        )
                      : null,
                  subtitle: (chapter.name).isNotBlank
                      ? Text(
                          chapter.name,
                          overflow: TextOverflow.ellipsis,
                        )
                      : null,
                ),
                elevation: 0,
                actions: [
                  chapter.realUrl.isBlank
                      ? const SizedBox.shrink()
                      : IconButton(
                          onPressed: () async {
                            launchUrlInWeb(
                              context,
                              (chapter.realUrl ?? ""),
                              ref.read(toastProvider),
                            );
                          },
                          icon: const Icon(Icons.public_rounded),
                        )
                ],
              )
            : null,
        extendBodyBehindAppBar: true,
        extendBody: true,
        endDrawerEnableOpenDragGesture: false,
        endDrawer: Drawer(
          width: kDrawerWidth,
          shape: const RoundedRectangleBorder(),
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.close_rounded),
                onTap: context.pop,
              ),
              ListTile(
                style: ListTileStyle.drawer,
                leading: const Icon(Icons.app_settings_alt_outlined),
                title: Text(context.l10n.readerMode),
                subtitle: Text(mangaReaderMode.toLocale(context)),
                onTap: () {
                  context.pop();
                  showReaderModePopup();
                },
              ),
              ListTile(
                style: ListTileStyle.drawer,
                leading: const Icon(Icons.touch_app_rounded),
                title: Text(context.l10n.readerNavigationLayout),
                subtitle: Text(mangaReaderNavigationLayout.toLocale(context)),
                onTap: () {
                  context.pop();
                  showReaderNavigationLayoutPopup();
                },
              ),
              AsyncReaderPaddingSlider(
                readerPadding: mangaReaderPadding,
                onChanged: (value) {
                  AsyncValue.guard(
                    () => ref.read(mangaBookRepositoryProvider).patchMangaMeta(
                          mangaId: manga.id,
                          key: MangaMetaKeys.readerPadding.key,
                          value: value,
                        ),
                  );
                  ref.invalidate(mangaWithIdProvider(mangaId: manga.id));
                },
              ),
              AsyncReaderMagnifierSizeSlider(
                readerMagnifierSize: mangaReaderMagnifierSize,
                onChanged: (value) {
                  AsyncValue.guard(
                    () => ref.read(mangaBookRepositoryProvider).patchMangaMeta(
                          mangaId: manga.id,
                          key: MangaMetaKeys.readerMagnifierSize.key,
                          value: value,
                        ),
                  );
                  ref.invalidate(mangaWithIdProvider(mangaId: manga.id));
                },
              ),
            ],
          ),
        ),
        bottomSheet: visibility.value
            ? ExcludeFocus(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Card(
                          shape: const CircleBorder(),
                          child: IconButton(
                            onPressed: nextPrevChapterPair?.second != null
                                ? () => ReaderRoute(
                                      mangaId:
                                          nextPrevChapterPair!.second!.mangaId,
                                      chapterId: nextPrevChapterPair.second!.id,
                                      toPrev: true,
                                      transVertical:
                                          scrollDirection != Axis.vertical,
                                    ).pushReplacement(context)
                                : null,
                            icon: const Icon(
                              Icons.skip_previous_rounded,
                            ),
                          ),
                        ),
                        Expanded(
                          child: PageNumberSlider(
                            currentValue: currentIndex,
                            maxValue: chapterPages.chapter.pageCount,
                            onChanged: (index) => onChanged(index),
                            inverted: invertTap,
                          ),
                        ),
                        Card(
                          shape: const CircleBorder(),
                          child: IconButton(
                            onPressed: nextPrevChapterPair?.first != null
                                ? () => ReaderRoute(
                                      mangaId:
                                          nextPrevChapterPair!.first!.mangaId,
                                      chapterId: nextPrevChapterPair.first!.id,
                                      transVertical:
                                          scrollDirection != Axis.vertical,
                                    ).pushReplacement(context)
                                : null,
                            icon: const Icon(Icons.skip_next_rounded),
                          ),
                        )
                      ],
                    ),
                    const Gap(8),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: KRadius.r8.radius,
                        ),
                      ),
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: KEdgeInsets.h16v8.size,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SingleChapterActionIcon(
                              icon: chapter.isBookmarked
                                  ? Icons.bookmark_rounded
                                  : Icons.bookmark_outline_rounded,
                              chapterId: chapter.id,
                              change: ChapterChange(
                                  isBookmarked: !chapter.isBookmarked),
                              refresh: () => ref.refresh(
                                  chapterProvider(chapterId: chapter.id)
                                      .future),
                            ),
                            IconButton(
                              icon: const Icon(Icons.app_settings_alt_outlined),
                              onPressed: () => showReaderModePopup(),
                            ),
                            Builder(builder: (context) {
                              return IconButton(
                                onPressed: () =>
                                    Scaffold.of(context).openEndDrawer(),
                                icon: const Icon(Icons.settings_rounded),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : null,
        body: Shortcuts.manager(
          manager: readerShortcutManager(scrollDirection),
          child: Actions(
            actions: {
              PreviousScrollIntent: CallbackAction<PreviousScrollIntent>(
                onInvoke: (intent) =>
                    invertTap ? enhancedOnNext() : enhancedOnPrevious(),
              ),
              NextScrollIntent: CallbackAction<NextScrollIntent>(
                onInvoke: (intent) =>
                    invertTap ? enhancedOnPrevious() : enhancedOnNext(),
              ),
              PreviousChapterIntent: CallbackAction<PreviousChapterIntent>(
                onInvoke: (intent) {
                  nextPrevChapterPair?.second != null
                      ? ReaderRoute(
                          mangaId: nextPrevChapterPair!.second!.mangaId,
                          chapterId: nextPrevChapterPair.second!.id,
                          toPrev: true,
                          transVertical: scrollDirection != Axis.vertical,
                        ).pushReplacement(context)
                      : enhancedOnPrevious();
                  return null;
                },
              ),
              NextChapterIntent: CallbackAction<NextChapterIntent>(
                onInvoke: (intent) => nextPrevChapterPair?.first != null
                    ? ReaderRoute(
                        mangaId: nextPrevChapterPair!.first!.mangaId,
                        chapterId: nextPrevChapterPair.first!.id,
                        transVertical: scrollDirection != Axis.vertical,
                      ).pushReplacement(context)
                    : enhancedOnNext(),
              ),
              HideQuickOpenIntent: CallbackAction<HideQuickOpenIntent>(
                onInvoke: (HideQuickOpenIntent intent) {
                  visibility.value = !visibility.value;
                  return null;
                },
              ),
            },
            child: Focus(
              autofocus: true,
              child: Listener(
                child: RepaintBoundary(
                  child: ReaderView(
                    toggleVisibility: () =>
                        visibility.value = !visibility.value,
                    scrollDirection: scrollDirection,
                    mangaId: manga.id,
                    mangaReaderPadding: mangaReaderPadding.value,
                    mangaReaderMagnifierSize: mangaReaderMagnifierSize.value,
                    onNext: enhancedOnNext,
                    onPrevious: enhancedOnPrevious,
                    mangaReaderNavigationLayout: mangaReaderNavigationLayout,
                    prevNextChapterPair: nextPrevChapterPair,
                    readerSwipeChapterToggle: readerSwipeChapterToggle,
                    lastPageSwipeEnabled: lastPageSwipeEnabled,
                    resolvedReaderMode: resolvedReaderMode,
                    currentIndex: currentIndex,
                    chapterPages: chapterPages,
                    showReaderLayoutAnimation: showReaderLayoutAnimation,
                    pageController: pageController,
                    child: _buildEnhancedChildWithPageDetection(
                      child,
                      lastPageSwipeEnabled,
                      readerSwipeChapterToggle,
                      onNextChapter,
                      onPreviousChapter,
                      resolvedReaderMode,
                      scrollDirection,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Enhanced child widget that adds last-page swipe detection for PageView
  Widget _buildEnhancedChildWithPageDetection(
    Widget originalChild,
    bool lastPageSwipeEnabled,
    bool readerSwipeChapterToggle,
    VoidCallback onNextChapter,
    VoidCallback onPreviousChapter,
    ReaderMode resolvedReaderMode,
    Axis scrollDirection,
  ) {
    if (!lastPageSwipeEnabled || readerSwipeChapterToggle) {
      return originalChild;
    }

    return _PageViewEnhancer(
      originalChild: originalChild,
      chapterPages: chapterPages,
      onNextChapter: onNextChapter,
      onPreviousChapter: onPreviousChapter,
      resolvedReaderMode: resolvedReaderMode,
      scrollDirection: scrollDirection,
      lastPageSwipeEnabled: lastPageSwipeEnabled,
    );
  }
}

/// Widget that enhances PageView with last-page swipe detection
class _PageViewEnhancer extends StatefulWidget {
  const _PageViewEnhancer({
    required this.originalChild,
    required this.chapterPages,
    required this.onNextChapter,
    required this.onPreviousChapter,
    required this.resolvedReaderMode,
    required this.scrollDirection,
    required this.lastPageSwipeEnabled,
  });

  final Widget originalChild;
  final ChapterPagesDto chapterPages;
  final VoidCallback onNextChapter;
  final VoidCallback onPreviousChapter;
  final ReaderMode resolvedReaderMode;
  final Axis scrollDirection;
  final bool lastPageSwipeEnabled;

  @override
  State<_PageViewEnhancer> createState() => _PageViewEnhancerState();
}

class _PageViewEnhancerState extends State<_PageViewEnhancer> {
  int? _lastPageIndex;
  bool _isAtMaxExtent = false;
  bool _isAtMinExtent = false;
  DateTime? _maxExtentReachedTime;
  DateTime? _minExtentReachedTime;
  bool _edgeNavTriggered = false;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        // Track page changes and detect swipe attempts at boundaries
        if (notification is ScrollEndNotification && notification.depth == 0) {
          final metrics = notification.metrics;
          if (metrics is PageMetrics) {
            final currentPage = metrics.page?.round();
            if (currentPage != null) {
              final oldPage = _lastPageIndex;
              _lastPageIndex = currentPage;

              // Check if this was a boundary swipe attempt
              _checkBoundarySwipe(oldPage, currentPage, metrics);
            }
          }
        }

        // Also check scroll update notifications for swipe attempts
        if (notification is ScrollUpdateNotification &&
            notification.depth == 0) {
          final metrics = notification.metrics;
          _checkScrollAttemptAtBoundary(metrics);
        }

        // For webtoon: detect overscroll attempts using OverscrollNotification
        if (notification is OverscrollNotification && notification.depth == 0) {
          _handleWebtoonOverscroll(notification);
        }

        return false;
      },
      child: widget.originalChild,
    );
  }

  void _checkBoundarySwipe(int? oldPage, int currentPage, PageMetrics metrics) {
    // We now rely solely on overscroll detection, so do nothing here.
    return;
  }

  void _checkScrollAttemptAtBoundary(ScrollMetrics metrics) {
    // Handle both PageMetrics (for PageView) and general ScrollMetrics (for Webtoon)
    if (metrics is PageMetrics) {
      // PageView-based readers (horizontal modes)
      final currentPage = metrics.page?.round() ?? 0;
      final totalPages = widget.chapterPages.pages.length;

      final bool atLastPage = currentPage >= (totalPages - 1);
      final bool atFirstPage = currentPage <= 0;

      // Trigger immediately when user drags past edge more than 10 logical pixels
      const double kOverscrollThreshold = 10.0;

      if (widget.lastPageSwipeEnabled) {
        if (atLastPage &&
            metrics.pixels - metrics.maxScrollExtent > kOverscrollThreshold) {
          if (!_edgeNavTriggered) {
            _edgeNavTriggered = true;
            widget.onNextChapter();
          }
        } else if (atFirstPage &&
            metrics.minScrollExtent - metrics.pixels > kOverscrollThreshold) {
          if (!_edgeNavTriggered) {
            _edgeNavTriggered = true;
            widget.onPreviousChapter();
          }
        }
      }

      _isAtMaxExtent = metrics.pixels >= metrics.maxScrollExtent;
      _isAtMinExtent = metrics.pixels <= metrics.minScrollExtent;

      if (!_isAtMaxExtent && !_isAtMinExtent) {
        _edgeNavTriggered = false;
      }
    } else {
      // Continuous scroll readers (webtoon, vertical modes)
      // Track when we're at boundaries for overscroll detection
      final wasAtMaxExtent = _isAtMaxExtent;
      final wasAtMinExtent = _isAtMinExtent;

      _isAtMaxExtent = metrics.pixels >= metrics.maxScrollExtent;
      _isAtMinExtent = metrics.pixels <= metrics.minScrollExtent;

      // Track timing when we reach boundaries to distinguish momentum from deliberate swipes
      if (_isAtMaxExtent && !wasAtMaxExtent) {
        _maxExtentReachedTime = DateTime.now();
      }
      if (_isAtMinExtent && !wasAtMinExtent) {
        _minExtentReachedTime = DateTime.now();
      }

      // Reset timing when leaving boundaries
      if (!_isAtMaxExtent && wasAtMaxExtent) {
        _maxExtentReachedTime = null;
      }
      if (!_isAtMinExtent && wasAtMinExtent) {
        _minExtentReachedTime = null;
      }

      if (!_isAtMaxExtent && !_isAtMinExtent) {
        _edgeNavTriggered = false;
      }
    }
  }

  void _handleWebtoonOverscroll(OverscrollNotification notification) {
    // Safety check: only process if last page swipe is enabled
    if (!widget.lastPageSwipeEnabled) {
      return;
    }

    final now = DateTime.now();
    // Use shorter delay for PageView (paged readers) to feel more responsive
    final bool isPagedReader = notification.metrics is PageMetrics;
    final int triggerDelayMs = isPagedReader ? 50 : 300;

    const double kImmediateThreshold = 2.0;

    // For PageView (paged reader) fire immediately once overscroll crosses tiny threshold
    if (isPagedReader) {
      if (_isAtMaxExtent && notification.overscroll > kImmediateThreshold) {
        if (!_edgeNavTriggered) {
          _edgeNavTriggered = true;
          widget.onNextChapter();
        }
        return;
      }
      if (_isAtMinExtent && notification.overscroll < -kImmediateThreshold) {
        if (!_edgeNavTriggered) {
          _edgeNavTriggered = true;
          widget.onPreviousChapter();
        }
        return;
      }
    }

    // Fallback for continuous readers (webtoon) – keep delay logic
    // Check for overscroll at the end (positive overscroll when at max extent)
    if (_isAtMaxExtent && notification.overscroll > 0) {
      if (_maxExtentReachedTime != null &&
          now.difference(_maxExtentReachedTime!).inMilliseconds >
              triggerDelayMs) {
        if (!_edgeNavTriggered) {
          _edgeNavTriggered = true;
          widget.onNextChapter();
        }
      }
    }

    if (_isAtMinExtent && notification.overscroll < 0) {
      if (_minExtentReachedTime != null &&
          now.difference(_minExtentReachedTime!).inMilliseconds >
              triggerDelayMs) {
        if (!_edgeNavTriggered) {
          _edgeNavTriggered = true;
          widget.onPreviousChapter();
        }
      }
    }
  }
}

class ReaderView extends HookWidget {
  const ReaderView({
    super.key,
    required this.toggleVisibility,
    required this.scrollDirection,
    required this.mangaId,
    required this.mangaReaderPadding,
    required this.mangaReaderMagnifierSize,
    required this.onNext,
    required this.onPrevious,
    required this.prevNextChapterPair,
    required this.mangaReaderNavigationLayout,
    required this.readerSwipeChapterToggle,
    required this.lastPageSwipeEnabled,
    required this.resolvedReaderMode,
    required this.currentIndex,
    required this.chapterPages,
    required this.child,
    this.showReaderLayoutAnimation = false,
    this.pageController,
  });

  final VoidCallback toggleVisibility;
  final Axis scrollDirection;
  final int mangaId;
  final double mangaReaderPadding;
  final double mangaReaderMagnifierSize;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final ({ChapterDto? first, ChapterDto? second})? prevNextChapterPair;
  final ReaderNavigationLayout mangaReaderNavigationLayout;
  final bool readerSwipeChapterToggle;
  final bool lastPageSwipeEnabled;
  final ReaderMode resolvedReaderMode;
  final int currentIndex;
  final ChapterPagesDto chapterPages;
  final bool showReaderLayoutAnimation;
  final Widget child;
  final PageController? pageController;

  /// Gesture handling extracted for better performance and maintainability.
  /// This widget focuses on:
  /// - Magnification handling
  /// - Navigation layout overlay
  /// - Basic UI state management

  @override
  Widget build(BuildContext context) {
    final showMagnification = useState(false);
    final dragGesturePosition = useState(Offset.zero);
    final positionOffset = kMagnifierPosition(
      dragGesturePosition.value,
      context.mediaQuerySize,
      mangaReaderMagnifierSize,
    );

    // Build the core reading content wrapped with padding
    Widget content = Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.height *
            (scrollDirection != Axis.vertical ? mangaReaderPadding : 0),
        horizontal: context.width *
            (scrollDirection == Axis.vertical ? mangaReaderPadding : 0),
      ),
      child: child,
    );

    final PageController? controller = pageController ??
        (PrimaryScrollController.of(context) is PageController
            ? PrimaryScrollController.of(context) as PageController
            : null);

    content = DirectionalSwipeGestureHandler(
      onTap: toggleVisibility,
      onLongPressStart: (details) {
        dragGesturePosition.value = details.localPosition;
        showMagnification.value = true;
      },
      onLongPressEnd: (details) {
        showMagnification.value = false;
      },
      onLongPressMoveUpdate: (details) =>
          dragGesturePosition.value = details.localPosition,
      scrollDirection: scrollDirection,
      readerSwipeChapterToggle: readerSwipeChapterToggle,
      lastPageSwipeEnabled: lastPageSwipeEnabled,
      resolvedReaderMode: resolvedReaderMode,
      currentIndex: currentIndex,
      chapterPages: chapterPages,
      mangaId: mangaId,
      prevNextChapterPair: prevNextChapterPair,
      onNextPage: onNext,
      onPreviousPage: onPrevious,
      pageController: controller,
      child: content,
    );

    return Stack(
      children: [
        content,
        ReaderNavigationLayoutWidget(
          onNext: onNext,
          onPrevious: onPrevious,
          navigationLayout: mangaReaderNavigationLayout,
          showReaderLayoutAnimation: showReaderLayoutAnimation,
        ),
        if (showMagnification.value)
          Positioned(
            left: positionOffset.dx,
            top: positionOffset.dy,
            child: RawMagnifier(
              decoration: kMagnifierDecoration,
              size: kMagnifierSize * mangaReaderMagnifierSize,
              focalPointOffset: kMagnifierOffset(
                dragGesturePosition.value,
                context.mediaQuerySize,
                mangaReaderMagnifierSize,
              ),
              magnificationScale: 2,
              child: const ColoredBox(color: Color.fromARGB(8, 158, 158, 158)),
            ),
          ),
      ],
    );
  }
}
