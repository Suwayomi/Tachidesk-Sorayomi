import 'package:get/get.dart';

import '../../../main.dart';
import '../../core/values/api_url.dart';

class DownloadQueueValueProvider extends GetConnect {
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();

  @override
  void onInit() {
    httpClient.baseUrl = _localStorageService.baseURL + downloadURL;
    httpClient.timeout = Duration(minutes: 5);
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
