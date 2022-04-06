import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../../core/values/api_url.dart';
import '../services/local_storage_service.dart';

class DownloadQueueValueProvider extends GetConnect {
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();

  @override
  void onInit() {
    httpClient.baseUrl = _localStorageService.baseURL + downloadURL;
    httpClient.timeout = Duration(minutes: 5);
    httpClient.addAuthenticator((Request request) async {
      final token = _localStorageService.basicAuth;
      // Set the header
      request.headers['Authorization'] = token;
      return request;
    });
  }

  Future<Response> startDownload(
          {required int mangaId, required int chapterIndex}) async =>
      await get("/$mangaId/chapter/$chapterIndex");

  // Future<Response> deleteDownload(
  //         {required int mangaId, required int chapterIndex}) =>
  //     delete(_localStorageService.baseURL +
  //         mangaUrl +
  //         "/$mangaId/chapter/$chapterIndex");

  Future<Response> deleteFromDownloadQueue(
          {required int mangaId, required int chapterIndex}) =>
      delete("/$mangaId/chapter/$chapterIndex");
}
