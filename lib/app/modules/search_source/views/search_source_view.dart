import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/emoticons.dart';
import '../../../widgets/manga_grid_design.dart';
import '../controllers/search_source_controller.dart';

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
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller.textEditingController,
                  autofocus: true,
                  onEditingComplete: () =>
                      controller.getNextPage(isRefresh: true),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        controller.getNextPage(isRefresh: true);
                      },
                    ),
                    border: OutlineInputBorder(),
                    hintText: LocaleKeys.searchManga_searchManga.tr,
                  ),
                ),
              ),
        actions: [
          context.width > 600
              ? Container(
                  padding: EdgeInsets.all(8.0),
                  width: 300,
                  child: TextField(
                    controller: controller.textEditingController,
                    autofocus: true,
                    onEditingComplete: () =>
                        controller.getNextPage(isRefresh: true),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          controller.getNextPage(isRefresh: true);
                        },
                      ),
                      border: OutlineInputBorder(),
                      hintText: LocaleKeys.searchManga_searchManga.tr,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
      body: Obx(() => controller.isFirstPage
          ? Center(child: CircularProgressIndicator())
          : ((controller.sourceMangaList.mangaList?.isNotEmpty ?? false))
              ? GridView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  controller: controller.scrollController,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0,
                    childAspectRatio: 0.65,
                  ),
                  itemCount:
                      (controller.sourceMangaList.mangaList?.length ?? 0) + 1,
                  itemBuilder: (context, index) {
                    if (index == controller.sourceMangaList.mangaList?.length) {
                      return controller.sourceMangaList.hasNextPage ?? false
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
                    emptyType: LocaleKeys.searchManga_search.tr,
                  ),
                )),
    );
  }
}
