import 'package:get/get_connect.dart';

import '../chapter_model.dart';
import '../providers/download_queue_value_provider.dart';

class DownloadQueueValueRepository {
  final DownloadQueueValueProvider _downloadQueueValueProvider =
      DownloadQueueValueProvider();

  Future<Response> startDownload(Chapter chapter) =>
      _downloadQueueValueProvider.startDownload(
        mangaId: chapter.mangaId!,
        chapterIndex: chapter.index!,
      );

  Future<Response> deleteDownload(Chapter chapter) =>
      _downloadQueueValueProvider.deleteDownload(
        mangaId: chapter.mangaId!,
        chapterIndex: chapter.index!,
      );

  Future<Response> deleteFromDownloadQueue(Chapter chapter) =>
      _downloadQueueValueProvider.deleteFromDownloadQueue(
        mangaId: chapter.mangaId!,
        chapterIndex: chapter.index!,
      );
}
