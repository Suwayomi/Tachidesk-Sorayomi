import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../generated/locales.g.dart';
import '../../../data/enums/source_type.dart';
import '../../../data/manga_model.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/emoticons.dart';
import '../../../widgets/manga_grid_design.dart';
import '../controllers/source_manga_controller.dart';
import '../widgets/source_manga_filter_item.dart';

class SourceMangaView extends GetView<SourceMangaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_rounded,
          ),
        ),
        title: Obx(() => Text(
              controller.source.displayName ??
                  controller.source.name ??
                  (controller.sourceType == SourceType.latest
                      ? LocaleKeys.sourceMangaScreen_latest.tr
                      : LocaleKeys.sourceMangaScreen_browse.tr),
            )),
        actions: [
          Obx(
            () => controller.isSearching
                ? Container(
                    padding: EdgeInsets.all(8.0),
                    width: min(context.width * .5, 300),
                    child: TextField(
                      controller: controller.textEditingController,
                      autofocus: true,
                      onEditingComplete: () {
                        if (controller.textEditingController.text.isEmpty) {
                          return;
                        }
                        Get.toNamed(
                          Routes.sourceManga +
                              "/${controller.sourceId}/search" +
                              "?query=${controller.textEditingController.text}",
                        );
                        controller.isSearching = false;
                        controller.textEditingController.clear();
                      },
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          icon: Icon(
                            Icons.search,
                          ),
                          onPressed: () {
                            if (controller.textEditingController.text.isEmpty) {
                              return;
                            }
                            Get.toNamed(
                              Routes.globalSearch +
                                  "?query=${controller.textEditingController.text}",
                            );
                            controller.isSearching = false;
                            controller.textEditingController.clear();
                          },
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.close,
                          ),
                          onPressed: () {
                            controller.isSearching = false;
                            controller.textEditingController.clear();
                          },
                        ),
                        border: OutlineInputBorder(),
                        hintText: LocaleKeys.libraryScreen_mangaSearch.tr,
                      ),
                    ))
                : IconButton(
                    onPressed: () => controller.isSearching = true,
                    icon: Icon(Icons.search),
                  ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: Scaffold(
          appBar: AppBar(
            leading: TextButton(
              onPressed: () {
                controller.getFilter(true);
              },
              child: Text(
                LocaleKeys.sourceMangaScreen_reset.tr,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    await controller.applyFilter();
                    Get.back();
                  },
                  child: Text(
                    LocaleKeys.sourceMangaScreen_filter.tr,
                  ),
                ),
              ),
            ],
          ),
          body: Obx(
            () => ListView.builder(
              controller: ScrollController(),
              itemCount: controller.sourceMangaFilterList.length,
              itemBuilder: (BuildContext context, int index) {
                return SourceMangaFilterItem(
                    controller: controller, index: index);
              },
            ),
          ),
        ),
      ),
      floatingActionButton: Obx(() =>
          controller.sourceType == SourceType.popular &&
                  controller.sourceMangaFilterList.isNotEmpty
              ? FloatingActionButton.extended(
                  icon: Icon(Icons.filter_list_rounded),
                  label: Text(LocaleKeys.sourceMangaScreen_filter.tr),
                  isExtended: true,
                  onPressed: () {
                    controller.scaffoldKey.currentState?.openEndDrawer();
                  },
                )
              : Container()),
      body: PagedGridView<int, Manga>(
        pagingController: controller.pagingController,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (context, manga, index) {
            return MangaGridDesign(
              manga: manga,
              onTap: () => Get.toNamed(
                Routes.manga + "/${manga.id}",
              ),
              isLibraryScreen: false,
            );
          },
          noItemsFoundIndicatorBuilder: (context) => Center(
            child: EmoticonsView(
              text: LocaleKeys.no.tr +
                  " " +
                  (controller.sourceType == SourceType.latest
                      ? LocaleKeys.sourceMangaScreen_latest.tr
                      : LocaleKeys.sourceMangaScreen_browse.tr),
              button: TextButton.icon(
                onPressed: () => controller.pagingController.refresh(),
                style: TextButton.styleFrom(),
                icon: Icon(Icons.refresh),
                label: Text(
                  LocaleKeys.mangaScreen_reload.tr,
                ),
              ),
            ),
          ),
          newPageProgressIndicatorBuilder: (context) => Card(
            child: GridTile(
              child: Center(child: CircularProgressIndicator()),
              footer: ListTile(
                title: Text(
                  LocaleKeys.sourceMangaScreen_loading.tr,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          firstPageErrorIndicatorBuilder: (context) => Center(
            child: EmoticonsView(
              text: LocaleKeys.no.tr +
                  " " +
                  (controller.sourceType == SourceType.latest
                      ? LocaleKeys.sourceMangaScreen_latest.tr
                      : LocaleKeys.sourceMangaScreen_browse.tr),
              button: TextButton.icon(
                onPressed: () => controller.pagingController.refresh(),
                style: TextButton.styleFrom(),
                icon: Icon(Icons.refresh),
                label: Text(
                  LocaleKeys.mangaScreen_reload.tr,
                ),
              ),
            ),
          ),
        ),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 205,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
          childAspectRatio: 0.7,
        ),
      ),
    );
  }
}
