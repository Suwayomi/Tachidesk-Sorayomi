// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../constants/enum.dart';
import '../../../../utils/extensions/custom_extensions.dart';
import '../../../browse_center/domain/source/source_model.dart';
import '../../../settings/domain/tracking/tracking_model.dart';
import '../chapter/chapter_model.dart';

part 'manga_model.freezed.dart';
part 'manga_model.g.dart';

@freezed
class Manga with _$Manga {
  Manga._();
  factory Manga({
    String? artist,
    String? author,
    String? description,
    int? downloadCount,
    int? chapterCount,
    int? lastReadAt,
    Chapter? lastChapterRead,
    bool? freshData,
    List<String>? genre,
    bool? inLibrary,
    int? id,
    int? inLibraryAt,
    bool? initialized,
    String? realUrl,
    Source? source,
    String? sourceId,
    @JsonKey(fromJson: MangaStatus.fromJson, toJson: MangaStatus.toJson)
    MangaStatus? status,
    String? thumbnailUrl,
    int? thumbnailUrlLastFetched,
    String? title,
    int? unreadCount,
    int? lastFetchedAt,
    int? chaptersLastFetchedAt,
    String? url,
    MangaMeta? meta,
    List<MangaTracker>? trackers,
  }) = _Manga;

  factory Manga.fromJson(Map<String, dynamic> json) => _$MangaFromJson(json);

  bool genreMatches(
      List<String>? mangaGenreList, List<String>? queryGenreList) {
    Set<String>? mangaSet = mangaGenreList?.map((e) => e.toLowerCase()).toSet();
    Set<String>? querySet =
        queryGenreList?.map((e) => e.toLowerCase().trim()).toSet();
    return (mangaSet?.containsAll(querySet ?? <String>{})).ifNull(true);
  }

  bool query([String? query]) {
    return title.query(query) ||
        author.query(query) ||
        genreMatches(genre, query?.split(','));
  }
}

@freezed
class MangaMeta with _$MangaMeta {
  factory MangaMeta({
    @JsonKey(
      name: "flutter_readerNavigationLayoutInvert",
      fromJson: MangaMeta.fromJsonToBool,
    )
    bool? invertTap,
    @JsonKey(name: "flutter_readerNavigationLayout")
    ReaderNavigationLayout? readerNavigationLayout,
    @JsonKey(name: "flutter_readerMode") ReaderMode? readerMode,
    @JsonKey(
      name: "flutter_readerPadding",
      fromJson: MangaMeta.fromJsonToDouble,
    )
    double? readerPadding,
    @JsonKey(
      name: "flutter_readerMagnifierSize",
      fromJson: MangaMeta.fromJsonToDouble,
    )
    double? readerMagnifierSize,
    @JsonKey(name: "flutter_scanlator") String? scanlator,
  }) = _MangaMeta;

  static bool? fromJsonToBool(dynamic val) => val != null && val is String
      ? val.toLowerCase().compareTo(true.toString()) == 0
      : null;

  static double? fromJsonToDouble(dynamic val) =>
      val != null && val is String ? double.parse(val) : null;
  factory MangaMeta.fromJson(Map<String, dynamic> json) =>
      _$MangaMetaFromJson(json);
}

enum MangaMetaKeys {
  invertTap("flutter_readerNavigationLayoutInvert"),
  readerNavigationLayout("flutter_readerNavigationLayout"),
  readerMode("flutter_readerMode"),
  readerPadding("flutter_readerPadding"),
  readerMagnifierSize("flutter_readerMagnifierSize"),
  scanlator("flutter_scanlator"),
  ;

  const MangaMetaKeys(this.key);
  final String key;
}
