import 'package:get/get.dart';

import '../manga_model.dart';

class MangaProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Manga.fromJson(map);
      if (map is List) return map.map((item) => Manga.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Manga?> getManga(int id) async {
    final response = await get('manga/$id');
    return response.body;
  }

  Future<Response<Manga>> postManga(Manga manga) async =>
      await post('manga', manga);
  Future<Response> deleteManga(int id) async => await delete('manga/$id');
}
