import '../../../data/enums/manga/manga_sort.dart';
import '../../../data/manga_model.dart';

int applyMangaSort(MapEntry<MangaSort, bool> sort, Manga m1, Manga m2) {
  switch (sort.key) {
    case MangaSort.title:
      return sort.value
          ? (m1.title ?? "").compareTo(m2.title ?? "")
          : (m2.title ?? "").compareTo(m1.title ?? "");
    case MangaSort.id:
      return sort.value
          ? (m1.id ?? 0).compareTo(m2.id ?? 0)
          : (m2.id ?? 0).compareTo(m1.id ?? 0);
    case MangaSort.unread:
      return sort.value
          ? (m1.unreadCount ?? 0).compareTo(m2.unreadCount ?? 0)
          : (m2.unreadCount ?? 0).compareTo(m1.unreadCount ?? 0);
    case MangaSort.inLibraryAt:
      return sort.value
          ? (m1.inLibraryAt ?? 0).compareTo(m2.inLibraryAt ?? 0)
          : (m2.inLibraryAt ?? 0).compareTo(m1.inLibraryAt ?? 0);
    default:
      return 0;
  }
}

MapEntry<MangaSort, bool> toggleMangaSort(
    {required MapEntry<MangaSort, bool> previous, required MangaSort present}) {
  if (previous.key == present) {
    return MapEntry(present, !previous.value);
  }
  return MapEntry(present, true);
}
