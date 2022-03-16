import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tachidesk_sorayomi/app/data/manga_filter_model.dart';

import '../../../../main.dart';
import '../../../data/category_model.dart';
import '../../../data/manga_model.dart';
import '../../home/controllers/home_controller.dart';
import '../repository/library_repository.dart';

class LibraryController extends GetxController {
  final LibraryRepository repository = LibraryRepository();
  final TextEditingController textEditingController = TextEditingController();
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();
  final ScrollController scrollController = ScrollController();
  final RxInt tabIndex = 0.obs;
  final Rx<MangaFilter> _mangaFilter = MangaFilter(sortTitle: true).obs;

  void mangaFilterUpdate(void Function(MangaFilter?) fn) =>
      _mangaFilter.update(fn);
  MangaFilter get mangaFilter => _mangaFilter.value;
  set mangaFilter(MangaFilter value) => _mangaFilter.value = value;

  final RxBool _isSearching = false.obs;
  bool get isSearching => _isSearching.value;
  set isSearching(bool value) => _isSearching.value = value;

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  final RxBool _isCategoryLoading = false.obs;
  bool get isCategoryLoading => _isCategoryLoading.value;
  set isCategoryLoading(bool value) => _isCategoryLoading.value = value;

  final RxList<Category?> _categoryList = <Category>[].obs;
  List<Category?> get categoryList => _categoryList;
  set categoryList(List<Category?> categoryList) =>
      _categoryList.value = categoryList;
  int get categoryListLength => _categoryList.length;

  final RxList<Manga> _mangaList = <Manga>[].obs;
  List<Manga> get mangaList => _mangaList;
  set mangaList(List<Manga> mangaList) => _mangaList.value = mangaList;
  int get mangaListLength => _mangaList.length;
  List<Manga> mangaListCopy = [];

  Future<void> loadCategoryList() async {
    isCategoryLoading = true;
    categoryList = (await repository.getCategoryList());
    isCategoryLoading = false;
  }

  Future<void> loadMangaListWithCategoryId() async {
    isLoading = true;
    if (categoryList.isEmpty) return;
    mangaListCopy = await repository
        .getMangaListFromCategoryId(categoryList[tabIndex.value]!.id!);
    applyFilter();
    isLoading = false;
  }

  void applyFilter() {
    mangaList = mangaListCopy
        .where((element) =>
            (element.title ?? "")
                .toLowerCase()
                .contains(textEditingController.text.toLowerCase()) &&
            mangaFilter.applyFilter(element))
        .toList()
      ..sort((a, b) => mangaFilter.applySort(a, b));
    print(mangaList);
  }

  Future<void> refreshLibraryScreen() async {
    await loadCategoryList();
    await loadMangaListWithCategoryId();
  }

  @override
  void onReady() async {
    mangaFilter = _localStorageService.mangaFilter;
    _mangaFilter.listen((val) async {
      applyFilter();
      await _localStorageService.setMangeFilter(val);
    });
    textEditingController.addListener(() => applyFilter());
    await refreshLibraryScreen();

    Get.find<HomeController>().selectedIndexObs.listen((value) async {
      tabIndex.value = 0;
      if (value.isEqual(0)) await refreshLibraryScreen();
    });
    super.onReady();
  }
}
