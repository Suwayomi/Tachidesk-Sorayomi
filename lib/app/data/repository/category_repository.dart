import 'package:get/get.dart';

import '../category_model.dart';
import '../manga_model.dart';
import '../providers/category_provider.dart';

class CategoryRepository {
  static final CategoryProvider _categoryProvider = CategoryProvider();

  Future getCategoryList() {
    return _categoryProvider.getCategoryList();
  }

  Future<List<Manga>> getMangaListFromCategoryId(int id) {
    return _categoryProvider.getMangaListFromCategoryId(id);
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
