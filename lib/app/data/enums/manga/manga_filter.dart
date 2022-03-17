enum MangaFilter {
  unread,
  completed,
  downloaded,
}
MangaFilter mangaFilterFromString(String? value) {
  return MangaFilter.values.firstWhere(
    (element) => element.name == value,
    orElse: () => MangaFilter.unread,
  );
}
