import 'package:get/get.dart';

import '../../../main.dart';
import '../../core/values/api_url.dart';
import '../enums/source_type.dart';
import '../source_manga_list_model.dart';
import '../source_model.dart';

class SourceProvider extends GetConnect {
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is List) return map.map((item) => Source.fromMap(item)).toList();
      if (map is Map<String, dynamic>) return Source.fromMap(map);
    };
    httpClient.baseUrl = _localStorageService.baseURL + sourceURL;
    httpClient.timeout = Duration(minutes: 5);
  }

  Future<List<Source>?> getSourceList() async {
    final response = await get('/list');
    if (response.hasError) return <Source>[];
    return response.body;
  }

  Future<Source?> getSource({required String sourceId}) async {
    final response = await get('/$sourceId');
    if (response.hasError) return Source();
    return response.body;
  }

  Future<SourceMangaList?> getSourceSearch(
      {required String sourceId,
      required String searchTerm,
      required int pageNum}) async {
    final response = await get<SourceMangaList>(
        "/$sourceId/search?searchTerm=$searchTerm&pageNum=$pageNum",
        decoder: (map) => SourceMangaList.fromMap(map));
    return response.body;
  }

  Future<SourceMangaList?> getSourceMangaList({
    required String sourceId,
    required int pageNum,
    required SourceType sourceType,
  }) async {
    final response = await get<SourceMangaList>(
        "/$sourceId/${sourceType.name}/$pageNum",
        decoder: (map) => SourceMangaList.fromMap(map));
    return response.body;
  }
}
