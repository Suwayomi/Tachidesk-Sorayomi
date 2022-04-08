import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../data/category_model.dart';
import '../../../data/chapter_model.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/emoticons.dart';
import '../controllers/manga_controller.dart';
import '../widgets/chapter_card.dart';
import '../widgets/manga_chapter_filter_list_view.dart';
import '../widgets/manga_chapter_sort_list_view.dart';
import '../widgets/manga_description.dart';

class MangaView extends GetView<MangaController> {
  @override
  String? get tag => Get.parameters["mangaId"];
  @override
  Widget build(BuildContext context) {
    MangaController controller = Get.find<MangaController>(tag: tag);
    return Scaffold(
        appBar: AppBar(
          title: Obx(
            () => Text(
              controller.manga.value.title ?? LocaleKeys.mangaScreen_manga.tr,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                await controller.loadCategoryList();
                Get.bottomSheet(
                  BottomSheet(
                    onClosing: () {},
                    builder: (context) => DefaultTabController(
                      length: 3,
                      child: Scaffold(
                        appBar: AppBar(
                          actions: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  await controller.setMangaFilterAsDefault();
                                  Get.back();
                                },
                                child: Text(
                                  LocaleKeys.mangaScreen_setAsDefault.tr,
                                ),
                              ),
                            ),
                          ],
                          bottom: context.width > 600
                              ? null
                              : TabBar(
                                  padding: EdgeInsets.all(8),
                                  isScrollable: false,
                                  labelColor: context.theme.indicatorColor,
                                  unselectedLabelColor:
                                      context.textTheme.bodyText1!.color,
                                  indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: context.theme.indicatorColor
                                        .withOpacity(.3),
                                  ),
                                  tabs: [
                                      Tab(
                                        text: LocaleKeys.mangaScreen_filter.tr,
                                      ),
                                      Tab(
                                        text: LocaleKeys.mangaScreen_sort.tr,
                                      ),
                                      Tab(
                                        text:
                                            LocaleKeys.mangaScreen_category.tr,
                                      ),
                                    ]),
                        ),
                        body: context.width > 600
                            ? Row(
                                children: [
                                  Expanded(
                                    child: MangaChapterFilterListView(
                                      controller: controller,
                                    ),
                                  ),
                                  VerticalDivider(),
                                  Expanded(
                                    child: MangaChapterSortListView(
                                      controller: controller,
                                    ),
                                  ),
                                  VerticalDivider(),
                                  Expanded(
                                    child: controller.categoryList.isNotEmpty
                                        ? ListView.builder(
                                            itemCount:
                                                controller.categoryList.length +
                                                    1,
                                            itemBuilder: (context, index) {
                                              if (index == 0) {
                                                return context.width < 600
                                                    ? Container()
                                                    : ListTile(
                                                        leading: Chip(
                                                          backgroundColor:
                                                              context.theme
                                                                  .indicatorColor
                                                                  .withOpacity(
                                                                      .3),
                                                          label: Text(
                                                            LocaleKeys
                                                                .mangaScreen_category
                                                                .tr,
                                                          ),
                                                          labelStyle: TextStyle(
                                                              color: context
                                                                  .theme
                                                                  .indicatorColor),
                                                        ),
                                                      );
                                              }
                                              index -= 1;
                                              RxBool isEnabled = controller
                                                  .mangaCategoryList
                                                  .contains(controller
                                                      .categoryList[index])
                                                  .obs;
                                              Category category = controller
                                                  .categoryList[index];
                                              return Obx(
                                                () => SwitchListTile(
                                                  value: isEnabled.value,
                                                  title: Text(
                                                    category.name ??
                                                        LocaleKeys
                                                            .mangaScreen_category
                                                            .tr,
                                                  ),
                                                  onChanged: (value) {
                                                    isEnabled.value = value;
                                                    if (value) {
                                                      controller.repository
                                                          .addMangaToCategory(
                                                              controller.manga
                                                                  .value.id!,
                                                              category.id!);
                                                    } else {
                                                      controller.repository
                                                          .removeMangaFromCategory(
                                                              controller.manga
                                                                  .value.id!,
                                                              category.id!);
                                                    }
                                                  },
                                                ),
                                              );
                                            },
                                          )
                                        : ListTile(
                                            title: Text(
                                              LocaleKeys
                                                  .mangaScreen_addCategoryHint
                                                  .tr,
                                            ),
                                            onTap: () {
                                              Get.back();
                                              Get.toNamed(
                                                  Routes.editCategories);
                                            },
                                          ),
                                  )
                                ],
                              )
                            : TabBarView(
                                children: [
                                  MangaChapterFilterListView(
                                    controller: controller,
                                  ),
                                  MangaChapterSortListView(
                                    controller: controller,
                                  ),
                                  controller.categoryList.isNotEmpty
                                      ? ListView.builder(
                                          itemCount:
                                              controller.categoryList.length,
                                          itemBuilder: (context, index) {
                                            RxBool isEnabled = controller
                                                .mangaCategoryList
                                                .contains(controller
                                                    .categoryList[index])
                                                .obs;
                                            Category category =
                                                controller.categoryList[index];
                                            return Obx(
                                              () => SwitchListTile(
                                                value: isEnabled.value,
                                                title: Text(
                                                  category.name ??
                                                      LocaleKeys
                                                          .mangaScreen_category
                                                          .tr,
                                                ),
                                                onChanged: (value) {
                                                  isEnabled.value = value;
                                                  if (value) {
                                                    controller.repository
                                                        .addMangaToCategory(
                                                            controller.manga
                                                                .value.id!,
                                                            category.id!);
                                                  } else {
                                                    controller.repository
                                                        .removeMangaFromCategory(
                                                            controller.manga
                                                                .value.id!,
                                                            category.id!);
                                                  }
                                                },
                                              ),
                                            );
                                          },
                                        )
                                      : ListTile(
                                          title: Text(
                                            LocaleKeys
                                                .mangaScreen_addCategoryHint.tr,
                                          ),
                                          onTap: () {
                                            Get.back();
                                            Get.toNamed(Routes.editCategories);
                                          },
                                        ),
                                ],
                              ),
                      ),
                    ),
                  ),
                );
              },
              icon: Icon(Icons.filter_list_rounded),
            ),
          ],
        ),
        floatingActionButton:
            Obx(() => controller.firstUnreadChapter.index != -1
                ? FloatingActionButton.extended(
                    onPressed: () {
                      if (controller.firstUnreadChapter.index == -1) {
                        Get.rawSnackbar(
                          title: LocaleKeys.mangaScreen_noNewChapter.tr,
                          message: LocaleKeys.mangaScreen_noNewChapter.tr,
                        );
                      } else {
                        Chapter chapter = controller.firstUnreadChapter;
                        Get.toNamed(Routes.manga +
                            "/${chapter.mangaId}/chapter/${chapter.index}");
                      }
                    },
                    icon: Icon(Icons.play_arrow_rounded),
                    label: controller.firstUnreadChapter.index != 1
                        ? Text("Resume")
                        : Text("Start"),
                    isExtended: context.width > 600 ? true : false,
                  )
                : Container()),
        body: Obx(
          () => controller.isPageLoading.value
              ? Center(child: CircularProgressIndicator())
              : context.width > 600
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Obx(
                            () => SingleChildScrollView(
                              controller: ScrollController(),
                              child: MangaDescription(
                                manga: controller.manga.value,
                                addMangaToLibrary: controller.addMangaToLibrary,
                                removeMangaFromLibrary:
                                    controller.removeMangaFromLibrary,
                              ),
                            ),
                          ),
                        ),
                        VerticalDivider(),
                        Expanded(
                          child: Obx(
                            () => controller.isLoading.value
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : controller.chapterList.isEmpty
                                    ? EmoticonsView(
                                        text: LocaleKeys.no.tr +
                                            " " +
                                            LocaleKeys.mangaScreen_noChapter.tr,
                                        button: TextButton.icon(
                                          onPressed: () =>
                                              controller.loadChapterList(
                                                  onlineFetch: true),
                                          style: TextButton.styleFrom(),
                                          icon: Icon(Icons.refresh),
                                          label: Text(
                                            LocaleKeys.mangaScreen_reload.tr,
                                          ),
                                        ),
                                      )
                                    : ListView.builder(
                                        itemCount:
                                            controller.chapterList.length + 1,
                                        itemBuilder: (context, index) {
                                          if (index == 0) {
                                            int length =
                                                controller.chapterList.length;
                                            return ListTile(
                                              title: Text(
                                                length.toString() +
                                                    " " +
                                                    LocaleKeys
                                                        .mangaScreen_chapters
                                                        .tr,
                                              ),
                                              trailing: IconButton(
                                                onPressed: () =>
                                                    controller.loadChapterList(
                                                        onlineFetch: true),
                                                icon: Icon(
                                                  Icons.refresh,
                                                ),
                                              ),
                                            );
                                          }
                                          Chapter? chapter =
                                              controller.chapterList[index - 1];
                                          return ChapterCard(
                                            chapter: chapter,
                                            controller: controller,
                                          );
                                        },
                                      ),
                          ),
                        ),
                      ],
                    )
                  : Obx(
                      () => controller.isLoading.value
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Obx(
                                  () => MangaDescription(
                                    manga: controller.manga.value,
                                    addMangaToLibrary:
                                        controller.addMangaToLibrary,
                                    removeMangaFromLibrary:
                                        controller.removeMangaFromLibrary,
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ],
                            )
                          : controller.chapterList.isEmpty
                              ? Column(
                                  children: [
                                    Obx(
                                      () => MangaDescription(
                                        manga: controller.manga.value,
                                        addMangaToLibrary:
                                            controller.addMangaToLibrary,
                                        removeMangaFromLibrary:
                                            controller.removeMangaFromLibrary,
                                      ),
                                    ),
                                    EmoticonsView(
                                      text: LocaleKeys.no.tr +
                                          " " +
                                          LocaleKeys.mangaScreen_noChapter.tr,
                                      button: TextButton.icon(
                                        onPressed: () =>
                                            controller.loadChapterList(
                                          onlineFetch: true,
                                        ),
                                        style: TextButton.styleFrom(),
                                        icon: Icon(Icons.refresh),
                                        label: Text(
                                          LocaleKeys.mangaScreen_reload.tr,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : ListView.builder(
                                  itemCount: controller.chapterList.length + 2,
                                  itemBuilder: (context, index) {
                                    if (index == 0) {
                                      return Obx(
                                        () => MangaDescription(
                                          manga: controller.manga.value,
                                          addMangaToLibrary:
                                              controller.addMangaToLibrary,
                                          removeMangaFromLibrary:
                                              controller.removeMangaFromLibrary,
                                        ),
                                      );
                                    }
                                    if (index == 1) {
                                      int length =
                                          controller.chapterList.length;
                                      return ListTile(
                                        title: Text(
                                          length.toString() +
                                              " " +
                                              LocaleKeys
                                                  .mangaScreen_chapters.tr,
                                        ),
                                        trailing: IconButton(
                                          onPressed: () =>
                                              controller.loadChapterList(
                                                  onlineFetch: true),
                                          icon: Icon(
                                            Icons.refresh,
                                          ),
                                        ),
                                      );
                                    }
                                    Chapter? chapter =
                                        controller.chapterList[index - 2];
                                    return ChapterCard(
                                      chapter: chapter,
                                      controller: controller,
                                    );
                                  },
                                ),
                    ),
        ));
  }
}
