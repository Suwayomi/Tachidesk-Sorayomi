import 'package:get/get.dart';

import '../../../data/chapter_model.dart';
import '../../../data/providers/download_queue_value_provider.dart';
import '../../../data/providers/downloads_provider.dart';

class DownloadsRepository {
  final DownloadQueueValueProvider _downloadQueueValueProvider =
      Get.put(DownloadQueueValueProvider());

  final DownloadsProvider _downloadsProvider = Get.put(DownloadsProvider());

  Future<Response> deleteFromDownloadQueue(Chapter chapter) =>
      _downloadQueueValueProvider.deleteFromDownloadQueue(
        mangaId: chapter.mangaId!,
        chapterIndex: chapter.index!,
      );

  Future<Response> startDownloads() => _downloadsProvider.startDownloads();
  Future<Response> stopDownloads() => _downloadsProvider.stopDownloads();
  GetSocket socketDownloads() => _downloadsProvider.socketDownloads();
}
