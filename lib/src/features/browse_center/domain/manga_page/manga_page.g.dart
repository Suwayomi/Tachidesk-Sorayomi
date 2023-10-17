// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MangaPageImpl _$$MangaPageImplFromJson(Map<String, dynamic> json) =>
    _$MangaPageImpl(
      mangaList: (json['mangaList'] as List<dynamic>?)
          ?.map((e) => Manga.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasNextPage: json['hasNextPage'] as bool?,
    );

Map<String, dynamic> _$$MangaPageImplToJson(_$MangaPageImpl instance) =>
    <String, dynamic>{
      'mangaList': instance.mangaList?.map((e) => e.toJson()).toList(),
      'hasNextPage': instance.hasNextPage,
    };
