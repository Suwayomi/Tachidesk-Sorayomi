// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../../constants/app_constants.dart';
import '../../../../../../constants/app_sizes.dart';
import '../../../../../../constants/endpoints.dart';
import '../../../../../../i18n/locale_keys.g.dart';
import '../../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../../widgets/server_image.dart';
import '../../../../domain/chapter/chapter_model.dart';
import '../../../../domain/manga/manga_model.dart';
import '../chapter_separator.dart';
import '../reader_wrapper.dart';

class WebtoonReaderMode extends HookWidget {
  const WebtoonReaderMode({
    super.key,
    required this.manga,
    required this.chapter,
    this.showSeparator = false,
    this.onPageChanged,
  });
  final Manga manga;
  final Chapter chapter;
  final bool showSeparator;
  final AsyncValueSetter<int>? onPageChanged;
  @override
  Widget build(BuildContext context) {
    final scrollController = useMemoized(() => ItemScrollController());
    final positionsListener = useMemoized(() => ItemPositionsListener.create());
    final currentIndex = useState(0);
    useEffect(() {
      listener() {
        final positions = positionsListener.itemPositions.value.toList();
        if (positions.isSingletonList) {
          currentIndex.value = (positions.first.index);
        } else {
          final newPositions = positions.where((ItemPosition position) =>
              position.itemTrailingEdge.liesBetween());
          if (newPositions.isBlank) return;
          currentIndex.value = newPositions
              .reduce((ItemPosition max, ItemPosition position) =>
                  position.itemTrailingEdge > max.itemTrailingEdge
                      ? position
                      : max)
              .index;
        }
      }

      positionsListener.itemPositions.addListener(listener);
      return () => positionsListener.itemPositions.removeListener(listener);
    }, []);
    return ReaderWrapper(
      chapter: chapter,
      manga: manga,
      currentIndex: currentIndex.value,
      onChanged: (index) => scrollController.jumpTo(index: index),
      onPrevious: () {
        final ItemPosition itemPosition =
            positionsListener.itemPositions.value.toList().first;
        scrollController.scrollTo(
          index: itemPosition.index,
          duration: kDuration,
          curve: kCurve,
          alignment: itemPosition.itemLeadingEdge + .8,
        );
      },
      onNext: () {
        ItemPosition itemPosition = positionsListener.itemPositions.value.first;
        final int index;
        final double alignment;
        if (itemPosition.itemTrailingEdge > 1) {
          index = itemPosition.index;
          alignment = itemPosition.itemLeadingEdge - .8;
        } else {
          index = itemPosition.index + 1;
          alignment = 0;
        }
        scrollController.scrollTo(
          index: index,
          duration: kDuration,
          curve: kCurve,
          alignment: alignment,
        );
      },
      child: InteractiveViewer(
        maxScale: 8,
        child: ScrollablePositionedList.separated(
          itemScrollController: scrollController,
          itemPositionsListener: positionsListener,
          itemBuilder: (BuildContext context, int index) {
            final image = ServerImage(
              fit: BoxFit.fitWidth,
              appendApiToUrl: true,
              imageUrl: MangaUrl.chapterPageWithIndex(
                chapterIndex: "${chapter.index}",
                mangaId: "${manga.id}",
                pageIndex: index.toString(),
              ),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
              ),
              wrapper: (child) => SizedBox(
                height: context.height * .7,
                child: child,
              ),
            );
            if (index == 0) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ChapterSeparator(
                    title: LocaleKeys.current.tr(),
                    name: chapter.name ??
                        LocaleKeys.chapterNumber.tr(namedArgs: {
                          'chapterNumber': "${chapter.chapterNumber ?? 0}"
                        }),
                  ),
                  image,
                ],
              );
            } else if (index == (chapter.pageCount ?? 0) - 1) {
              if (onPageChanged != null) {
                onPageChanged!(-1);
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  image,
                  ChapterSeparator(
                    title: LocaleKeys.finished.tr(),
                    name: chapter.name ??
                        LocaleKeys.chapterNumber.tr(namedArgs: {
                          'chapterNumber': "${chapter.chapterNumber ?? 0}"
                        }),
                  ),
                ],
              );
            } else {
              return image;
            }
          },
          itemCount: chapter.pageCount ?? 0,
          separatorBuilder: (BuildContext context, int index) =>
              showSeparator ? KSizedBox.h16.size : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
