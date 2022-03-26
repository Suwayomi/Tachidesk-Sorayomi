import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../generated/locales.g.dart';
import '../../../data/manga_model.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/emoticons.dart';
import '../../../widgets/manga_grid_design.dart';
import '../controllers/search_source_controller.dart';
import '../widgets/search_text_field.dart';

class SearchSourceView extends GetView<SearchSourceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.width > 600
            ? Obx(
                () => Text("${LocaleKeys.searchManga_search.tr} " +
                    (controller.source.displayName ??
                        controller.source.name ??
                        "")),
              )
            : SearchTextField(controller: controller),
        actions: [
          context.width > 600
              ? SearchTextField(controller: controller, width: 300)
              : Container(),
        ],
      ),
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
              text: LocaleKeys.searchManga_noMangaFound.tr,
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
              text: LocaleKeys.no.tr + " " + LocaleKeys.searchManga_search.tr,
              button: TextButton.icon(
                onPressed: () => controller.pagingController.refresh(),
                icon: Icon(Icons.refresh),
                label: Text(
                  LocaleKeys.mangaScreen_reload.tr,
                ),
              ),
            ),
          ),
        ),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
          childAspectRatio: 0.7,
        ),
      ),
    );
  }
}
