// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'enum.dart';

enum DBKeys {
  serverUrl('http://127.0.0.1:4567'),
  sourceLanguageFilter(["en", "localsourcelang"]),
  themeMode(ThemeMode.system),
  authType(AuthType.none),
  basicCredentials(null),
  readerMode(ReaderMode.webtoon),
  readerNavigationLayout(ReaderNavigationLayout.disabled),
  invertTap(false),
  showNSFW(true),
  ;

  const DBKeys(this.initial);

  final dynamic initial;
}

enum DBStoreName { settings }
