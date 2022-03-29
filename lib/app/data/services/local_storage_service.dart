import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/utils/language.dart';
import '../../core/values/db_keys.dart';
import '../enums/auth_type.dart';
import '../enums/chapter/chapter_filter.dart';
import '../enums/chapter/chapter_sort.dart';
import '../enums/manga/manga_filter.dart';
import '../enums/manga/manga_sort.dart';
import '../enums/reader_mode.dart';

class LocalStorageService extends GetxService {
  final box = GetStorage();
  // TODO Need Enhancement in Tachidesk-server
  // https://github.com/Suwayomi/Tachidesk-Server/issues/312
  // final Rx<Settings> _settings = Settings().obs;
  // Settings get settings => _settings.value;

  // set settings(Settings value) => _settings.value = value;
  // final SettingsProvider _settingsProvider = Get.put(SettingsProvider());

  //  @override
  //  void onReady() async {
  //  settings = await _settingsProvider.getSettings() ?? settings;
  //    super.onReady();
  //  }

  // Manga Screen
  Map<ChapterFilter, bool?> get chapterFilter {
    Map<String, bool?> map = Map<String, bool?>.from(
        box.read(chapterFilterKey) ??
            {for (var element in ChapterFilter.values) element.name: null});

    return map
        .map((key, value) => MapEntry(chapterFilterFromString(key), value));
  }

  Future<void> setChapterFilter(Map<ChapterFilter, bool?> val) => box.write(
        chapterFilterKey,
        val.map<String, bool?>((key, value) => MapEntry(key.name, value)),
      );

  MapEntry<ChapterSort, bool> get chapterSort {
    Map<String, dynamic> map = box.read(chapterSortKey) ??
        {
          "key": ChapterSort.fetchedAt.name,
          "value": true,
        };
    return MapEntry(chapterSortfromString(map["key"]), map["value"]);
  }

  Future<void> setChapterSort(MapEntry<ChapterSort, bool?> val) => box.write(
        chapterSortKey,
        {
          "key": val.key.name,
          "value": val.value,
        },
      );
  // End

  // Library Screen
  Map<MangaFilter, bool?> get mangaFilter {
    Map<String, bool?> map = Map<String, bool?>.from(box.read(mangaFilterKey) ??
        {for (var element in MangaFilter.values) element.name: null});

    return map.map((key, value) => MapEntry(mangaFilterFromString(key), value));
  }

  Future<void> setMangeFilter(Map<MangaFilter, bool?> val) => box.write(
        mangaFilterKey,
        val.map<String, bool?>((key, value) => MapEntry(key.name, value)),
      );

  MapEntry<MangaSort, bool> get mangaSort {
    Map<String, dynamic> map = box.read(mangaSortKey) ??
        {
          "key": MangaSort.id.name,
          "value": true,
        };
    return MapEntry(mangaSortfromString(map["key"]), map["value"]);
  }

  Future<void> setMangeSort(MapEntry<MangaSort, bool?> val) => box.write(
        mangaSortKey,
        {
          "key": val.key.name,
          "value": val.value,
        },
      );
  // End

  // Browse Source Screen Start
  String? get lastUsed => box.read<String>(lastUsedKey);
  Future<void> setLastUsed(String? source) => box.write(lastUsedKey, source);

  List<String> get sourceLanguages =>
      box.read<List<String>?>(sourceLangKey) ?? sourceDefualtLangs();
  Future<void> setSourceLanguages(List langs) =>
      box.write(sourceLangKey, langs);
  // End

  bool get isDark => box.read(darkModeKey) ?? true;
  ThemeMode get theme => isDark ? ThemeMode.dark : ThemeMode.light;
  Future<void> setIsDark(bool val) => box.write(darkModeKey, val);

  bool get showNSFW => box.read(showNsfwKey) ?? true;
  Future<void> setShowNSFW(bool val) => box.write(showNsfwKey, val);

  ReaderMode get readerMode => readerModeFromString(box.read(readerModeKey));
  Future<void> setReaderMode(ReaderMode val) =>
      box.write(readerModeKey, val.name);

  String get baseURL => box.read(baseUrlKey) ?? "http://127.0.0.1:4567";
  Future<void> setBaseURL(String val) => box.write(baseUrlKey, val);

  AuthType get baseAuthType =>
      authTypeFromString(box.read(baseAuthTypeKey) ?? "");
  Future<void> setBaseAuthType(AuthType val) =>
      box.write(baseAuthTypeKey, val.name);

  String get authUserName => box.read(authUserNameKey) ?? "";
  Future<void> setAuthUserName(String val) => box.write(authUserNameKey, val);

  String get authPassword => box.read(authPasswordKey) ?? "";
  Future<void> setAuthPassword(String val) => box.write(authPasswordKey, val);

  String get basicAuth =>
      'Basic ' +
      base64.encode(
        utf8.encode('$authUserName:$authPassword'),
      );
}
