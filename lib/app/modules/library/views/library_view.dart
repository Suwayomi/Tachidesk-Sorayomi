import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../data/manga_model.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/emoticons.dart';
import '../../../widgets/manga_grid_design.dart';
import '../controllers/library_controller.dart';

class LibraryView extends GetView<LibraryController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: controller.categoryListLength <= 1
            ? null
            : TabBar(
                controller: controller.tabController,
                padding: EdgeInsets.all(8),
                isScrollable: true,
                labelColor: context.theme.indicatorColor,
                unselectedLabelColor: context.textTheme.bodyText1!.color,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: context.theme.indicatorColor.withOpacity(.3),
                ),
                tabs: controller.categoryList
                    .map<Tab>((e) => Tab(text: e?.name ?? ""))
                    .toList(),
              ),
        body: Obx(
          () => controller.categoryListLength >= 1
              ? TabBarView(
                  controller: controller.tabController,
                  // physics: NeverScrollableScrollPhysics(),
                  children: controller.categoryList.map<Widget>(
                    (e) {
                      int index = controller.categoryList.indexOf(e);
                      List<Manga>? mangaList =
                          controller.categoryMangaMap[index];
                      return mangaList != null && mangaList.isNotEmpty
                          ? GridView.builder(
                              controller: controller.scrollController,
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 205,
                                crossAxisSpacing: 2.0,
                                mainAxisSpacing: 2.0,
                                childAspectRatio: 0.7,
                              ),
                              itemCount: mangaList.length,
                              itemBuilder: (context, index) => MangaGridDesign(
                                manga: mangaList[index],
                                onTap: () => Get.toNamed(
                                  "${Routes.manga}/${mangaList[index].id}",
                                ),
                                isLibraryScreen: true,
                              ),
                            )
                          : (controller.isLoading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : EmoticonsView(
                                  text: "${LocaleKeys.no.tr} "
                                      "${LocaleKeys.libraryScreen_manga.tr}",
                                  button: TextButton.icon(
                                    onPressed: () => controller
                                        .loadMangaListWithCategoryId(),
                                    style: TextButton.styleFrom(),
                                    icon: Icon(Icons.refresh),
                                    label: Text(
                                      LocaleKeys.libraryScreen_refresh.tr,
                                    ),
                                  ),
                                ));
                    },
                  ).toList(),
                )
              : (controller.isCategoryLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : EmoticonsView(
                      text: "${LocaleKeys.no.tr} "
                          "${LocaleKeys.libraryScreen_manga.tr}",
                      button: TextButton.icon(
                        onPressed: () => controller.refreshLibraryScreen(),
                        style: TextButton.styleFrom(),
                        icon: Icon(Icons.refresh),
                        label: Text(
                          LocaleKeys.libraryScreen_refresh.tr,
                        ),
                      ),
                    )),
        ),
      ),
    );
  }
}
