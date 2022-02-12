import 'package:get/get_connect.dart';

import '../chapter_model.dart';
import '../providers/download_queue_value_provider.dart';

class DownloadQueueValueRepository {
  static final DownloadQueueValueProvider _downloadQueueValueProvider =
      DownloadQueueValueProvider();

  static Future<Response> startDownload(Chapter chapter) =>
      _downloadQueueValueProvider.startDownload(
        mangaId: chapter.mangaId!,
        chapterIndex: chapter.index!,
      );

  static Future<Response> deleteDownload(Chapter chapter) =>
      _downloadQueueValueProvider.deleteDownload(
        mangaId: chapter.mangaId!,
        chapterIndex: chapter.index!,
      );

  static Future<Response> deleteFromDownloadQueue(Chapter chapter) =>
      _downloadQueueValueProvider.deleteFromDownloadQueue(
        mangaId: chapter.mangaId!,
        chapterIndex: chapter.index!,
      );
}
