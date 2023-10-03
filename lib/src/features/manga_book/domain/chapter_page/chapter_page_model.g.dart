// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChapterMangaPairImpl _$$ChapterMangaPairImplFromJson(
        Map<String, dynamic> json) =>
    _$ChapterMangaPairImpl(
      chapter: json['chapter'] == null
          ? null
          : Chapter.fromJson(json['chapter'] as Map<String, dynamic>),
      manga: json['manga'] == null
          ? null
          : Manga.fromJson(json['manga'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChapterMangaPairImplToJson(
        _$ChapterMangaPairImpl instance) =>
    <String, dynamic>{
      'chapter': instance.chapter?.toJson(),
      'manga': instance.manga?.toJson(),
    };

_$ChapterPageImpl _$$ChapterPageImplFromJson(Map<String, dynamic> json) =>
    _$ChapterPageImpl(
      hasNextPage: json['hasNextPage'] as bool?,
      page: (json['page'] as List<dynamic>?)
          ?.map((e) => ChapterMangaPair.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChapterPageImplToJson(_$ChapterPageImpl instance) =>
    <String, dynamic>{
      'hasNextPage': instance.hasNextPage,
      'page': instance.page?.map((e) => e.toJson()).toList(),
    };
