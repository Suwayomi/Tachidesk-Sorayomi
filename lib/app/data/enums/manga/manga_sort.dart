enum MangaSort {
  title,
  inLibraryAt,
  unread,
  id,
}
MangaSort mangaSortfromString(String? value) {
  return MangaSort.values.firstWhere(
    (element) => element.name == value,
    orElse: () => MangaSort.id,
  );
}
