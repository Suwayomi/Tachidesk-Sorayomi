import '../chapter_model.dart';
import '../providers/chapter_provider.dart';

class ChapterRepository {
  static final ChapterProvider _categoryProvider = ChapterProvider();

  Future getChaptersList(int mangaId) {
    return _categoryProvider.getChaptersList(mangaId);
  }

  Future patchChapter(Chapter chapter, Map<String, dynamic> formData) {
    return _categoryProvider.patchChapter(
      chapter.mangaId!,
      chapter.index!,
      formData,
    );
  }
}
