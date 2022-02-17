import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/repository/source_repository.dart';
import '../../../data/source_manga_list_model.dart';
import '../../../data/source_model.dart';

class SearchSourceController extends GetxController {
  int _page = 1;
  late String sourceId;
  final ScrollController scrollController = ScrollController();
  final TextEditingController textEditingController = TextEditingController();
  final Rx<Source> _source = Source().obs;

  Source get source => _source.value;
  set source(Source value) => _source.value = value;

  final Rx<SourceMangaList> _sourceMangaList =
      SourceMangaList(mangaList: [], hasNextPage: true).obs;
  SourceMangaList get sourceMangaList => _sourceMangaList.value;
  set sourceMangaList(SourceMangaList value) => _sourceMangaList.value = value;

  final RxBool _isFirstPage = false.obs;

  bool get isFirstPage => _isFirstPage.value;
  set isFirstPage(bool value) => _isFirstPage.value = value;

  Future getNextPage({bool isRefresh = false}) async {
    if (!isRefresh) {
      if (sourceMangaList.hasNextPage ?? true) {
        final sourceMangaListTemp = await SourceRepository.getSourceSearch(
            searchTerm: textEditingController.text,
            pageNum: _page,
            sourceId: sourceId);
        _page += 1;
        sourceMangaList.hasNextPage =
            sourceMangaListTemp?.hasNextPage ?? sourceMangaList.hasNextPage;
        sourceMangaList.mangaList?.addAll(sourceMangaListTemp?.mangaList ?? []);
        _sourceMangaList.refresh();
        isFirstPage = false;
      }
    } else {
      isFirstPage = true;
      _page = 1;
      sourceMangaList = (await SourceRepository.getSourceSearch(
              searchTerm: textEditingController.text,
              pageNum: _page,
              sourceId: sourceId)) ??
          sourceMangaList;
      _page += 1;
      isFirstPage = false;
    }
  }

  @override
  void onInit() {
    sourceId = Get.parameters['sourceId']!;
    super.onInit();
  }

  @override
  void onReady() async {
    source = (await SourceRepository.getSource(sourceId: sourceId)) ?? source;
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        await getNextPage();
      }
    });
    super.onReady();
  }

  @override
  void onClose() {}
}
