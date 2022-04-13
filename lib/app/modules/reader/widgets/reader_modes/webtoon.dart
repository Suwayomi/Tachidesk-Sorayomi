import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../generated/locales.g.dart';
import '../../../../data/enums/auth_type.dart';
import '../../../../widgets/emoticons.dart';
import '../../controllers/reader_controller.dart';
import '../reader_page_bottom_sheet.dart';

class Webtoon extends StatelessWidget {
  Webtoon.asFunction({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReaderController controller;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  void initListeners() {
    itemPositionsListener.itemPositions.addListener(() {
      var positions = itemPositionsListener.itemPositions.value.toList();
      controller.currentIndex = positions
          .where((ItemPosition position) => position.itemTrailingEdge > 0)
          .reduce((ItemPosition min, ItemPosition position) =>
              position.itemTrailingEdge < min.itemTrailingEdge ? position : min)
          .index;
    });
    controller.sliderJumpTo =
        (index) => itemScrollController.jumpTo(index: index);
  }

  @override
  Widget build(BuildContext context) {
    initListeners();
    return Shortcuts(
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.arrowUp): PreviousScroll(),
        LogicalKeySet(LogicalKeyboardKey.arrowDown): NextScroll(),
      },
      child: Actions(
        actions: {
          PreviousScroll: CallbackAction<PreviousScroll>(
            onInvoke: (intent) {
              ItemPosition itemPosition =
                  itemPositionsListener.itemPositions.value.toList().first;
              return itemScrollController.scrollTo(
                index: itemPosition.index,
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
                alignment: itemPosition.itemLeadingEdge + .2,
              );
            },
          ),
          NextScroll: CallbackAction<NextScroll>(
            onInvoke: (intent) {
              ItemPosition itemPosition =
                  itemPositionsListener.itemPositions.value.first;
              return itemScrollController.scrollTo(
                index: itemPosition.index,
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
                alignment: itemPosition.itemLeadingEdge - .2,
              );
            },
          ),
        },
        child: Focus(
          autofocus: true,
          child: ScrollablePositionedList.builder(
            itemScrollController: itemScrollController,
            itemPositionsListener: itemPositionsListener,
            itemCount: controller.chapter.pageCount ?? 0,
            itemBuilder: (context, index) {
              if (index == (controller.chapter.pageCount! - 1)) {
                controller.markAsRead();
              }
              Map<String, String>? headers =
                  controller.localStorageService.baseAuthType == AuthType.basic
                      ? {
                          "Authorization":
                              controller.localStorageService.basicAuth,
                        }
                      : null;
              return GestureDetector(
                onSecondaryTap: () {
                  readerPageBottomSheet(
                    index: index,
                    controller: controller,
                    headers: headers,
                  );
                },
                onLongPress: () {
                  readerPageBottomSheet(
                    index: index,
                    controller: controller,
                    headers: headers,
                  );
                },
                child: CachedNetworkImage(
                  fit: BoxFit.fitWidth,
                  imageUrl: controller.getChapterPage(index),
                  httpHeaders: headers,
                  filterQuality: FilterQuality.medium,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      SizedBox(
                    height: context.height * .7,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => SizedBox(
                    height: context.height,
                    child: Center(
                      child: EmoticonsView(
                        text: LocaleKeys.no.tr +
                            " " +
                            LocaleKeys.readerScreen_image.tr,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
