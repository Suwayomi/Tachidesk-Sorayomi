// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChapterMangaPair _$$_ChapterMangaPairFromJson(Map<String, dynamic> json) =>
    _$_ChapterMangaPair(
      chapter: json['chapter'] == null
          ? null
          : Chapter.fromJson(json['chapter'] as Map<String, dynamic>),
      manga: json['manga'] == null
          ? null
          : Manga.fromJson(json['manga'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChapterMangaPairToJson(_$_ChapterMangaPair instance) =>
    <String, dynamic>{
      'chapter': instance.chapter?.toJson(),
      'manga': instance.manga?.toJson(),
    };

_$_ChapterPage _$$_ChapterPageFromJson(Map<String, dynamic> json) =>
    _$_ChapterPage(
      hasNextPage: json['hasNextPage'] as bool?,
      page: (json['page'] as List<dynamic>?)
          ?.map((e) => ChapterMangaPair.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ChapterPageToJson(_$_ChapterPage instance) =>
    <String, dynamic>{
      'hasNextPage': instance.hasNextPage,
      'page': instance.page?.map((e) => e.toJson()).toList(),
    };
