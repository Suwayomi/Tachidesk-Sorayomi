import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/utils/manga/apply_manga_filter.dart';
import '../../../core/utils/manga/apply_manga_sort.dart';
import '../../../data/category_model.dart';
import '../../../data/enums/manga/manga_filter.dart';
import '../../../data/enums/manga/manga_sort.dart';
import '../../../data/manga_model.dart';
import '../../../data/services/local_storage_service.dart';
import '../../home/controllers/home_controller.dart';
import '../repository/library_repository.dart';

class LibraryController extends GetxController
    with GetTickerProviderStateMixin {
  final LibraryRepository repository = LibraryRepository();
  final TextEditingController textEditingController = TextEditingController();
  late TabController tabController;
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();
  final ScrollController scrollController = ScrollController();

  final RxMap<MangaFilter, bool?> _mangaFilter = <MangaFilter, bool?>{
    for (var element in MangaFilter.values) element: null
  }.obs;
  Map<MangaFilter, bool?> get mangaFilter => _mangaFilter;
  set mangaFilter(Map<MangaFilter, bool?> value) => _mangaFilter.value = value;

  final Rx<MapEntry<MangaSort, bool>> _mangaSort =
      MapEntry(MangaSort.id, true).obs;
  MapEntry<MangaSort, bool> get mangaSort => _mangaSort.value;
  set mangaSort(MapEntry<MangaSort, bool> value) => _mangaSort.value = value;

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

  // final RxList<Manga> _mangaList = <Manga>[].obs;
  // List<Manga> get mangaList => _mangaList;
  // set mangaList(List<Manga> mangaList) => _mangaList.value = mangaList;
  // int get mangaListLength => _mangaList.length;

  final RxMap<int, List<Manga>> categoryMangaMap = <int, List<Manga>>{}.obs;
  Map<int, List<Manga>> categoryMangaMapCopy = <int, List<Manga>>{};

  Future<void> loadCategoryList() async {
    isCategoryLoading = true;
    categoryList = (await repository.getCategoryList());
    for (int i = 0; i < (categoryList.length); i++) {
      categoryMangaMap[i] = <Manga>[];
    }
    isCategoryLoading = false;
  }

  Future<void> loadMangaListWithCategoryId() async {
    isLoading = true;
    if (categoryList.isEmpty) return;
    categoryMangaMapCopy[tabController.index] = await repository
        .getMangaListFromCategoryId(categoryList[tabController.index]!.id!);
    applyFilter();
    isLoading = false;
  }

  void applyFilter() {
    categoryMangaMap[tabController.index] =
        (categoryMangaMapCopy[tabController.index]
                ?.where((element) =>
                    (element.title ?? "")
                        .toLowerCase()
                        .contains(textEditingController.text.toLowerCase()) &&
                    applyMangaFilter(mangaFilter, element))
                .toList() ??
            [])
          ..sort((a, b) => applyMangaSort(mangaSort, a, b));
  }

  Future<void> refreshLibraryScreen() async {
    await loadCategoryList();
    await loadMangaListWithCategoryId();
  }

  @override
  void onInit() {
    tabController = TabController(
      length: categoryListLength,
      vsync: this,
      animationDuration: Duration(),
    );
    super.onInit();
  }

  @override
  void onReady() async {
    _categoryList.listen((cat) {
      tabController = TabController(
        length: cat.length,
        vsync: this,
        animationDuration: Duration(),
      );
      tabController.addListener(() => loadMangaListWithCategoryId());
    });

    mangaFilter = _localStorageService.mangaFilter;
    mangaSort = _localStorageService.mangaSort;
    _mangaFilter.listen((val) async {
      applyFilter();
      await _localStorageService.setMangeFilter(val);
    });
    _mangaSort.listen((val) async {
      applyFilter();
      await _localStorageService.setMangeSort(val);
    });
    textEditingController.addListener(() => applyFilter());
    await refreshLibraryScreen();

    Get.find<HomeController>().selectedIndexObs.listen((value) async {
      if (value.isEqual(0)) {
        tabController.animateTo(0);
        await refreshLibraryScreen();
      }
    });
    super.onReady();
  }
}
