import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../../../../../generated/locales.g.dart';
import '../../../../data/enums/auth_type.dart';
import '../../../../widgets/emoticons.dart';
import '../../controllers/reader_controller.dart';
import '../reader_page_bottom_sheet.dart';

class SingleVertical extends StatelessWidget {
  SingleVertical.asFunction({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReaderController controller;

  final PageController pageController = PageController();

  void initListeners() {
    pageController.addListener(() {
      controller.currentIndex = pageController.page!.toInt();
    });

    // Sending functions to reader controller
    //    for managing reader mode from reader screen
    controller.sliderJumpTo = (index) => pageController.jumpToPage(index);

    controller.previousScroll = () {
      pageController.animateToPage((pageController.page!).toInt() - 1,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    };

    controller.nextScroll = () {
      pageController.animateToPage((pageController.page!).toInt() + 1,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    };
  }

  @override
  Widget build(BuildContext context) {
    initListeners();
    return Shortcuts(
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.arrowUp): PreviousScrollIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowDown): NextScrollIntent(),
      },
      child: Actions(
        actions: {
          PreviousScrollIntent: CallbackAction<PreviousScrollIntent>(
            onInvoke: (intent) => controller.previousScroll!(),
          ),
          NextScrollIntent: CallbackAction<NextScrollIntent>(
            onInvoke: (intent) => controller.nextScroll!(),
          ),
        },
        child: Focus(
          autofocus: true,
          child: PageView.builder(
            itemCount: controller.chapter.pageCount,
            controller: pageController,
            scrollDirection: Axis.vertical,
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
                  fit: BoxFit.fitHeight,
                  httpHeaders: headers,
                  imageUrl: controller.getChapterPage(index),
                  filterQuality: FilterQuality.medium,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      SizedBox(
                    height: context.height,
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
