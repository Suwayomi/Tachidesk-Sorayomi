enum ReaderNavigationLayout {
  lShaped,
  rightAndLeft,
  edge,
  kindlish,
  disabled,
}

ReaderNavigationLayout readerNavigationLayoutFromString(String? value) {
  return ReaderNavigationLayout.values.firstWhere(
    (element) => element.name == value,
    orElse: () => ReaderNavigationLayout.disabled,
  );
}
