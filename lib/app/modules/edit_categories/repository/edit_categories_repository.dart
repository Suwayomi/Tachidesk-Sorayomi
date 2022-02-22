import 'package:get/get.dart';

import '../../../data/category_model.dart';
import '../../../data/providers/category_provider.dart';

class EditCategoriesRepository {
  final CategoryProvider _categoryProvider = Get.put(CategoryProvider());

  Future<List<Category>> getCategoryList() {
    return _categoryProvider.getCategoryList();
  }

  Future<Response> editCategory(Category category) {
    return _categoryProvider.patchCategory(
      id: category.id!,
      defaultCategory: category.defaultCategory!,
      name: category.name!,
    );
  }

  Future<Response> createCategory(Category category) {
    return _categoryProvider.postCategory(
      name: category.name!,
      defaultCategory: category.defaultCategory!,
    );
  }

  Future<Response> deleteCategory(int id) {
    return _categoryProvider.deleteCategory(id);
  }

  Future<Response> reorderCategory({required int from, required int to}) {
    return _categoryProvider.reorderCategory(from: from, to: to);
  }
}
