// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads_queue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DownloadsQueueImpl _$$DownloadsQueueImplFromJson(Map<String, dynamic> json) =>
    _$DownloadsQueueImpl(
      chapter: json['chapter'] == null
          ? null
          : Chapter.fromJson(json['chapter'] as Map<String, dynamic>),
      chapterIndex: json['chapterIndex'] as int?,
      manga: json['manga'] == null
          ? null
          : Manga.fromJson(json['manga'] as Map<String, dynamic>),
      mangaId: json['mangaId'] as int?,
      progress: (json['progress'] as num?)?.toDouble(),
      state: json['state'] as String?,
      tries: json['tries'] as int?,
    );

Map<String, dynamic> _$$DownloadsQueueImplToJson(
        _$DownloadsQueueImpl instance) =>
    <String, dynamic>{
      'chapter': instance.chapter?.toJson(),
      'chapterIndex': instance.chapterIndex,
      'manga': instance.manga?.toJson(),
      'mangaId': instance.mangaId,
      'progress': instance.progress,
      'state': instance.state,
      'tries': instance.tries,
    };
