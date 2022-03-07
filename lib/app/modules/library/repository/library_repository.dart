import 'package:get/get.dart';

import '../../../data/category_model.dart';
import '../../../data/manga_model.dart';
import '../../../data/providers/category_provider.dart';

class LibraryRepository {
  final CategoryProvider _categoryProvider = Get.put(CategoryProvider());

  Future<List<Category>> getCategoryList() async =>
      _categoryProvider.getCategoryList();

  Future<List<Manga>> getMangaListFromCategoryId(int id) =>
      _categoryProvider.getMangaListFromCategoryId(id);
}
