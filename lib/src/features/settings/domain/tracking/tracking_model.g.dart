// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrackerImpl _$$TrackerImplFromJson(Map<String, dynamic> json) =>
    _$TrackerImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      icon: json['icon'] as String?,
      isLogin: json['isLogin'] as bool?,
      authUrl: json['authUrl'] as String?,
    );

Map<String, dynamic> _$$TrackerImplToJson(_$TrackerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'isLogin': instance.isLogin,
      'authUrl': instance.authUrl,
    };

_$MangaTrackerImpl _$$MangaTrackerImplFromJson(Map<String, dynamic> json) =>
    _$MangaTrackerImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      icon: json['icon'] as String?,
      statusList:
          (json['statusList'] as List<dynamic>?)?.map((e) => e as int).toList(),
      statusTextMap: (json['statusTextMap'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(int.parse(k), e as String),
      ),
      scoreList: (json['scoreList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      record: json['record'] == null
          ? null
          : TrackRecord.fromJson(json['record'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MangaTrackerImplToJson(_$MangaTrackerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'statusList': instance.statusList,
      'statusTextMap':
          instance.statusTextMap?.map((k, e) => MapEntry(k.toString(), e)),
      'scoreList': instance.scoreList,
      'record': instance.record?.toJson(),
    };

_$TrackRecordImpl _$$TrackRecordImplFromJson(Map<String, dynamic> json) =>
    _$TrackRecordImpl(
      id: json['id'] as int?,
      mangaId: json['mangaId'] as int?,
      syncId: json['syncId'] as int?,
      remoteId: json['remoteId'] as int?,
      libraryId: json['libraryId'] as int?,
      title: json['title'] as String?,
      lastChapterRead: (json['lastChapterRead'] as num?)?.toDouble(),
      totalChapters: json['totalChapters'] as int?,
      status: json['status'] as int?,
      score: (json['score'] as num?)?.toDouble(),
      scoreString: json['scoreString'] as String?,
      remoteUrl: json['remoteUrl'] as String?,
      startDate: json['startDate'] as int?,
      finishDate: json['finishDate'] as int?,
    );

Map<String, dynamic> _$$TrackRecordImplToJson(_$TrackRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mangaId': instance.mangaId,
      'syncId': instance.syncId,
      'remoteId': instance.remoteId,
      'libraryId': instance.libraryId,
      'title': instance.title,
      'lastChapterRead': instance.lastChapterRead,
      'totalChapters': instance.totalChapters,
      'status': instance.status,
      'score': instance.score,
      'scoreString': instance.scoreString,
      'remoteUrl': instance.remoteUrl,
      'startDate': instance.startDate,
      'finishDate': instance.finishDate,
    };

_$TrackSearchImpl _$$TrackSearchImplFromJson(Map<String, dynamic> json) =>
    _$TrackSearchImpl(
      id: json['id'] as int?,
      mangaId: json['mangaId'] as int?,
      syncId: json['syncId'] as int?,
      mediaId: json['mediaId'] as int?,
      libraryId: json['libraryId'] as int?,
      title: json['title'] as String?,
      lastChapterRead: (json['lastChapterRead'] as num?)?.toDouble(),
      totalChapters: json['totalChapters'] as int?,
      score: (json['score'] as num?)?.toDouble(),
      status: json['status'] as int?,
      startedReadingDate: json['startedReadingDate'] as int?,
      finishedReadingDate: json['finishedReadingDate'] as int?,
      trackingUrl: json['trackingUrl'] as String?,
      coverUrl: json['coverUrl'] as String?,
      summary: json['summary'] as String?,
      publishingStatus: json['publishingStatus'] as String?,
      publishingType: json['publishingType'] as String?,
      startDate: json['startDate'] as String?,
    );

Map<String, dynamic> _$$TrackSearchImplToJson(_$TrackSearchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mangaId': instance.mangaId,
      'syncId': instance.syncId,
      'mediaId': instance.mediaId,
      'libraryId': instance.libraryId,
      'title': instance.title,
      'lastChapterRead': instance.lastChapterRead,
      'totalChapters': instance.totalChapters,
      'score': instance.score,
      'status': instance.status,
      'startedReadingDate': instance.startedReadingDate,
      'finishedReadingDate': instance.finishedReadingDate,
      'trackingUrl': instance.trackingUrl,
      'coverUrl': instance.coverUrl,
      'summary': instance.summary,
      'publishingStatus': instance.publishingStatus,
      'publishingType': instance.publishingType,
      'startDate': instance.startDate,
    };

_$TrackUpdateImpl _$$TrackUpdateImplFromJson(Map<String, dynamic> json) =>
    _$TrackUpdateImpl(
      recordId: json['recordId'] as int?,
      status: json['status'] as int?,
      lastChapterRead: (json['lastChapterRead'] as num?)?.toDouble(),
      scoreString: json['scoreString'] as String?,
      startDate: json['startDate'] as int?,
      finishDate: json['finishDate'] as int?,
      unbind: json['unbind'] as bool?,
    );

Map<String, dynamic> _$$TrackUpdateImplToJson(_$TrackUpdateImpl instance) =>
    <String, dynamic>{
      'recordId': instance.recordId,
      'status': instance.status,
      'lastChapterRead': instance.lastChapterRead,
      'scoreString': instance.scoreString,
      'startDate': instance.startDate,
      'finishDate': instance.finishDate,
      'unbind': instance.unbind,
    };
