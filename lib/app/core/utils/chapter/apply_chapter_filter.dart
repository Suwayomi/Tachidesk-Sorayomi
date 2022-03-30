import '../../../data/chapter_model.dart';
import '../../../data/enums/chapter/chapter_filter.dart';

bool applyChapterFilter(Map<ChapterFilter, bool?> filter, Chapter chapter) {
  var result = true;
  if (filter[ChapterFilter.unread] != null) {
    result & (!(filter[ChapterFilter.unread]! ^ !(chapter.read ?? false)));
  }
  if (filter[ChapterFilter.downloaded] != null) {
    result &  (!(filter[ChapterFilter.downloaded]! ^ (chapter.downloaded ?? false)));
  }
  if (filter[ChapterFilter.bookmarked] != null) {
    result &  (!(filter[ChapterFilter.bookmarked]! ^ (chapter.bookmarked ?? false)));
  }
  return result;
}
