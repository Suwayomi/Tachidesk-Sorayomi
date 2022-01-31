import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../widgets/emoticons.dart';
import '../controllers/reader_controller.dart';

class SingleHorizontalRTL extends StatelessWidget {
  SingleHorizontalRTL({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReaderController controller;
  final PageController pageController = PageController();

  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InteractiveViewer(
          child: PageView.builder(
            controller: pageController,
            itemCount: controller.chapter.pageCount,
            reverse: true,
            itemBuilder: (context, index) => InteractiveViewer(
              child: Center(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                      fit: BoxFit.fitWidth,
                      imageUrl: controller.getChapterPage(index),
                      filterQuality: FilterQuality.medium,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => SizedBox(
                        height: context.height,
                        child: Center(
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                            color: context.theme.colorScheme.secondary,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Center(
                        child: EmoticonsView(
                            emptyType: LocaleKeys.readerScreen_image),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: () {
                scrollController.animateTo(scrollController.offset - 300,
                    duration: Duration(seconds: 1), curve: Curves.ease);
              },
              child: Container(
                height: context.height * .2,
              ),
            ),
            InkWell(
              onTap: () {
                scrollController.animateTo(scrollController.offset + 300,
                    duration: Duration(seconds: 1), curve: Curves.ease);
              },
              child: Container(
                height: context.height * .2,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: () {
                pageController.animateToPage((pageController.page!).toInt() + 1,
                    duration: Duration(seconds: 1), curve: Curves.ease);
              },
              child: Container(
                width: context.width * .2,
              ),
            ),
            InkWell(
              onTap: () {
                pageController.animateToPage((pageController.page!).toInt() - 1,
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
