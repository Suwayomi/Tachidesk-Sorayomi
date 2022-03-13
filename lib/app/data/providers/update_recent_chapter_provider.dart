import 'package:get/get.dart';

import '../../../main.dart';
import '../../core/values/api_url.dart';
import '../update_recent_chapter_model.dart';

class UpdateRecentChapterProvider extends GetConnect {
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is List) {
        return map.map((item) => UpdateRecentChapter.fromMap(item)).toList();
      }
      if (map is Map<String, dynamic>) return UpdateRecentChapter.fromMap(map);
    };
    httpClient.baseUrl = _localStorageService.baseURL + updateRecentChapterUrl;
    httpClient.timeout = Duration(minutes: 5);
  }

  Future<UpdateRecentChapter> getUpdateRecentChapter(int id) async {
    final response = await get('/$id');
    if (response.hasError) return UpdateRecentChapter();
    return response.body;
  }

  // Future<Response<UpdateRecentChapter>> postUpdateRecentChapter(
  //         UpdateRecentChapter updaterecentchapter) async =>
  //     await post('updaterecentchapter', updaterecentchapter);
  // Future<Response> deleteUpdateRecentChapter(int id) async =>
  //     await delete('updaterecentchapter/$id');
}
