enum ReaderMode {
  defaultReader,
  continuousHorizontalLTR,
  continuousHorizontalRTL,
  continuousVertical,
  singleHorizontalLTR,
  singleHorizontalRTL,
  singleVertical,
  webtoon,
}

ReaderMode readerModeFromString(String? value) {
  return ReaderMode.values.firstWhere(
    (element) => element.name == value,
    orElse: () => ReaderMode.webtoon,
  );
}
