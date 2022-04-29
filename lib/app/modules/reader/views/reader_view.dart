import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../data/enums/reader_mode.dart';
import '../../../data/enums/reader_navigation_layout.dart';
import '../../../widgets/emoticons.dart';
import '../controllers/reader_controller.dart';
import '../widgets/paga_number_slider.dart';
import '../widgets/reader_mode_popup_menu_button.dart';
import '../widgets/reader_settings/reader_settings_bottomsheet.dart';

class ReaderView extends GetView<ReaderController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => controller.toggleVisibility(),
          child: Obx(
            () => Stack(
              children: [
                !controller.isLoading
                    ? controller.chapter.pageCount != null
                        ? Obx(() {
                            ReaderMode readerMode = controller.readerMode ==
                                    ReaderMode.defaultReader
                                ? controller.localStorageService.readerMode
                                : controller.readerMode;
                            return controller.readerModeMap[readerMode]!(
                                controller: controller);
                          })
                        : EmoticonsView(
                            text: "${LocaleKeys.no.tr} "
                                "${LocaleKeys.readerScreen_chapterError.tr}",
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
                if (controller.readerNavigationLayout !=
                    ReaderNavigationLayout.disabled) ...[
                  (controller.readerNavigationLayoutInvert)
                      ? controller.readerNavigationLayoutMap[
                          controller.readerNavigationLayout]!(
                          onLeftTap: () {
                            if (controller.nextScroll != null) {
                              controller.nextScroll!();
                            }
                          },
                          onRightTap: () {
                            if (controller.previousScroll != null) {
                              controller.previousScroll!();
                            }
                          },
                        )
                      : controller.readerNavigationLayoutMap[
                          controller.readerNavigationLayout]!(
                          onLeftTap: () {
                            if (controller.previousScroll != null) {
                              controller.previousScroll!();
                            }
                          },
                          onRightTap: () {
                            if (controller.nextScroll != null) {
                              controller.nextScroll!();
                            }
                          },
                        )
                ],
                if (controller.visibility) ...[
                  Column(
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
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 700),
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
                                            (controller.chapter.index ?? 0) > 1
                                                ? controller.prevChapter
                                                : null,
                                        icon: Icon(
                                          Icons.skip_previous_rounded,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: PagaNumberSlider(
                                        controller: controller,
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
                                              !(controller.chapter.bookmarked ??
                                                  true),
                                            ),
                                            icon: Icon(
                                              controller.chapter.bookmarked ??
                                                      true
                                                  ? Icons.bookmark
                                                  : Icons.bookmark_outline,
                                            ),
                                          ),
                                        ),
                                        ReaderModePopupMenuButton(
                                          controller: controller,
                                          icon: Icon(
                                            Icons.app_settings_alt_outlined,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () =>
                                              readerSettingsBottomSheet(
                                                  controller: controller),
                                          icon: Icon(Icons.settings_outlined),
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
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
