// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'enum.dart';

enum DBKeys {
  serverUrl('http://127.0.0.1:4567'),
  sourceLanguageFilter(["lastUsed", "en", "localsourcelang"]),
  extensionLanguageFilter(["installed", "update", "en", "all"]),
  sourceLastUsed(null),
  themeMode(ThemeMode.system),
  authType(AuthType.none),
  basicCredentials(null),
  readerMode(ReaderMode.webtoon),
  readerNavigationLayout(ReaderNavigationLayout.disabled),
  invertTap(false),
  showNSFW(true),
  downloadedBadge(true),
  unreadBadge(true),
  languageBadge(false),
  filterDownloaded(null),
  filterUnread(null),
  filterCompleted(null),
  mangaSort(MangaSort.alphabetical),
  mangaSortDirection(true), // asc=true, dsc=false
  displayMode(DisplayMode.grid),
  ;

  const DBKeys(this.initial);

  final dynamic initial;
}

enum DBStoreName { settings }
