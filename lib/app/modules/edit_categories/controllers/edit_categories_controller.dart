import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/category_model.dart';
import '../../library/controllers/library_controller.dart';
import '../repository/edit_categories_repository.dart';

class EditCategoriesController extends GetxController {
  final EditCategoriesRepository repository = EditCategoriesRepository();
  final TextEditingController textEditingController = TextEditingController();
  final RxBool _defaultCategory = false.obs;
  final RxList<Category?> _categoryList = <Category>[].obs;
  List<Category?> get categoryList => _categoryList;
  set categoryList(List<Category?> categoryList) =>
      _categoryList.value = categoryList;

  bool get defaultCategory => _defaultCategory.value;

  set defaultCategory(bool value) => _defaultCategory.value = value;

  Future<void> editCategory({required Category category}) async {
    await repository.editCategory(category.copyWith(
        name: textEditingController.text, defaultCategory: defaultCategory));
    reloadCategoryList();
  }

  Future<void> createCategory() async {
    await repository.createCategory(Category(
        name: textEditingController.text, defaultCategory: defaultCategory));
    reloadCategoryList();
  }

  Future<void> deleteCategory(int id) async {
    await repository.deleteCategory(id);
    reloadCategoryList();
  }

  Future<void> reloadCategoryList() async {
    List<Category> categoryListTemp = (await repository.getCategoryList());
    if (categoryListTemp.isNotEmpty) {
      categoryListTemp.removeAt(0);
    }
    categoryList = categoryListTemp;
    Get.find<LibraryController>().loadCategoryList();
  }

  Future<void> reorder({required int from, required int to}) async {
    if (from < to) to -= 1;
    final Category? item = categoryList.removeAt(from);
    categoryList.insert(to, item);
    await repository.reorderCategory(from: from + 1, to: to + 1);
    reloadCategoryList();
  }

  @override
  void onReady() async {
    reloadCategoryList();
    super.onReady();
  }
}
