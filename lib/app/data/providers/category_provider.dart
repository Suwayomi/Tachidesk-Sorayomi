import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../../core/values/api_url.dart';
import '../category_model.dart';
import '../enums/auth_type.dart';
import '../manga_model.dart';
import '../services/local_storage_service.dart';

class CategoryProvider extends GetConnect {
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is List) {
        return map.map((item) => Category.fromMap(item)).toList();
      }
      if (map is Map<String, dynamic>) return Category.fromMap(map);
    };
    httpClient.baseUrl = _localStorageService.baseURL + categoryURL;
    httpClient.timeout = Duration(minutes: 5);
    httpClient.addRequestModifier((Request request) async {
      final token = _localStorageService.basicAuth;
      // Set the header
      if (_localStorageService.baseAuthType == AuthType.basic) {
        request.headers['Authorization'] = token;
      }
      return request;
    });
  }

  Future<List<Manga>> getMangaListFromCategoryId(int id) async {
    final response = await get("/$id", decoder: (map) {
      if (map is List) {
        return map.map<Manga>((item) => Manga.fromMap(item)).toList();
      }
    });
    return response.body ?? <Manga>[];
  }

  Future<List<Category>> getCategoryList() async {
    final response = await get("");
    if (response.hasError) return <Category>[];
    return response.body ?? <Category>[];
  }

  Future<Response> postCategory({
    required String name,
    required bool defaultCategory,
  }) async {
    return await post(
        "",
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
        "/$id",
        FormData({
          "name": name,
          "default": defaultCategory,
        }));
  }

  Future<Response> deleteCategory(int id) async {
    return await delete('/$id');
  }

  Future<Response> reorderCategory({required int from, required int to}) {
    return patch(
      reorderURL,
      FormData({'from': from, 'to': to}),
    );
  }
}
