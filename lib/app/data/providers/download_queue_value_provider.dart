import 'package:get/get.dart';

import '../../../main.dart';

class DownloadQueueValueProvider extends GetConnect {
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();

  Future<Response> startDownload(
          {required int mangaId, required int chapterIndex}) async =>
      await get(_localStorageService.baseURL +
          "/api/v1/download/$mangaId/chapter/$chapterIndex");

  Future<Response> deleteDownload(
          {required int mangaId, required int chapterIndex}) =>
      delete(_localStorageService.baseURL +
          "/api/v1/manga/$mangaId/chapter/$chapterIndex");
}
