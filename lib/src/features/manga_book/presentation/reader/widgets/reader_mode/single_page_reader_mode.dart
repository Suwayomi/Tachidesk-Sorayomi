// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../../constants/app_constants.dart';
import '../../../../../../constants/endpoints.dart';
import '../../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../../../widgets/server_image.dart';
import '../../../../domain/chapter/chapter_model.dart';
import '../../../../domain/manga/manga_model.dart';
import '../reader_wrapper.dart';

class SinglePageReaderMode extends HookWidget {
  const SinglePageReaderMode({
    super.key,
    required this.manga,
    required this.chapter,
    this.onPageChanged,
    this.reverse = false,
    this.scrollDirection = Axis.horizontal,
  });

  final Manga manga;
  final Chapter chapter;
  final AsyncValueSetter<int>? onPageChanged;
  final bool reverse;
  final Axis scrollDirection;
  @override
  Widget build(BuildContext context) {
    final scrollController = usePageController(
      initialPage:
          chapter.read.ifNull() ? 0 : chapter.lastPageRead.ifNullOrNegative(),
    );
    final currentIndex = useState(scrollController.initialPage);
    useEffect(() {
      if (onPageChanged != null) onPageChanged!(currentIndex.value);
      return;
    }, [currentIndex.value]);
    useEffect(() {
      listener() {
        final currentPage = scrollController.page;
        if (currentPage != null) currentIndex.value = currentPage.toInt();
      }

      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, []);
    return ReaderWrapper(
      chapter: chapter,
      manga: manga,
      currentIndex: currentIndex.value,
      onChanged: (index) => scrollController.jumpToPage(index),
      onPrevious: () => scrollController.previousPage(
        duration: kDuration,
        curve: kCurve,
      ),
      onNext: () => scrollController.nextPage(
        duration: kDuration,
        curve: kCurve,
      ),
      child: PageView.builder(
        scrollDirection: scrollDirection,
        reverse: reverse,
        controller: scrollController,
        itemBuilder: (BuildContext context, int index) {
          final image = ServerImage(
            fit: BoxFit.contain,
            size: Size.fromHeight(context.height),
            appendApiToUrl: true,
            imageUrl: MangaUrl.chapterPageWithIndex(
              chapterIndex: "${chapter.index}",
              mangaId: "${manga.id}",
              pageIndex: index.toString(),
            ),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CenterCircularProgressIndicator(
              value: downloadProgress.progress,
            ),
          );
          return InteractiveViewer(
            maxScale: 8,
            child: image,
          );
        },
        itemCount: chapter.pageCount ?? 0,
      ),
    );
  }
}
