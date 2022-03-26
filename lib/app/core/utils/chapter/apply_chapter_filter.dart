import '../../../data/chapter_model.dart';
import '../../../data/enums/chapter/chapter_filter.dart';

bool applyChapterFilter(Map<ChapterFilter, bool?> filter, Chapter chapter) {
  if (filter[ChapterFilter.unread] != null) {
    return !(filter[ChapterFilter.unread]! ^ !(chapter.read ?? false));
  }
  if (filter[ChapterFilter.downloaded] != null) {
    return !(filter[ChapterFilter.downloaded]! ^ (chapter.downloaded ?? false));
  }
  if (filter[ChapterFilter.bookmarked] != null) {
    return !(filter[ChapterFilter.bookmarked]! ^ (chapter.bookmarked ?? false));
  }
  return true;
}
