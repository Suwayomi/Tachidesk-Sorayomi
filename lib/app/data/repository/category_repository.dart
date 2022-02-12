import 'package:get/get.dart';

import '../category_model.dart';
import '../manga_model.dart';
import '../providers/category_provider.dart';

class CategoryRepository {
  static final CategoryProvider _categoryProvider = CategoryProvider();

  static Future getCategoryList() {
    return _categoryProvider.getCategoryList();
  }

  static Future<List<Manga>> getMangaListFromCategoryId(int id) {
    return _categoryProvider.getMangaListFromCategoryId(id);
  }

  static Future<Response> editCategory(Category category) {
    return _categoryProvider.patchCategory(
      id: category.id!,
      defaultCategory: category.defaultCategory!,
      name: category.name!,
    );
  }

  static Future<Response> createCategory(Category category) {
    return _categoryProvider.postCategory(
      name: category.name!,
      defaultCategory: category.defaultCategory!,
    );
  }

  static Future<Response> deleteCategory(int id) {
    return _categoryProvider.deleteCategory(id);
  }

  static Future<Response> reorderCategory({required int from, required int to}) {
    return _categoryProvider.reorderCategory(from: from, to: to);
  }
}
