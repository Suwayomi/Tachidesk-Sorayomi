import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/enums/source_type.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/emoticons.dart';
import '../../../widgets/manga_grid_design.dart';
import '../controllers/source_manga_controller.dart';

class SourceMangaView extends GetView<SourceMangaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
              controller.source.displayName ??
                  controller.source.name ??
                  (controller.sourceType == SourceType.latest
                      ? LocaleKeys.sourceMangaScreen_latest.tr
                      : LocaleKeys.sourceMangaScreen_browse.tr),
            )),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(
              Routes.sourceManga + "/${controller.sourceId}/search",
            ),
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Obx(() => controller.isFirstPage
          ? Center(child: CircularProgressIndicator())
          : ((controller.sourceMangaList.mangaList?.isNotEmpty ?? false))
              ? GridView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  controller: controller.scrollController,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                    childAspectRatio: 5 / 7,
                  ),
                  itemCount:
                      (controller.sourceMangaList.mangaList?.length ?? 0) + 1,
                  itemBuilder: (context, index) {
                    if (index == controller.sourceMangaList.mangaList?.length) {
                      return controller.sourceMangaList.hasNextPage ?? true
                          ? Card(
                              child: InkWell(
                                onTap: () => controller.getNextPage(),
                                child: GridTile(
                                  child: Icon(Icons.arrow_downward),
                                  footer: ListTile(
                                      title: Text(LocaleKeys
                                          .sourceMangaScreen_loadMore.tr)),
                                ),
                              ),
                            )
                          : Container();
                    }
                    return MangaGridDesign(
                      manga: controller.sourceMangaList.mangaList![index],
                      onTap: () => Get.toNamed(
                        Routes.manga +
                            "/${controller.sourceMangaList.mangaList![index].id}",
                      ),
                      isLibraryScreen: true,
                    );
                  },
                )
              : Center(
                  child: EmoticonsView(
                    emptyType: (controller.sourceType == SourceType.latest
                        ? LocaleKeys.sourceMangaScreen_latest.tr
                        : LocaleKeys.sourceMangaScreen_browse.tr),
                    button: TextButton.icon(
                      onPressed: () => controller.getNextPage(isRefresh: true),
                      style: TextButton.styleFrom(),
                      icon: Icon(Icons.refresh),
                      label: Text(
                        LocaleKeys.mangaScreen_reload.tr,
                      ),
                    ),
                  ),
                )),
    );
  }
}
