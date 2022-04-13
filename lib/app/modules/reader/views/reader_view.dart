import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../data/enums/reader_mode.dart';
import '../../../widgets/emoticons.dart';
import '../controllers/reader_controller.dart';

class ReaderView extends GetView<ReaderController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: GestureDetector(
          onTap: () => controller.toggleVisibility(),
          child: Stack(
            children: [
              !controller.isLoading
                  ? controller.chapter.pageCount != null
                      ? Obx(() {
                          ReaderMode readerMode =
                              controller.readerMode == ReaderMode.defaultReader
                                  ? controller.localStorageService.readerMode
                                  : controller.readerMode;
                          return controller.readerModeMap[readerMode]!(
                              controller: controller);
                        })
                      : EmoticonsView(
                          text: LocaleKeys.no.tr +
                              " " +
                              LocaleKeys.readerScreen_chapterError.tr,
                          button: TextButton.icon(
                            onPressed: () => controller.reloadReader(),
                            style: TextButton.styleFrom(),
                            icon: Icon(Icons.refresh),
                            label: Text(
                              LocaleKeys.readerScreen_reload.tr,
                            ),
                          ),
                        )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
              Obx(() => controller.visibility
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: kToolbarHeight,
                          child: AppBar(
                            title: ListTile(
                              title: Text(
                                controller.manga.title ?? '',
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(
                                "${controller.chapter.name}",
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            elevation: 0,
                            iconTheme: IconThemeData(color: context.iconColor),
                            backgroundColor: Colors.black.withOpacity(.7),
                            automaticallyImplyLeading:
                                controller.isDataLoading &&
                                    controller.visibility,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 600),
                          child: BottomAppBar(
                            color: Colors.transparent,
                            elevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Card(
                                        color: Colors.black.withOpacity(.7),
                                        shape: CircleBorder(),
                                        child: IconButton(
                                          onPressed:
                                              (controller.chapter.index ?? 0) >
                                                      1
                                                  ? controller.prevChapter
                                                  : null,
                                          icon:
                                              Icon(Icons.skip_previous_rounded),
                                        ),
                                      ),
                                      Expanded(
                                        child: Card(
                                          color: Colors.black.withOpacity(.7),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                            ),
                                            child: Obx(() => Row(
                                                  children: [
                                                    Text(
                                                        "${controller.currentIndex + 1}"),
                                                    Expanded(
                                                      child: Slider(
                                                        value: controller
                                                            .currentIndex
                                                            .toDouble(),
                                                        min: 0,
                                                        max: (controller.chapter
                                                                        .pageCount ??
                                                                    1)
                                                                .toDouble() -
                                                            1,
                                                        // divisions:
                                                        //     controller.chapter.pageCount,
                                                        onChanged: (value) {
                                                          controller.sliderValue
                                                                  .value =
                                                              value.toInt();
                                                          controller
                                                                  .currentIndex =
                                                              value.toInt();
                                                        },
                                                      ),
                                                    ),
                                                    Text((controller.chapter
                                                                .pageCount ??
                                                            1)
                                                        .toString()),
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ),
                                      Card(
                                        color: Colors.black.withOpacity(.7),
                                        shape: CircleBorder(),
                                        child: IconButton(
                                          onPressed:
                                              (controller.chapter.index ?? 1) <
                                                      (controller.chapter
                                                              .chapterCount ??
                                                          0)
                                                  ? controller.nextChapter
                                                  : null,
                                          icon: Icon(Icons.skip_next_rounded),
                                        ),
                                      )
                                    ],
                                  ),
                                  Card(
                                    color: Colors.black.withOpacity(.7),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Obx(
                                            () => IconButton(
                                              onPressed: () =>
                                                  controller.modifyChapter(
                                                'bookmarked',
                                                !(controller
                                                        .chapter.bookmarked ??
                                                    true),
                                              ),
                                              icon: Icon((controller
                                                          .chapter.bookmarked ??
                                                      true)
                                                  ? Icons.bookmark
                                                  : Icons
                                                      .bookmark_outline_rounded),
                                            ),
                                          ),
                                          PopupMenuButton(
                                            icon: Icon(
                                              Icons.app_settings_alt_outlined,
                                            ),
                                            initialValue: controller.readerMode,
                                            onSelected: (ReaderMode? e) =>
                                                controller.changeReaderMode(e),
                                            itemBuilder: (context) {
                                              return ReaderMode.values
                                                  .map<
                                                      PopupMenuEntry<
                                                          ReaderMode>>(
                                                    (e) => PopupMenuItem(
                                                      value: e,
                                                      child: ListTile(
                                                        title: Text(
                                                          (LocaleKeys.readerScreen_readerMode_ +
                                                                  e.name)
                                                              .tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                  .toList();
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : Container()),
            ],
          ),
        ),
      ),
    );
  }
}
