import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/emoticons.dart';
import '../../../widgets/manga_grid_design.dart';
import '../controllers/library_controller.dart';

class LibraryView extends GetView<LibraryController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => DefaultTabController(
          length: controller.categoryListLength,
          animationDuration: Duration(),
          initialIndex: controller.tabIndex.value,
          child: Scaffold(
            appBar: controller.categoryListLength == 1
                ? null
                : TabBar(
                    onTap: (value) {
                      controller.tabIndex.value = value;
                      controller.loadMangaListWithCategoryId();
                    },
                    padding: EdgeInsets.all(8),
                    isScrollable: context.width > 600 ? true : false,
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
            body: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: controller.categoryList.map<Widget>((e) {
                  return Obx(
                    () => controller.mangaListLength != (0)
                        ? GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              crossAxisSpacing: 4.0,
                              mainAxisSpacing: 4.0,
                              childAspectRatio: 5 / 7,
                            ),
                            itemCount: controller.mangaListLength,
                            itemBuilder: (context, index) => MangaGridDesign(
                              manga: controller.mangaList[index],
                              onTap: () => Get.toNamed(
                                Routes.manga +
                                    "/${controller.mangaList[index].id}",
                              ),
                              isLibraryScreen: true,
                            ),
                          )
                        : (controller.isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: context.theme.colorScheme.secondary,
                                ),
                              )
                            : EmoticonsView(
                                emptyType: LocaleKeys.libraryScreen_manga.tr,
                              )),
                  );
                }).toList()),
          ),
        ));
  }
}
