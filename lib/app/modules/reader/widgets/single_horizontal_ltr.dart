import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../widgets/emoticons.dart';
import '../controllers/reader_controller.dart';

class SingleHorizontalLTR extends StatelessWidget {
  SingleHorizontalLTR.asFunction({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReaderController controller;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InteractiveViewer(
          child: PageView.builder(
            controller: pageController,
            itemCount: controller.chapter.pageCount,
            itemBuilder: (context, index) {
              if (index == (controller.chapter.pageCount! - 1)) {
                controller.markAsRead();
              }
              return InteractiveViewer(
                child: Center(
                  child: CachedNetworkImage(
                    fit: BoxFit.fitHeight,
                    imageUrl: controller.getChapterPage(index),
                    filterQuality: FilterQuality.medium,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => SizedBox(
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
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: () {
                pageController.animateToPage((pageController.page!).toInt() - 1,
                    duration: Duration(seconds: 1), curve: Curves.ease);
              },
              child: Container(
                width: context.width * .2,
              ),
            ),
            InkWell(
              onTap: () {
                pageController.animateToPage((pageController.page!).toInt() + 1,
                    duration: Duration(seconds: 1), curve: Curves.ease);
              },
              child: Container(
                width: context.width * .2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
