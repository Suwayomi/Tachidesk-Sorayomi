// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Chapter _$$_ChapterFromJson(Map<String, dynamic> json) => _$_Chapter(
      bookmarked: json['bookmarked'] as bool?,
      chapterCount: json['chapterCount'] as int?,
      chapterNumber: (json['chapterNumber'] as num?)?.toDouble(),
      downloaded: json['downloaded'] as bool?,
      fetchedAt: json['fetchedAt'] as int?,
      index: json['index'] as int?,
      lastPageRead: json['lastPageRead'] as int?,
      lastReadAt: json['lastReadAt'] as int?,
      mangaId: json['mangaId'] as int?,
      name: json['name'] as String?,
      pageCount: json['pageCount'] as int?,
      read: json['read'] as bool?,
      scanlator: json['scanlator'] as String?,
      uploadDate: json['uploadDate'] as int?,
      url: json['url'] as String?,
      meta: (json['meta'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$$_ChapterToJson(_$_Chapter instance) =>
    <String, dynamic>{
      'bookmarked': instance.bookmarked,
      'chapterCount': instance.chapterCount,
      'chapterNumber': instance.chapterNumber,
      'downloaded': instance.downloaded,
      'fetchedAt': instance.fetchedAt,
      'index': instance.index,
      'lastPageRead': instance.lastPageRead,
      'lastReadAt': instance.lastReadAt,
      'mangaId': instance.mangaId,
      'name': instance.name,
      'pageCount': instance.pageCount,
      'read': instance.read,
      'scanlator': instance.scanlator,
      'uploadDate': instance.uploadDate,
      'url': instance.url,
      'meta': instance.meta,
    };
