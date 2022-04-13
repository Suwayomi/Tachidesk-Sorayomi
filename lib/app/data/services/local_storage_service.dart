import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tachidesk_sorayomi/app/core/values/string.dart';

import '../../core/utils/language.dart';
import '../../core/values/db_keys.dart';
import '../enums/auth_type.dart';
import '../enums/chapter/chapter_filter.dart';
import '../enums/chapter/chapter_sort.dart';
import '../enums/manga/manga_filter.dart';
import '../enums/manga/manga_sort.dart';
import '../enums/reader_mode.dart';
import 'package:http/http.dart' as http;

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
  PackageInfo? packageInfo;

  @override
  void onReady() async {
    packageInfo = await PackageInfo.fromPlatform();
    super.onReady();
  }

  Future<String?> checkUpdate() async {
    http.Response responce =
        await http.get(Uri.parse(sorayomiLatestReleaseApiUrl));
    if (responce.statusCode >= 200 && responce.statusCode <= 299) {
      String? tag = (jsonDecode(responce.body)["tag_name"]);
      int? latestReleaseBuildNumber = int.tryParse(tag?.split('+').last ?? "");
      int? packageBuildNumber = int.tryParse(packageInfo?.buildNumber ?? "");
      if (latestReleaseBuildNumber != null && packageBuildNumber != null) {
        return latestReleaseBuildNumber > packageBuildNumber
            ? tag?.split('+').first
            : null;
      }
    }
    return null;
  }

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
