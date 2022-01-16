import 'package:get/get.dart';

import '../../../main.dart';
import '../../core/constants/api_url.dart';

class CategoryProvider extends GetConnect {
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();

  Future getCategoryList() async {
    final response = await get(_localStorageService.baseURL + categoryListURL);
    return response.body;
  }

  Future<Response> postCategory({
    required String name,
    required bool defaultCategory,
  }) async {
    return await post(
        _localStorageService.baseURL + categoryListURL,
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
        _localStorageService.baseURL + categoryListURL + "/$id",
        FormData({
          "name": name,
          "default": defaultCategory,
        }));
  }

  Future<Response> deleteCategory(int id) async {
    return await delete(_localStorageService.baseURL + categoryListURL + '/$id');
  }

  Future<Response> reorderCategory({required int from, required int to}) {
    return patch(
      _localStorageService.baseURL + reorderURL,
      FormData({'from': from, 'to': to}),
    );
  }
}
