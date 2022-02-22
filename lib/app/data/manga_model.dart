import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'source_model.dart';

class Manga {
  String? artist;
  String? author;
  String? description;
  int? downloadCount;
  bool? freshData;
  List<String>? genre;
  int? id;
  bool? inLibrary;
  int? inLibraryAt;
  bool? initialized;
  String? realUrl;
  Source? source;
  String? sourceId;
  String? status;
  String? thumbnailUrl;
  String? title;
  int? unreadCount;
  String? url;
  Manga({
    this.artist,
    this.author,
    this.description,
    this.downloadCount,
    this.freshData,
    this.genre,
    this.id,
    this.inLibrary,
    this.inLibraryAt,
    this.initialized,
    this.realUrl,
    this.source,
    this.sourceId,
    this.status,
    this.thumbnailUrl,
    this.title,
    this.unreadCount,
    this.url,
  });

  Manga copyWith({
    String? artist,
    String? author,
    String? description,
    int? downloadCount,
    bool? freshData,
    List<String>? genre,
    int? id,
    bool? inLibrary,
    int? inLibraryAt,
    bool? initialized,
    String? realUrl,
    Source? source,
    String? sourceId,
    String? status,
    String? thumbnailUrl,
    String? title,
    int? unreadCount,
    String? url,
  }) {
    return Manga(
      artist: artist ?? this.artist,
      author: author ?? this.author,
      description: description ?? this.description,
      downloadCount: downloadCount ?? this.downloadCount,
      freshData: freshData ?? this.freshData,
      genre: genre ?? this.genre,
      id: id ?? this.id,
      inLibrary: inLibrary ?? this.inLibrary,
      inLibraryAt: inLibraryAt ?? this.inLibraryAt,
      initialized: initialized ?? this.initialized,
      realUrl: realUrl ?? this.realUrl,
      source: source ?? this.source,
      sourceId: sourceId ?? this.sourceId,
      status: status ?? this.status,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      title: title ?? this.title,
      unreadCount: unreadCount ?? this.unreadCount,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'artist': artist,
      'author': author,
      'description': description,
      'downloadCount': downloadCount,
      'freshData': freshData,
      'genre': genre,
      'id': id,
      'inLibrary': inLibrary,
      'inLibraryAt': inLibraryAt,
      'initialized': initialized,
      'realUrl': realUrl,
      'source': source?.toMap(),
      'sourceId': sourceId,
      'status': status,
      'thumbnailUrl': thumbnailUrl,
      'title': title,
      'unreadCount': unreadCount,
      'url': url,
    };
  }

  factory Manga.fromMap(Map<String, dynamic> map) {
    return Manga(
      artist: map['artist'],
      author: map['author'],
      description: map['description'],
      downloadCount: map['downloadCount']?.toInt(),
      freshData: map['freshData'],
      genre: map['genre'] != null ? List<String>.from(map['genre']) : null,
      id: map['id']?.toInt(),
      inLibrary: map['inLibrary'],
      inLibraryAt: map['inLibraryAt']?.toInt(),
      initialized: map['initialized'],
      realUrl: map['realUrl'],
      source: map['source'] != null ? Source.fromMap(map['source']) : null,
      sourceId: map['sourceId'],
      status: map['status'],
      thumbnailUrl: map['thumbnailUrl'],
      title: map['title'],
      unreadCount: map['unreadCount']?.toInt(),
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Manga.fromJson(String source) => Manga.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Manga(artist: $artist, author: $author, description: $description,'
        ' downloadCount: $downloadCount, freshData: $freshData, genre: $genre,'
        ' id: $id, inLibrary: $inLibrary, inLibraryAt: $inLibraryAt,'
        ' initialized: $initialized, realUrl: $realUrl, source: $source,'
        ' sourceId: $sourceId, status: $status, thumbnailUrl: $thumbnailUrl,'
        ' title: $title, unreadCount: $unreadCount, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Manga &&
        other.artist == artist &&
        other.author == author &&
        other.description == description &&
        other.downloadCount == downloadCount &&
        other.freshData == freshData &&
        listEquals(other.genre, genre) &&
        other.id == id &&
        other.inLibrary == inLibrary &&
        other.inLibraryAt == inLibraryAt &&
        other.initialized == initialized &&
        other.realUrl == realUrl &&
        other.source == source &&
        other.sourceId == sourceId &&
        other.status == status &&
        other.thumbnailUrl == thumbnailUrl &&
        other.title == title &&
        other.unreadCount == unreadCount &&
        other.url == url;
  }

  @override
  int get hashCode {
    return artist.hashCode ^
        author.hashCode ^
        description.hashCode ^
        downloadCount.hashCode ^
        freshData.hashCode ^
        genre.hashCode ^
        id.hashCode ^
        inLibrary.hashCode ^
        inLibraryAt.hashCode ^
        initialized.hashCode ^
        realUrl.hashCode ^
        source.hashCode ^
        sourceId.hashCode ^
        status.hashCode ^
        thumbnailUrl.hashCode ^
        title.hashCode ^
        unreadCount.hashCode ^
        url.hashCode;
  }
}
