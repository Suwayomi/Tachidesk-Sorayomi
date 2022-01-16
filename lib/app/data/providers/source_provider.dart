import 'package:get/get.dart';
import 'package:tachidesk_flutter/app/core/constants/api_url.dart';
import 'package:tachidesk_flutter/main.dart';

import '../source_model.dart';

class SourceProvider extends GetConnect {
  final LocalStorageService _localStorageService = Get.find<LocalStorageService>();
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

  Future<Response<Source>> postSource(Source source) async =>
      await post('source', source);
  Future<Response> deleteSource(int id) async => await delete('source/$id');
}
