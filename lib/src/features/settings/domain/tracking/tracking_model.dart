import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracking_model.freezed.dart';
part 'tracking_model.g.dart';

@freezed
class Tracker with _$Tracker {
  factory Tracker({
    int? id,
    String? name,
    String? icon,
    bool? isLogin,
    String? authUrl,
  }) = _Tracker;

  factory Tracker.fromJson(Map<String, dynamic> json) => _$TrackerFromJson(json);
}

@freezed
class MangaTracker with _$MangaTracker {
  factory MangaTracker({
    int? id,
    String? name,
    String? icon,
    List<int>? statusList,
    Map<int, String>? statusTextMap,
    List<String>? scoreList,
    TrackRecord? record,
  }) = _MangaTracker;

  factory MangaTracker.fromJson(Map<String, dynamic> json) => _$MangaTrackerFromJson(json);
}

@freezed
class TrackRecord with _$TrackRecord {
  factory TrackRecord({
    int? id,
    int? mangaId,
    int? syncId,
    int? remoteId,
    int? libraryId,
    String? title,
    double? lastChapterRead,
    int? totalChapters,
    int? status,
    double? score,
    String? scoreString,
    String? remoteUrl,
    int? startDate,
    int? finishDate,
  }) = _TrackRecord;

  factory TrackRecord.fromJson(Map<String, dynamic> json) => _$TrackRecordFromJson(json);
}

@freezed
class TrackSearch with _$TrackSearch {
  factory TrackSearch({
    int? syncId,
    int? mediaId,
    String? title,
    int? totalChapters,
    String? trackingUrl,
    String? coverUrl,
    String? summary,
    String? publishingStatus,
    String? publishingType,
    String? startDate,
  }) = _TrackSearch;

  factory TrackSearch.fromJson(Map<String, dynamic> json) => _$TrackSearchFromJson(json);
}

@freezed
class TrackUpdate with _$TrackUpdate {
  factory TrackUpdate({
    int? recordId,
    int? status,
    double? lastChapterRead,
    String? scoreString,
    int? startDate,
    int? finishDate,
    bool? unbind,
  }) = _TrackUpdate;

  factory TrackUpdate.fromJson(Map<String, dynamic> json) => _$TrackUpdateFromJson(json);
}