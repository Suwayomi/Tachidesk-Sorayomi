import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../../../../../generated/locales.g.dart';
import '../../../../data/enums/auth_type.dart';
import '../../../../widgets/emoticons.dart';
import '../../controllers/reader_controller.dart';
import '../reader_page_bottom_sheet.dart';

class ContinuousHorizontalLTR extends StatelessWidget {
  ContinuousHorizontalLTR.asFunction({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReaderController controller;

  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.arrowLeft): PreviousScroll(),
        LogicalKeySet(LogicalKeyboardKey.arrowRight): NextScroll(),
        // LogicalKeySet(LogicalKeyboardKey )
      },
      child: Actions(
        actions: {
          PreviousScroll: CallbackAction<PreviousScroll>(
            onInvoke: (intent) => scrollController.animateTo(
                scrollController.offset - 300,
                duration: Duration(milliseconds: 500),
                curve: Curves.ease),
          ),
          NextScroll: CallbackAction<NextScroll>(
            onInvoke: (intent) => scrollController.animateTo(
                scrollController.offset + 300,
                duration: Duration(milliseconds: 500),
                curve: Curves.ease),
          ),
        },
        child: Focus(
          autofocus: true,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: scrollController,
            itemCount: controller.chapter.pageCount,
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
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
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
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => SizedBox(
                      height: context.height,
                      width: context.width * .7,
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
