import '../../../data/enums/manga/manga_filter.dart';
import '../../../data/manga_model.dart';

bool applyMangaFilter(Map<MangaFilter, bool?> filter, Manga manga) {
  if (filter[MangaFilter.unread] != null) {
    return !(filter[MangaFilter.unread]! ^ ((manga.unreadCount ?? 0) > 0));
  }
  if (filter[MangaFilter.downloaded] != null) {
    return !(filter[MangaFilter.downloaded]! ^
        ((manga.downloadCount ?? 0) > 0));
  }
  if (filter[MangaFilter.completed] != null) {
    return !(filter[MangaFilter.completed]! ^
        ((manga.status ?? "") == "COMPLETED"));
  }
  return true;
}
