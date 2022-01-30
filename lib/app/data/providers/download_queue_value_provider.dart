import 'package:get/get.dart';

import '../../../main.dart';
import '../../core/constants/api_url.dart';

class DownloadQueueValueProvider extends GetConnect {
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();

  Future<Response> startDownload(
          {required int mangaId, required int chapterIndex}) async =>
      await get(_localStorageService.baseURL +
          downloadURL +
          "/$mangaId/chapter/$chapterIndex");

  Future<Response> deleteDownload(
          {required int mangaId, required int chapterIndex}) =>
      delete(_localStorageService.baseURL +
          mangaUrl +
          "/$mangaId/chapter/$chapterIndex");

  Future<Response> deleteFromDownloadQueue(
          {required int mangaId, required int chapterIndex}) =>
      delete(_localStorageService.baseURL +
          downloadURL +
          "/$mangaId/chapter/$chapterIndex");
}
