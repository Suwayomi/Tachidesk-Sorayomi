// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MangaPage _$$_MangaPageFromJson(Map<String, dynamic> json) => _$_MangaPage(
      mangaList: (json['mangaList'] as List<dynamic>?)
          ?.map((e) => Manga.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasNextPage: json['hasNextPage'] as bool?,
    );

Map<String, dynamic> _$$_MangaPageToJson(_$_MangaPage instance) =>
    <String, dynamic>{
      'mangaList': instance.mangaList?.map((e) => e.toJson()).toList(),
      'hasNextPage': instance.hasNextPage,
    };
