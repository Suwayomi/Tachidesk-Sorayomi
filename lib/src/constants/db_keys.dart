// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

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
