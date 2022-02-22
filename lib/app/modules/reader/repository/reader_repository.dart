import 'package:get/get.dart';

import '../../../data/chapter_model.dart';
import '../../../data/manga_model.dart';
import '../../../data/providers/chapter_provider.dart';
import '../../../data/providers/manga_provider.dart';

class ReaderRepository {
  final ChapterProvider _chapterProvider = Get.put(ChapterProvider());
  final MangaProvider _mangaProvider = Get.put(MangaProvider());
  Future<Response> patchChapter(
      Chapter chapter, Map<String, dynamic> formData) {
    return _chapterProvider.patchChapter(
      chapter.mangaId!,
      chapter.index!,
      formData,
    );
  }

  Future<Manga?> getManga(int id, {bool fetchFreshData = true}) =>
      _mangaProvider.getManga(id, fetchFreshData: fetchFreshData);

  Future<Chapter?> getChapter({
    required int mangaId,
    required int chapterIndex,
  }) {
    return _chapterProvider.getChapter(
        mangaId: mangaId, chapterIndex: chapterIndex);
  }

  String getChapterPage(
      {required int mangaId, required int chapterIndex, required int page}) {
    return _chapterProvider.getChapterPageUrl(
      mangaId: mangaId,
      chapterIndex: chapterIndex,
      page: page,
    );
  }
}
