import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../data/enums/source_type.dart';
import '../../../data/manga_list_model.dart';
import '../../../data/manga_model.dart';
import '../../../data/source_model.dart';
import '../repository/source_manga_repository.dart';

class SourceMangaController extends GetxController {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  final PagingController<int, Manga> pagingController =
      PagingController(firstPageKey: 1);
  final TextEditingController textEditingController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  final SourceMangaRepository repository = SourceMangaRepository();

  bool _isFilter = false;
  late String sourceId;
  late SourceType sourceType;

  final RxList<Map<String, dynamic>> _sourceMangaFilterList =
      <Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get sourceMangaFilterList =>
      _sourceMangaFilterList;
  set sourceMangaFilterList(List<Map<String, dynamic>> value) =>
      _sourceMangaFilterList.value = value;
  void sourceMangaFilterListRefresh() => _sourceMangaFilterList.refresh();

  final RxBool _isSearching = false.obs;
  bool get isSearching => _isSearching.value;
  set isSearching(bool value) => _isSearching.value = value;

  final Rx<Source> _source = Source().obs;
  Source get source => _source.value;
  set source(Source value) => _source.value = value;

  final RxBool _isFirstPage = true.obs;

  bool get isFirstPage => _isFirstPage.value;
  set isFirstPage(bool value) => _isFirstPage.value = value;

  Future<void> getNextPage(int pageKey, bool isFilter) async {
    MangaListModel? sourceMangaListTemp = await repository.getSourceMangaList(
      sourceType: sourceType,
      pageNum: pageKey,
      sourceId: sourceId,
      isFilter: isFilter,
    );
    if (sourceMangaListTemp != null) {
      if (sourceMangaListTemp.hasNextPage ?? false) {
        try {
          pagingController.appendPage(
              sourceMangaListTemp.mangaList ?? [], pageKey + 1);
        } catch (e) {
          pagingController.appendPage(<Manga>[], pageKey + 1);
        }
      } else {
        pagingController.appendLastPage(sourceMangaListTemp.mangaList ?? []);
      }
    }
  }

  Future<void> getFilter([bool isReset = false]) async {
    sourceMangaFilterList = await repository.getSourceFilter(
      sourceId: sourceId,
      isReset: isReset,
    );
  }

  Future<void> applyFilter() async {
    await repository.postSourceFilter(
      sourceId: sourceId,
      filter: sourceMangaFilterList,
    );
    _isFilter = true;
    pagingController.refresh();
  }

  @override
  void onInit() {
    sourceId = Get.parameters['sourceId']!;
    sourceType = Get.parameters['sourceType']! == SourceType.latest.name
        ? SourceType.latest
        : SourceType.popular;
    pagingController.addPageRequestListener((pageKey) {
      getNextPage(pageKey, _isFilter);
    });
    super.onInit();
  }

  @override
  void onReady() async {
    getFilter();
    source = await repository.getSource(sourceId: sourceId) ?? source;
    super.onReady();
  }

  @override
  void onClose() {}
}
