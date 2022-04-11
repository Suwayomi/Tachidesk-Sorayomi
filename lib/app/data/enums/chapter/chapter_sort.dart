enum ChapterSort {
  fetchedAt,
  chapterIndex,
  scanlator,
}

ChapterSort chapterSortfromString(String? value) {
  return ChapterSort.values.firstWhere(
    (element) => element.name == value,
    orElse: () => ChapterSort.fetchedAt,
  );
}
