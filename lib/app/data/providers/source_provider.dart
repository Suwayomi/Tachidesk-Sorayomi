import 'dart:convert';

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
    var oldSourceFilter = await getSourceFilter(sourceId: sourceId);
    for (int i = 0; i < sourceFilter.length; i++) {
      if (jsonEncode(oldSourceFilter[i]) == jsonEncode(sourceFilter[i])) {
        continue;
      }
      if (sourceFilter[i]["type"] == "Group") {
        for (int j = 0;
            j < (sourceFilter[i]["filter"]["state"] as List).length;
            j++) {
          if (jsonEncode(oldSourceFilter[i]["filter"]["state"][j]) ==
              jsonEncode(sourceFilter[i]["filter"]["state"][j])) continue;
          filter.add(({
            "position": i,
            "state": jsonEncode({
              "position": j,
              "state": sourceFilter[i]["filter"]["state"][j]["type"] == "Text"
                  ? sourceFilter[i]["filter"]["state"][j]["filter"]["state"]
                  : jsonEncode(
                      sourceFilter[i]["filter"]["state"][j]["filter"]["state"]),
            })
          }));
        }
      } else {
        filter.add(({
          "position": i,
          "state": sourceFilter[i]["type"] == "Text"
              ? sourceFilter[i]["filter"]["state"]
              : jsonEncode(sourceFilter[i]["filter"]["state"]),
        }));
      }
    }
    //TODO NEED to Fix (Send request as list insted of spamming)
    //after version 0.6.2
    for (var i in filter) {
      await post('/$sourceId/filters', jsonEncode(i));
    }
  }

  Future<Map<String, dynamic>?> getSourceMangaList({
    required String sourceId,
    required int pageNum,
    SourceType sourceType = SourceType.popular,
    String? query,
    bool isFilter = false,
  }) async {
    final response = await get<Map<String, dynamic>?>(
      "/$sourceId/" +
          (((query != null && query.isNotEmpty) || isFilter)
              ? 'search?pageNum=$pageNum&searchTerm=' + (query ?? "")
              : (sourceType.name + "/$pageNum")),
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
