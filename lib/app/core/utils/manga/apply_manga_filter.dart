import '../../../data/enums/manga/manga_filter.dart';
import '../../../data/manga_model.dart';

bool applyMangaFilter(Map<MangaFilter, bool?> filter, Manga manga) {
  var result = true;
  if (filter[MangaFilter.unread] != null) {
    result & (!(filter[MangaFilter.unread]! ^ ((manga.unreadCount ?? 0) > 0)));
  }
  if (filter[MangaFilter.downloaded] != null) {
    result &  (!(filter[MangaFilter.downloaded]! ^
        ((manga.downloadCount ?? 0) > 0)));
  }
  if (filter[MangaFilter.completed] != null) {
    result &  (!(filter[MangaFilter.completed]! ^
        ((manga.status ?? "") == "COMPLETED")));
  }
  return result;
}
