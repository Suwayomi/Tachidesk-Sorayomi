import 'package:get/get.dart';

import '../../../main.dart';
import '../../core/constants/api_url.dart';
import '../manga_model.dart';

class MangaProvider extends GetConnect {
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Manga.fromJson(map);
      if (map is List) return map.map((item) => Manga.fromJson(item)).toList();
    };
    httpClient.baseUrl = _localStorageService.baseURL + mangaUrl;
  }

  Future<Manga?> getManga(int id, {bool fetchFreshData = true}) async {
    final response = await get(
      _localStorageService.baseURL +
          mangaUrl +
          '/$id/?onlineFetch=$fetchFreshData',
      decoder: (data) => Manga.fromMap(data),
    );
    return response.body;
  }

  Future addMangaToLibrary(int id) async {
    final response = await get(
      _localStorageService.baseURL + mangaUrl + '/$id/library',
    );
    return response.body;
  }

  Future removeMangaFromLibrary(int id) async {
    final response = await delete(
      _localStorageService.baseURL + mangaUrl + '/$id/library',
    );
    return response.body;
  }

  Future<Response<Manga>> postManga(Manga manga) async =>
      await post('manga', manga);
  Future<Response> deleteManga(int id) async => await delete('manga/$id');
}
