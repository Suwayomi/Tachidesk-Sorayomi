import 'package:get/get.dart';

import '../../../data/chapter_model.dart';
import '../../../data/providers/chapter_provider.dart';
import '../../../data/providers/download_queue_value_provider.dart';
import '../../../data/providers/update_recent_chapter_provider.dart';
import '../../../data/update_recent_chapter_model.dart';

class UpdatesRepository {
  final DownloadQueueValueProvider _downloadQueueValueProvider =
      Get.put(DownloadQueueValueProvider());
  final ChapterProvider _chapterProvider = Get.put(ChapterProvider());
  final UpdateRecentChapterProvider _updateRecentChapterProvider =
      Get.put(UpdateRecentChapterProvider());

  Future<Response> startDownload(Chapter chapter) =>
      _downloadQueueValueProvider.startDownload(
        mangaId: chapter.mangaId!,
        chapterIndex: chapter.index!,
      );

  Future<Response> deletedownloadedChapter(Chapter chapter) {
    return _chapterProvider.deletedownloadedChapter(
      mangaId: chapter.mangaId!,
      chapterIndex: chapter.index!,
    );
  }

  Future<Response> deleteFromDownloadQueue(Chapter chapter) =>
      _downloadQueueValueProvider.deleteFromDownloadQueue(
        mangaId: chapter.mangaId!,
        chapterIndex: chapter.index!,
      );

  Future<UpdateRecentChapter> getUpdateRecentChapter(int id) =>
      _updateRecentChapterProvider.getUpdateRecentChapter(id);
}
