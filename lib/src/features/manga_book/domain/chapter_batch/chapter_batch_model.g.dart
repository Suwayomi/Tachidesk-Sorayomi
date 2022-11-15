// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_batch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChapterBatch _$$_ChapterBatchFromJson(Map<String, dynamic> json) =>
    _$_ChapterBatch(
      chapterIds:
          (json['chapterIds'] as List<dynamic>?)?.map((e) => e as int).toList(),
      change: json['change'] == null
          ? null
          : ChapterChange.fromJson(json['change'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChapterBatchToJson(_$_ChapterBatch instance) =>
    <String, dynamic>{
      'chapterIds': instance.chapterIds,
      'change': instance.change?.toJson(),
    };

_$_ChapterChange _$$_ChapterChangeFromJson(Map<String, dynamic> json) =>
    _$_ChapterChange(
      isRead: json['isRead'] as bool?,
      isBookmarked: json['isBookmarked'] as bool?,
      lastPageRead: json['lastPageRead'] as int?,
      delete: json['delete'] as bool?,
    );

Map<String, dynamic> _$$_ChapterChangeToJson(_$_ChapterChange instance) =>
    <String, dynamic>{
      'isRead': instance.isRead,
      'isBookmarked': instance.isBookmarked,
      'lastPageRead': instance.lastPageRead,
      'delete': instance.delete,
    };
