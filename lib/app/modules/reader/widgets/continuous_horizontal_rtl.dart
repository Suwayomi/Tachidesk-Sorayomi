import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../widgets/emoticons.dart';
import '../controllers/reader_controller.dart';

class ContinuousHorizontalRTL extends StatelessWidget {
  ContinuousHorizontalRTL({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReaderController controller;

  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InteractiveViewer(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            reverse: true,
            controller: scrollController,
            itemCount: controller.chapter.pageCount,
            itemBuilder: (context, index) {
              if (index == (controller.chapter.pageCount! - 1)) {
                controller.markAsRead();
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CachedNetworkImage(
                  fit: BoxFit.fitHeight,
                  imageUrl: controller.getChapterPage(index),
                  filterQuality: FilterQuality.medium,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      SizedBox(
                    height: context.height,
                    width: context.width * .7,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: context.theme.colorScheme.secondary,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child:
                        EmoticonsView(emptyType: LocaleKeys.readerScreen_image),
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
                scrollController.animateTo(scrollController.offset + 300,
                    duration: Duration(seconds: 1), curve: Curves.ease);
              },
              child: Container(
                width: context.width * .2,
              ),
            ),
            InkWell(
              onTap: () {
                scrollController.animateTo(scrollController.offset - 300,
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
