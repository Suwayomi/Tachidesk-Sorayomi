import '../../../data/chapter_model.dart';
import '../../../data/enums/chapter/chapter_sort.dart';

int applyChapterSort(MapEntry<ChapterSort, bool> sort, Chapter c1, Chapter c2) {
  switch (sort.key) {
    case ChapterSort.scanlator:
      return sort.value
          ? (c1.scanlator ?? "").compareTo(c2.scanlator ?? "")
          : (c2.scanlator ?? "").compareTo(c1.scanlator ?? "");
    case ChapterSort.fetchedAt:
      return sort.value
          ? (c1.fetchedAt ?? 0).compareTo(c2.fetchedAt ?? 0)
          : (c2.fetchedAt ?? 0).compareTo(c1.fetchedAt ?? 0);
    default:
      return 0;
  }
}

MapEntry<ChapterSort, bool> toggleChapterSort(
    {required MapEntry<ChapterSort, bool> previous,
    required ChapterSort present}) {
  if (previous.key == present) {
    return MapEntry(present, !previous.value);
  }
  return MapEntry(present, true);
}
