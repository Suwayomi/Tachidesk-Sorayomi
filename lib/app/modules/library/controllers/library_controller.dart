import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/category_model.dart';
import '../../../data/manga_model.dart';
import '../../../data/repository/category_repository.dart';
import '../../home/controllers/home_controller.dart';

class LibraryController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  final RxInt tabIndex = 0.obs;

  final RxBool _isSearching = false.obs;
  bool get isSearching => _isSearching.value;
  set isSearching(bool value) => _isSearching.value = value;

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  final RxList<Category?> _categoryList = <Category>[].obs;
  List<Category?> get categoryList => _categoryList;
  set categoryList(List<Category?> categoryList) =>
      _categoryList.value = categoryList;
  int get categoryListLength => _categoryList.length;

  final RxList<Manga> _mangaList = <Manga>[].obs;
  List<Manga> get mangaList => _mangaList;
  set mangaList(List<Manga> mangaList) => _mangaList.value = mangaList;
  int get mangaListLength => _mangaList.length;

  Future loadCategoryList() async {
    List categoryListJson = (await CategoryRepository.getCategoryList());
    categoryList =
        (categoryListJson.map<Category>((e) => Category.fromJson(e)).toList());
  }

  Future loadMangaListWithCategoryId() async {
    isLoading = true;
    if (textEditingController.text.isNotEmpty) {
      mangaList = (await CategoryRepository.getMangaListFromCategoryId(
              categoryList[tabIndex.value]!.id!))
          .where((element) => (element.title ?? "")
              .toLowerCase()
              .contains(textEditingController.text.toLowerCase()))
          .toList();
    } else {
      if (categoryList.isNotEmpty) {
        mangaList = (await CategoryRepository.getMangaListFromCategoryId(
            categoryList[tabIndex.value]!.id!));
      }
    }
    isLoading = false;
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() async {
    await loadCategoryList();
    await loadMangaListWithCategoryId();
    textEditingController.addListener(
      () => loadMangaListWithCategoryId(),
    );
    Get.find<HomeController>().selectedIndexObs.listen((value) {
      tabIndex.value = 0;
      if (value.isEqual(0)) loadMangaListWithCategoryId();
    });
    super.onReady();
  }

  @override
  void onClose() {}
}
