import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../../core/values/api_url.dart';
import '../chapter_model.dart';
import '../services/local_storage_service.dart';

class ChapterProvider extends GetConnect {
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is List) {
        return map.map((item) => Chapter.fromMap(item)).toList();
      }
      if (map is Map<String, dynamic>) return Chapter.fromMap(map);
    };
    httpClient.baseUrl = _localStorageService.baseURL + mangaUrl;
    httpClient.timeout = Duration(minutes: 5);
    httpClient.addAuthenticator((Request request) async {
      final token = _localStorageService.basicAuth;
      // Set the header
      request.headers['Authorization'] = token;
      return request;
    });
  }

  Future<List<Chapter>?> getChaptersList(int mangaId,
      {bool onlineFetch = false}) async {
    Response response = await get(
      '/$mangaId/chapters?onlineFetch=$onlineFetch',
    );
    if (response.hasError) return <Chapter>[];
    return response.body;
  }

  Future<Chapter?> getChapter(
      {required int mangaId, required int chapterIndex}) async {
    final response = await get(
      '/$mangaId/chapter/$chapterIndex',
    );
    if (response.hasError) return null;
    return response.body;
  }

  String getChapterPageUrl(
      {required int mangaId, required int chapterIndex, required int page}) {
    return httpClient.baseUrl! +
        '/$mangaId/chapter/$chapterIndex/page/$page?useCache=true';
  }

  Future<Response> patchChapter(
          int mangaId, int chapterIndex, Map<String, dynamic> formdata) async =>
      await patch('/$mangaId/chapter/$chapterIndex', FormData(formdata));

  // Future<Response> deleteChapter(int id) async => await delete('chapter/$id');

  Future<Response> deletedownloadedChapter({
    required int mangaId,
    required int chapterIndex,
  }) =>
      delete("/$mangaId/chapter/$chapterIndex");
}
