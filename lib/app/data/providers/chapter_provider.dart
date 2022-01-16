import 'package:get/get.dart';

import '../chapter_model.dart';

class ChapterProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Chapter.fromJson(map);
      if (map is List) {
        return map.map((item) => Chapter.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Chapter?> getChapter(int id) async {
    final response = await get('chapter/$id');
    return response.body;
  }

  Future<Response<Chapter>> postChapter(Chapter chapter) async =>
      await post('chapter', chapter);
  Future<Response> deleteChapter(int id) async => await delete('chapter/$id');
}
