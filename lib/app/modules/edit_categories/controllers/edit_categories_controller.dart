import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import '../../../data/category_model.dart';
import '../../../data/repository/category_repository.dart';

class EditCategoriesController extends GetxController {
  //TODO: Implement EditCategoriesController
  final CategoryRepository _categoryRepository = CategoryRepository();
  final TextEditingController textEditingController = TextEditingController();
  final RxBool _defaultCategory = false.obs;
  final RxList<Category?> _categoryList = <Category>[].obs;
  List<Category?> get categoryList => _categoryList;

  set categoryList(List<Category?> categoryList) =>
      _categoryList.value = categoryList;

  bool get defaultCategory => _defaultCategory.value;

  set defaultCategory(bool value) => _defaultCategory.value = value;

  Future<void> editCategory({required Category category}) async {
    await _categoryRepository.editCategory(category.copyWith(
        name: textEditingController.text, defaultCategory: defaultCategory));
    reloadCategoryList();
  }

  Future<void> createCategory() async {
    await _categoryRepository.createCategory(Category(
        name: textEditingController.text, defaultCategory: defaultCategory));
    reloadCategoryList();
  }

  Future<void> deleteCategory(int id) async {
    await _categoryRepository.deleteCategory(id);
    reloadCategoryList();
  }

  Future reloadCategoryList() async {
    List categoryListJson = (await _categoryRepository.getCategoryList());
    categoryListJson.removeAt(0);
    categoryList =
        (categoryListJson.map<Category>((e) => Category.fromJson(e)).toList());
  }

  Future<void> reorder({required int from, required int to}) async {
    if (from < to) to -= 1;
    final Category? item = categoryList.removeAt(from);
    categoryList.insert(to, item);
    await _categoryRepository.reorderCategory(from: from + 1, to: to + 1);
    reloadCategoryList();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    reloadCategoryList();
    super.onReady();
  }

  @override
  void onClose() {}
}
