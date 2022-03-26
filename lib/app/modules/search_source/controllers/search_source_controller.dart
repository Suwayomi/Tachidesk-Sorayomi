import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../data/manga_model.dart';
import '../../../data/source_model.dart';
import '../repository/search_source_repository.dart';

class SearchSourceController extends GetxController {
  final PagingController<int, Manga> pagingController =
      PagingController(firstPageKey: 1);

  final SearchSourceRepository repository = SearchSourceRepository();

  late String sourceId;
  final ScrollController scrollController = ScrollController();
  final TextEditingController textEditingController = TextEditingController();
  final Rx<Source> _source = Source().obs;

  Source get source => _source.value;
  set source(Source value) => _source.value = value;

  final RxBool _isFirstPage = false.obs;

  bool get isFirstPage => _isFirstPage.value;
  set isFirstPage(bool value) => _isFirstPage.value = value;

  Future<void> getNextPage(int pageKey) async {
    if (textEditingController.text.isEmpty) return;
    Map<String, dynamic>? sourceMangaListTemp =
        await repository.getSourceMangaList(
            query: textEditingController.text,
            pageNum: pageKey,
            sourceId: sourceId);
    if (sourceMangaListTemp != null) {
      if (sourceMangaListTemp["hasNextPage"]) {
        pagingController.appendPage(
            sourceMangaListTemp["mangaList"], pageKey + 1);
      } else {
        pagingController.appendLastPage([]);
      }
    }
  }

  @override
  void onInit() {
    sourceId = Get.parameters['sourceId']!;
    textEditingController.text = Get.parameters["query"] ?? "";
    pagingController.addPageRequestListener((pageKey) {
      getNextPage(pageKey);
    });
    super.onInit();
  }

  @override
  void onReady() async {
    source = (await repository.getSource(sourceId: sourceId)) ?? source;
    super.onReady();
  }

  @override
  void onClose() {}
}
