// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'enum.dart';

enum DBKeys {
  serverUrl('http://127.0.0.1'),
  serverPort(4567),
  serverPortToggle(true),
  sourceLanguageFilter(["all", "lastUsed", "en", "localsourcelang"]),
  extensionLanguageFilter(["installed", "update", "en", "all"]),
  sourceLastUsed(null),
  themeMode(ThemeMode.system),
  isTrueBlack(false),
  authType(AuthType.none),
  basicCredentials(null),
  readerMode(ReaderMode.webtoon),
  readerPadding(0.0),
  readerMagnifierSize(1.0),
  readerNavigationLayout(ReaderNavigationLayout.disabled),
  invertTap(false),
  quickSearchToggle(true),
  swipeToggle(true),
  scrollAnimation(true),
  showNSFW(true),
  downloadedBadge(true),
  unreadBadge(true),
  languageBadge(false),
  l10n(Locale('en')),
  mangaFilterDownloaded(null),
  mangaFilterUnread(null),
  mangaFilterCompleted(null),
  chapterFilterDownloaded(null),
  chapterFilterUnread(null),
  chapterFilterBookmarked(null),
  mangaSort(MangaSort.alphabetical),
  mangaSortDirection(true), // asc=true, dsc=false
  chapterSort(ChapterSort.source),
  chapterSortDirection(false), // asc=true, dsc=false
  libraryDisplayMode(DisplayMode.grid),
  sourceDisplayMode(DisplayMode.grid),
  gridMangaCoverWidth(192.0),
  readerOverlay(true),
  volumeTap(false),
  volumeTapInvert(false),
  hideEmptyCategory(false),
  pinchToZoom(true),
  flexScheme(FlexScheme.material),
  historyEnabled(true),
  historyRetentionDays(90),
  // Automatic URL Switching
  automaticUrlSwitching(false),
  localNetworkWifiName(''),
  localNetworkServerUrl(''),
  localNetworkConfigs(<String>[]),
  externalNetworkUrls(<String>[]),
  ;

  const DBKeys(this.initial);

  final dynamic initial;
}

enum DBStoreName { settings }
