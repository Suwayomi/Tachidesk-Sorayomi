import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/enums/source_type.dart';
import '../../../data/repository/source_repository.dart';
import '../../../data/source_manga_list_model.dart';
import '../../../data/source_model.dart';

class SourceMangaController extends GetxController {
  int _page = 1;
  late String sourceId;
  late SourceType sourceType;
  final ScrollController scrollController = ScrollController();
  final SourceRepository sourceRepository = SourceRepository();
  final Rx<Source> _source = Source().obs;

  Source get source => _source.value;
  set source(Source value) => _source.value = value;

  final Rx<SourceMangaList> _sourceMangaList =
      SourceMangaList(mangaList: [], hasNextPage: true).obs;
  SourceMangaList get sourceMangaList => _sourceMangaList.value;
  set sourceMangaList(SourceMangaList value) => _sourceMangaList.value = value;

  final RxBool _isFirstPage = true.obs;

  bool get isFirstPage => _isFirstPage.value;
  set isFirstPage(bool value) => _isFirstPage.value = value;

  Future getNextPage({bool isRefresh = false}) async {
    if (!isRefresh) {
      if (sourceMangaList.hasNextPage ?? true) {
        final sourceMangaListTemp = await sourceRepository.getSourceMangaList(
            sourceType: sourceType, pageNum: _page, sourceId: sourceId);
        _page += 1;
        sourceMangaList.hasNextPage = sourceMangaListTemp?.hasNextPage ?? true;
        sourceMangaList.mangaList?.addAll(sourceMangaListTemp?.mangaList ?? []);
        _sourceMangaList.refresh();
        isFirstPage = false;
      }
    } else {
      isFirstPage = true;
      _page = 1;
      sourceMangaList = (await sourceRepository.getSourceMangaList(
              sourceType: sourceType, pageNum: _page, sourceId: sourceId)) ??
          sourceMangaList;
      _page += 1;
      isFirstPage = false;
    }
  }

  @override
  void onInit() {
    sourceId = Get.parameters['sourceId']!;
    sourceType = Get.parameters['sourceType']! == SourceType.latest.name
        ? SourceType.latest
        : SourceType.popular;
    super.onInit();
  }

  @override
  void onReady() async {
    source = await sourceRepository.getSource(sourceId: sourceId) ?? source;
    await getNextPage();
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
