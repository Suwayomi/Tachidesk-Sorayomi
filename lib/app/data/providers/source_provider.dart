import 'package:get/get.dart';

import '../../../main.dart';
import '../../core/values/api_url.dart';
import '../enums/source_type.dart';
import '../manga_model.dart';
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

  Future<List<Map<String, dynamic>>> getSourceFilter(
      {required String sourceId, bool isReset = false}) async {
    final response =
        await get('/$sourceId/filters?reset=$isReset', decoder: ((map) {
      if (map is List) {
        return map.map((item) => item as Map<String, dynamic>).toList();
      }
      return <Map<String, dynamic>>[];
    }));
    if (response.hasError) return [];
    return response.body ?? [];
  }

  Future<void> postSourceFilter({
    required String sourceId,
    required List<Map<String, dynamic>> sourceFilter,
  }) async {
    List<Map<String, dynamic>> filter = [];
    for (int i = 0; i < sourceFilter.length; i++) {
      if (sourceFilter[i]["type"] == "Group") {
        for (int j = 0;
            j < (sourceFilter[i]["filter"]["state"] as List).length;
            j++) {
          filter.add(({
            "position": i,
            "state": {
              "position": j,
              "state": sourceFilter[i]["filter"]["state"][j]["filter"]["state"],
            }
          }));
        }
      } else {
        filter.add(({
          "position": i,
          "state": sourceFilter[i]["filter"]["state"],
        }));
      }
    }

    Response response = (await post('/$sourceId/filters', (filter)));
    print(response.statusCode);
  }

  Future<Map<String, dynamic>?> getSourceSearch(
      {required String sourceId,
      required String searchTerm,
      required int pageNum}) async {
    final response = await get<Map<String, dynamic>?>(
      "/$sourceId/search?searchTerm=$searchTerm&pageNum=$pageNum",
      decoder: (map) {
        if (map is Map<String, dynamic>) {
          return {
            "hasNextPage": map['hasNextPage'],
            "mangaList": map['mangaList'] != null
                ? List<Manga>.from(
                    map['mangaList']?.map((x) => Manga.fromMap(x)))
                : null,
          };
        }
        return null;
      },
    );
    if (response.hasError) return {"hasNextPage": true, "mangaList": <Manga>[]};

    return response.body;
  }

  Future<Map<String, dynamic>?> getSourceMangaList({
    required String sourceId,
    required int pageNum,
    required SourceType sourceType,
  }) async {
    final response = await get<Map<String, dynamic>?>(
      "/$sourceId/${sourceType.name}/$pageNum",
      decoder: (map) {
        if (map is Map<String, dynamic>) {
          return {
            "hasNextPage": map['hasNextPage'],
            "mangaList": map['mangaList'] != null
                ? List<Manga>.from(
                    map['mangaList']?.map((x) => Manga.fromMap(x)))
                : null,
          };
        }
        return null;
      },
    );
    if (response.hasError) return {"hasNextPage": true, "mangaList": []};
    return response.body;
  }
}
