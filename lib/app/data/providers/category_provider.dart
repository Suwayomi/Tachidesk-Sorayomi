import 'package:get/get.dart';

import '../../../main.dart';
import '../../core/constants/api_url.dart';
import '../manga_model.dart';

class CategoryProvider extends GetConnect {
  CategoryProvider() : super(timeout: Duration(minutes: 1));
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();

  Future getCategoryList() async {
    final response = await get(_localStorageService.baseURL + categoryURL);
    return response.body;
  }

  Future<List<Manga>> getMangaListFromCategoryId(int id) async {
    final response = await get(
        _localStorageService.baseURL + categoryURL + "/$id",
        decoder: (map) =>
            map.map<Manga>((item) => Manga.fromJson(item)).toList());
    return response.body;
  }

  Future<Response> postCategory({
    required String name,
    required bool defaultCategory,
  }) async {
    return await post(
        _localStorageService.baseURL + categoryURL,
        FormData({
          "name": name,
          "default": defaultCategory,
        }));
  }

  Future<Response> patchCategory({
    required int id,
    required String name,
    required bool defaultCategory,
  }) async {
    return await patch(
        _localStorageService.baseURL + categoryURL + "/$id",
        FormData({
          "name": name,
          "default": defaultCategory,
        }));
  }

  Future<Response> deleteCategory(int id) async {
    return await delete(_localStorageService.baseURL + categoryURL + '/$id');
  }

  Future<Response> reorderCategory({required int from, required int to}) {
    return patch(
      _localStorageService.baseURL + reorderURL,
      FormData({'from': from, 'to': to}),
    );
  }
}
