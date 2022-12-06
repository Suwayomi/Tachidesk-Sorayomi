// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_put_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChapterPut _$$_ChapterPutFromJson(Map<String, dynamic> json) =>
    _$_ChapterPut(
      read: json['read'] as bool?,
      bookmarked: json['bookmarked'] as bool?,
      markPrevRead: json['markPrevRead'] as bool?,
      lastPageRead: json['lastPageRead'] as int?,
    );

Map<String, dynamic> _$$_ChapterPutToJson(_$_ChapterPut instance) =>
    <String, dynamic>{
      'read': instance.read,
      'bookmarked': instance.bookmarked,
      'markPrevRead': instance.markPrevRead,
      'lastPageRead': instance.lastPageRead,
    };
