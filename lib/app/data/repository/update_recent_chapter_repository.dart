import '../providers/update_recent_chapter_provider.dart';
import '../update_recent_chapter_model.dart';

class UpdateRecentChapterRepository {
  final UpdateRecentChapterProvider _updateRecentChapterProvider =
      UpdateRecentChapterProvider();

  Future<UpdateRecentChapter> getUpdateRecentChapter(int id) async {
    final responce =
        await _updateRecentChapterProvider.getUpdateRecentChapter(id);
    return UpdateRecentChapter.fromMap(responce);
  }
}
