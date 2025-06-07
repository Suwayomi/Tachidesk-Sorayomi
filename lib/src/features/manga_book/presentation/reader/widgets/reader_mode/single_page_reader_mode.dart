// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../constants/app_constants.dart';
import '../../../../../../utils/extensions/cache_manager_extensions.dart';
import '../../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../../utils/misc/app_utils.dart';
import '../../../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../../../widgets/server_image.dart';
import '../../../../../settings/presentation/reader/widgets/reader_scroll_animation_tile/reader_scroll_animation_tile.dart';
import '../../../../domain/chapter/chapter_model.dart';
import '../../../../domain/chapter_page/chapter_page_model.dart';
import '../../../../domain/manga/manga_model.dart';
import '../reader_wrapper.dart';

class SinglePageReaderMode extends HookConsumerWidget {
  const SinglePageReaderMode({
    super.key,
    required this.manga,
    required this.chapter,
    required this.chapterPages,
    this.onPageChanged,
    this.reverse = false,
    this.scrollDirection = Axis.horizontal,
    this.showReaderLayoutAnimation = false,
  });

  final MangaDto manga;
  final ChapterDto chapter;
  final ValueSetter<int>? onPageChanged;
  final bool reverse;
  final Axis scrollDirection;
  final bool showReaderLayoutAnimation;
  final ChapterPagesDto chapterPages;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cacheManager = useMemoized(() => DefaultCacheManager());
    final scrollController = usePageController(
      initialPage: chapter.isRead.ifNull()
          ? 0
          : chapter.lastPageRead.getValueOnNullOrNegative(),
    );
    final currentIndex = useState(scrollController.initialPage);

    useEffect(() {
      if (onPageChanged != null) onPageChanged!(currentIndex.value);
      int currentPage = currentIndex.value;
      // Only prefetch if we have pages data
      if (chapterPages.pages.isNotEmpty) {
        // Prev page
        if (currentPage > 0 && currentPage - 1 < chapterPages.pages.length) {
          cacheManager.getServerFile(
            ref,
            chapterPages.pages[currentPage - 1],
          );
        }
        // Next page
        if (currentPage < (chapterPages.pages.length - 1)) {
          cacheManager.getServerFile(
            ref,
            chapterPages.pages[currentPage + 1],
          );
        }
        // 2nd next page
        if (currentPage < (chapterPages.pages.length - 2)) {
          cacheManager.getServerFile(
            ref,
            chapterPages.pages[currentPage + 2],
          );
        }
      }
      return null;
    }, [currentIndex.value, chapterPages.pages.length]);
    useEffect(() {
      listener() {
        final currentPage = scrollController.page;
        if (currentPage != null) currentIndex.value = (currentPage.toInt());
      }

      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, [scrollController]);
    final isAnimationEnabled =
        ref.read(readerScrollAnimationProvider).ifNull(true);
    return ReaderWrapper(
      scrollDirection: scrollDirection,
      chapter: chapter,
      manga: manga,
      chapterPages: chapterPages,
      currentIndex: currentIndex.value,
      onChanged: (index) => scrollController.jumpToPage(index),
      showReaderLayoutAnimation: showReaderLayoutAnimation,
      onPrevious: () => scrollController.previousPage(
        duration: isAnimationEnabled ? kDuration : kInstantDuration,
        curve: kCurve,
      ),
      onNext: () => scrollController.nextPage(
        duration: isAnimationEnabled ? kDuration : kInstantDuration,
        curve: kCurve,
      ),
      child: PageView.builder(
        scrollDirection: scrollDirection,
        reverse: reverse,
        controller: scrollController,
        allowImplicitScrolling: true,
        itemBuilder: (BuildContext context, int index) {
          // Show loading indicator if no pages are available yet
          if (chapterPages.pages.isEmpty) {
            return const Center(
              child: CenterSorayomiShimmerIndicator(),
            );
          }

          // Add bounds checking to prevent accessing non-existent pages
          if (index >= chapterPages.pages.length) {
            return const Center(
              child: CenterSorayomiShimmerIndicator(),
            );
          }

          final image = ServerImage(
            showReloadButton: true,
            fit: BoxFit.contain,
            size: Size.fromHeight(context.height),
            appendApiToUrl: false,
            imageUrl: chapterPages.pages[index],
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CenterSorayomiShimmerIndicator(
              value: downloadProgress.progress,
            ),
          );
          return AppUtils.wrapOn(
            !kIsWeb && (Platform.isAndroid || Platform.isIOS)
                ? (child) => InteractiveViewer(maxScale: 5, child: child)
                : null,
            image,
          );
        },
        itemCount: chapterPages.pages.isEmpty ? 1 : chapterPages.pages.length,
      ),
    );
  }
}
