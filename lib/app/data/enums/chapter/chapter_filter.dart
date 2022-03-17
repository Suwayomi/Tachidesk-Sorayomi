enum ChapterFilter {
  unread,
  bookmarked,
  downloaded,
}
ChapterFilter chapterFilterFromString(String? value) {
  return ChapterFilter.values.firstWhere(
    (element) => element.name == value,
    orElse: () => ChapterFilter.unread,
  );
}
