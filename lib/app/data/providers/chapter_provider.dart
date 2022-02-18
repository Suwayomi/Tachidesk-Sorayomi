import 'package:get/get.dart';

import '../../../main.dart';
import '../../core/constants/api_url.dart';
import '../chapter_model.dart';

class ChapterProvider extends GetConnect {
  ChapterProvider() : super(timeout: Duration(minutes: 1));
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();

  Future<List<Chapter>?> getChaptersList(int mangaId,
      {bool onlineFetch = false}) async {
    Response response = await get(
        _localStorageService.baseURL + mangaUrl + '/$mangaId/chapters',
        decoder: (map) =>
            map.map<Chapter>((item) => Chapter.fromJson(item)).toList());
    return response.body;
  }

  Future<Chapter?> getChapter(
      {required int mangaId, required int chapterIndex}) async {
    final response = await get(
      _localStorageService.baseURL +
          mangaUrl +
          '/$mangaId/chapter/$chapterIndex',
      decoder: (data) => Chapter.fromMap(data),
    );
    return response.body;
  }

  String getChapterPage(
      {required int mangaId, required int chapterIndex, required int page}) {
    return _localStorageService.baseURL +
        mangaUrl +
        '/$mangaId/chapter/$chapterIndex/page/$page?useCache=true';
  }

  Future<Response<Chapter>> patchChapter(
          int mangaId, int chapterIndex, Map<String, dynamic> formdata) async =>
      await patch(
          _localStorageService.baseURL +
              mangaUrl +
              '/$mangaId/chapter/$chapterIndex',
          FormData(formdata));
  Future<Response> deleteChapter(int id) async => await delete('chapter/$id');
}
