// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Manga _$$_MangaFromJson(Map<String, dynamic> json) => _$_Manga(
      artist: json['artist'] as String?,
      author: json['author'] as String?,
      description: json['description'] as String?,
      downloadCount: json['downloadCount'] as int?,
      chapterCount: json['chapterCount'] as int?,
      lastChapterRead: json['lastChapterRead'] as int?,
      freshData: json['freshData'] as bool?,
      genre:
          (json['genre'] as List<dynamic>?)?.map((e) => e as String).toList(),
      inLibrary: json['inLibrary'] as bool?,
      id: json['id'] as int?,
      inLibraryAt: json['inLibraryAt'] as int?,
      initialized: json['initialized'] as bool?,
      realUrl: json['realUrl'] as String?,
      source: json['source'] == null
          ? null
          : Source.fromJson(json['source'] as Map<String, dynamic>),
      sourceId: json['sourceId'] as String?,
      status: json['status'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      title: json['title'] as String?,
      unreadCount: json['unreadCount'] as int?,
      lastFetchedAt: json['lastFetchedAt'] as int?,
      chaptersLastFetchedAt: json['chaptersLastFetchedAt'] as int?,
      url: json['url'] as String?,
      meta: json['meta'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_MangaToJson(_$_Manga instance) => <String, dynamic>{
      'artist': instance.artist,
      'author': instance.author,
      'description': instance.description,
      'downloadCount': instance.downloadCount,
      'chapterCount': instance.chapterCount,
      'lastChapterRead': instance.lastChapterRead,
      'freshData': instance.freshData,
      'genre': instance.genre,
      'inLibrary': instance.inLibrary,
      'id': instance.id,
      'inLibraryAt': instance.inLibraryAt,
      'initialized': instance.initialized,
      'realUrl': instance.realUrl,
      'source': instance.source?.toJson(),
      'sourceId': instance.sourceId,
      'status': instance.status,
      'thumbnailUrl': instance.thumbnailUrl,
      'title': instance.title,
      'unreadCount': instance.unreadCount,
      'lastFetchedAt': instance.lastFetchedAt,
      'chaptersLastFetchedAt': instance.chaptersLastFetchedAt,
      'url': instance.url,
      'meta': instance.meta,
    };
