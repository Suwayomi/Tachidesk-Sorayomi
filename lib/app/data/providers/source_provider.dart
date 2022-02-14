import 'package:get/get.dart';

import '../../../main.dart';
import '../../core/constants/api_url.dart';
import '../../core/enums/source_type.dart';
import '../source_manga_list_model.dart';
import '../source_model.dart';

class SourceProvider extends GetConnect {
  SourceProvider() : super(timeout: Duration(minutes: 1));
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Source.fromJson(map);
      if (map is List) return map.map((item) => Source.fromJson(item)).toList();
    };
    httpClient.baseUrl = _localStorageService.baseURL + sourceURL;
  }

  Future<List<Source>?> getSourceList() async {
    final response = await get<List<Source>>(
        _localStorageService.baseURL + sourceURL + '/list',
        decoder: (map) =>
            map.map<Source>((item) => Source.fromJson(item)).toList());
    return response.body;
  }

  Future<Source?> getSource({required String sourceId}) async {
    final response = await get<Source>(
        _localStorageService.baseURL + sourceURL + '/$sourceId',
        decoder: (map) => Source.fromMap(map));
    return response.body;
  }

  Future<SourceMangaList?> getSourceSearch(
      {required String sourceId,
      required String searchTerm,
      required int pageNum}) async {
    final response = await get<SourceMangaList>(
        _localStorageService.baseURL +
            sourceURL +
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
        _localStorageService.baseURL +
            sourceURL +
            "/$sourceId/${sourceType.name}/$pageNum",
        decoder: (map) => SourceMangaList.fromMap(map));
    return response.body;
  }

  Future<Response<Source>> postSource(Source source) async =>
      await post('source', source);
  Future<Response> deleteSource(int id) async => await delete('source/$id');
}
