import '../providers/update_recent_chapter_provider.dart';
import '../update_recent_chapter_model.dart';

class UpdateRecentChapterRepository {
  static final UpdateRecentChapterProvider _updateRecentChapterProvider =
      UpdateRecentChapterProvider();

  static Future<UpdateRecentChapter> getUpdateRecentChapter(int id) async {
    final responce =
        await _updateRecentChapterProvider.getUpdateRecentChapter(id);
    return UpdateRecentChapter.fromMap(responce);
  }
}
