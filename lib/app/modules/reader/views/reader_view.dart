import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/values/api_url.dart';
import '../../../data/enums/auth_type.dart';
import '../../../data/enums/reader_mode.dart';
import '../../../widgets/emoticons.dart';
import '../controllers/reader_controller.dart';

class ReaderView extends GetView<ReaderController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          actionsIconTheme: IconThemeData(color: Colors.grey),
          actions: [
            controller.visibility && (controller.chapter.index ?? 0) > 1
                ? IconButton(
                    onPressed: () => controller.prevChapter(),
                    icon: Icon(
                      Icons.arrow_back_ios,
                    ),
                  )
                : Container(),
            controller.visibility &&
                    (controller.chapter.index ?? 1) <
                        (controller.chapter.chapterCount ?? 0)
                ? IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                    ),
                    onPressed: () => controller.nextChapter(),
                  )
                : Container(),
            controller.visibility
                ? IconButton(
                    onPressed: () => Get.back(), icon: Icon(Icons.close))
                : Container(),
            IconButton(
              onPressed: () => controller.toggleVisibility(),
              icon: controller.visibility
                  ? Icon(Icons.visibility_rounded)
                  : Icon(
                      Icons.visibility_off_rounded,
                      color: Colors.grey.withOpacity(0.5),
                    ),
            ),
          ],
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.grey),
          backgroundColor: controller.visibility ? null : Colors.transparent,
          automaticallyImplyLeading:
              controller.isDataLoading && controller.visibility,
        ),
        extendBodyBehindAppBar: true,
        drawer: Drawer(
            child: Obx(
          () => ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: Obx(
                  () => GridTile(
                    child: Container(
                      child: (controller.manga.thumbnailUrl ?? "").isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: controller.localStorageService.baseURL +
                                  (controller.manga.thumbnailUrl ?? "") +
                                  "/?useCache=true",
                              httpHeaders:
                                  controller.localStorageService.baseAuthType ==
                                          AuthType.basic
                                      ? {
                                          "Authorization": controller
                                              .localStorageService.basicAuth,
                                        }
                                      : null,
                              fit: BoxFit.cover,
                              errorWidget: (context, error, stackTrace) =>
                                  ImageIcon(
                                AssetImage(iconLightTextNbgPngURL),
                              ),
                            )
                          : ImageIcon(
                              AssetImage(iconLightTextNbgPngURL),
                            ),
                      foregroundDecoration: BoxDecoration(
                        border: Border.all(
                          width: 0,
                          color: Get.theme.canvasColor,
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [
                            Get.theme.canvasColor.withOpacity(0),
                            Get.theme.canvasColor.withOpacity(0.4),
                            Get.theme.canvasColor.withOpacity(0.9),
                          ],
                        ),
                      ),
                    ),
                    footer: Obx(() => ListTile(
                          leading: IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          title: Text(
                            controller.manga.title ??
                                LocaleKeys.readerScreen_manga.tr,
                            style: context.textTheme.headline6,
                          ),
                          subtitle: Text(
                            controller.chapter.name ??
                                LocaleKeys.readerScreen_chapter.tr,
                          ),
                        )),
                  ),
                ),
              ),
              ListTile(
                subtitle: Text(LocaleKeys.readerScreen_readerMode_.tr),
                leading: Icon(Icons.app_settings_alt_outlined),
                isThreeLine: true,
                title: DropdownButton(
                  value: controller.readerMode,
                  isExpanded: true,
                  hint: Text(LocaleKeys.readerScreen_readerMode_.tr),
                  items: ReaderMode.values
                      .map<DropdownMenuItem<ReaderMode>>((e) =>
                          DropdownMenuItem<ReaderMode>(
                            child: Text(
                              (LocaleKeys.readerScreen_readerMode_ + e.name).tr,
                              overflow: TextOverflow.ellipsis,
                            ),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (ReaderMode? e) => controller.changeReaderMode(e),
                ),
              ),
              Obx(() => Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      controller.chapter.index != null &&
                              (controller.chapter.index!) > 1
                          ? TextButton.icon(
                              onPressed: () => controller.prevChapter(),
                              icon: Icon(
                                Icons.arrow_back_ios,
                              ),
                              label: Text(
                                LocaleKeys.readerScreen_previousChapter.tr,
                              ),
                            )
                          : Container(),
                      controller.chapter.index != null &&
                              controller.chapter.index! <
                                  controller.chapter.chapterCount!
                          ? TextButton.icon(
                              label: Icon(
                                Icons.arrow_forward_ios,
                              ),
                              onPressed: () => controller.nextChapter(),
                              icon: Text(
                                LocaleKeys.readerScreen_nextChapter.tr,
                              ),
                            )
                          : Container(),
                    ],
                  ))
            ],
          ),
        )),
        body: !controller.isLoading
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
      ),
    );
  }
}
