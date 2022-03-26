import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/manga_model.dart';
import '../../../data/source_model.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/manga_grid_design.dart';
import '../repository/global_search_repository.dart';

class SourceSearchGrid extends StatelessWidget {
  SourceSearchGrid({
    Key? key,
    required this.source,
    required this.query,
    required this.repository,
  }) : super(key: key);
  final Source source;
  final String query;
  final GlobalSearchRepository repository;
  final ScrollController controller = ScrollController();

  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  final RxList<Manga> _sourceMangaList = <Manga>[].obs;
  List<Manga> get sourceMangaList => _sourceMangaList;
  set sourceMangaList(List<Manga> value) => _sourceMangaList.value = value;

  void searchQuery() async {
    isLoading = true;
    sourceMangaList = (await repository.getSourceMangaList(
            query: query, sourceId: source.id!))?["mangaList"] ??
        sourceMangaList;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    searchQuery();
    return Obx(() => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(source.displayName ?? source.name!),
              trailing: Icon(Icons.arrow_forward_rounded),
              onTap: () => Get.toNamed(
                Routes.sourceManga + "/${source.id}/search" "?query=$query",
              ),
            ),
            isLoading
                ? CircularProgressIndicator()
                : sourceMangaList.isNotEmpty
                    ? SizedBox(
                        height: 200,
                        child: Scrollbar(
                          thumbVisibility: true,
                          controller: controller,
                          child: GridView.builder(
                            controller: controller,
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              crossAxisSpacing: 2.0,
                              mainAxisSpacing: 2.0,
                              childAspectRatio: 1.43,
                            ),
                            itemCount: (sourceMangaList.length),
                            itemBuilder: (BuildContext context, int index) {
                              return MangaGridDesign(
                                manga: sourceMangaList[index],
                                onTap: () => Get.toNamed(
                                  Routes.manga +
                                      "/${sourceMangaList[index].id}",
                                ),
                                isLibraryScreen: true,
                              );
                            },
                          ),
                        ),
                      )
                    : Text("No Results found"),
          ],
        ));
  }
}
