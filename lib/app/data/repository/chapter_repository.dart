import '../chapter_model.dart';
import '../providers/chapter_provider.dart';

class ChapterRepository {
  static final ChapterProvider _categoryProvider = ChapterProvider();

  static Future<List<Chapter>?> getChaptersList(int mangaId,
      {bool onlineFetch = false}) {
    return _categoryProvider.getChaptersList(mangaId, onlineFetch: onlineFetch);
  }

  static Future<Chapter?> getChapter({
    required int mangaId,
    required int chapterIndex,
  }) {
    return _categoryProvider.getChapter(
        mangaId: mangaId, chapterIndex: chapterIndex);
  }

  static String getChapterPage(
      {required int mangaId, required int chapterIndex, required int page}) {
    return _categoryProvider.getChapterPage(
      mangaId: mangaId,
      chapterIndex: chapterIndex,
      page: page,
    );
  }

  static Future patchChapter(Chapter chapter, Map<String, dynamic> formData) {
    return _categoryProvider.patchChapter(
      chapter.mangaId!,
      chapter.index!,
      formData,
    );
  }
}
