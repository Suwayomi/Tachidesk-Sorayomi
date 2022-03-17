import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../core/utils/language.dart';
import 'enums/reader_mode.dart';
import 'source_model.dart';

// import 'package:tachidesk_sorayomi/app/data/enums/manga/manga_filter.dart';
// import 'package:tachidesk_sorayomi/app/data/enums/manga/manga_sort.dart';

class Settings {
  bool? isDark;
  Source? lastUsed;
  // Map<MangaFilter, bool?>? mangaFilter;
  // MapEntry<MangaSort, bool>? mangaSort;
  ReaderMode? readerMode;
  bool? showNSFW;
  List<Language>? sourceLanguages;
  Settings({
    this.isDark = true,
    this.lastUsed,
    // this.mangaFilter,
    // this.mangaSort,
    this.readerMode = ReaderMode.webtoon,
    this.showNSFW = true,
    this.sourceLanguages,
  });

  Settings copyWith({
    bool? isDark,
    Source? lastUsed,
    // Map<MangaFilter, bool?>? mangaFilter,
    // MapEntry<MangaSort, bool>? mangaSort,
    ReaderMode? readerMode,
    bool? showNSFW,
    List<Language>? sourceLanguages,
  }) {
    return Settings(
      isDark: isDark ?? this.isDark,
      lastUsed: lastUsed ?? this.lastUsed,
      // mangaFilter: mangaFilter ?? this.mangaFilter,
      // mangaSort: mangaSort ?? this.mangaSort,
      readerMode: readerMode ?? this.readerMode,
      showNSFW: showNSFW ?? this.showNSFW,
      sourceLanguages: sourceLanguages ?? this.sourceLanguages,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isDark': isDark,
      'lastUsed': lastUsed?.toMap(),
      // 'mangaFilter': mangaFilter?.map(
      //   (key, value) => MapEntry(key.name, value),
      // ),
      // 'mangaSort': {
      //   "key": mangaSort?.key,
      //   "value": mangaSort?.value,
      // },
      'readerMode': readerMode?.name,
      'showNSFW': showNSFW,
      'sourceLanguages': sourceLanguages?.map((x) => x.toMap()).toList(),
    };
  }

  factory Settings.fromMap(Map<String, dynamic> map) {
    return Settings(
      isDark: map['isDark'],
      lastUsed:
          map['lastUsed'] != null ? Source.fromMap(map['lastUsed']) : null,
      // mangaFilter: (map['mangaFilter'] != null && map['mangaFilter'] is Map)
      //     ? (map['lastUsed'] as Map)
      //         .map((key, value) => MapEntry(mangaFilterFromString(key), value))
      //     : null,
      // mangaSort: MapEntry(
      //   mangaSortfromString(map['mangaSort']['key']),
      //   map['mangaSort']['value'],
      // ),
      readerMode: map['readerMode'] != null
          ? readerModeFromString(map['readerMode'])
          : null,
      showNSFW: map['showNSFW'],
      sourceLanguages: map['sourceLanguages'] != null
          ? List<Language>.from(
              map['sourceLanguages']?.map((x) => Language.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Settings.fromJson(String source) =>
      Settings.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Settings(isDark: $isDark, lastUsed: $lastUsed,'
        // ' mangaFilter: $mangaFilter, mangaSort: $mangaSort,'
        ' readerMode: $readerMode, showNSFW: $showNSFW,'
        ' sourceLanguages: $sourceLanguages)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Settings &&
        other.isDark == isDark &&
        other.lastUsed == lastUsed &&
        // mapEquals(other.mangaFilter, mangaFilter) &&
        // other.mangaSort == mangaSort &&
        other.readerMode == readerMode &&
        other.showNSFW == showNSFW &&
        listEquals(other.sourceLanguages, sourceLanguages);
  }

  @override
  int get hashCode {
    return isDark.hashCode ^
        lastUsed.hashCode ^
        // mangaFilter.hashCode ^
        // mangaSort.hashCode ^
        readerMode.hashCode ^
        showNSFW.hashCode ^
        sourceLanguages.hashCode;
  }
}
