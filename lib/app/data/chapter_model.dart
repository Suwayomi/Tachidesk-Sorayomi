import 'dart:convert';

import 'package:flutter/foundation.dart';

class Chapter {
  bool? bookmarked;
  int? chapterCount;
  int? chapterNumber;
  bool? downloaded;
  int? fetchedAt;
  int? index;
  int? lastPageRead;
  int? lastReadAt;
  int? mangaId;
  String? name;
  int? pageCount;
  bool? read;
  String? scanlator;
  int? uploadDate;
  String? url;
  Map<String, String>? meta;
  Chapter({
    this.bookmarked,
    this.chapterCount,
    this.chapterNumber,
    this.downloaded,
    this.fetchedAt,
    this.index,
    this.lastPageRead,
    this.lastReadAt,
    this.mangaId,
    this.name,
    this.pageCount,
    this.read,
    this.scanlator,
    this.uploadDate,
    this.url,
    this.meta,
  });

  Chapter copyWith({
    bool? bookmarked,
    int? chapterCount,
    int? chapterNumber,
    bool? downloaded,
    int? fetchedAt,
    int? index,
    int? lastPageRead,
    int? lastReadAt,
    int? mangaId,
    String? name,
    int? pageCount,
    bool? read,
    String? scanlator,
    int? uploadDate,
    String? url,
    Map<String, String>? meta,
  }) {
    return Chapter(
      bookmarked: bookmarked ?? this.bookmarked,
      chapterCount: chapterCount ?? this.chapterCount,
      chapterNumber: chapterNumber ?? this.chapterNumber,
      downloaded: downloaded ?? this.downloaded,
      fetchedAt: fetchedAt ?? this.fetchedAt,
      index: index ?? this.index,
      lastPageRead: lastPageRead ?? this.lastPageRead,
      lastReadAt: lastReadAt ?? this.lastReadAt,
      mangaId: mangaId ?? this.mangaId,
      name: name ?? this.name,
      pageCount: pageCount ?? this.pageCount,
      read: read ?? this.read,
      scanlator: scanlator ?? this.scanlator,
      uploadDate: uploadDate ?? this.uploadDate,
      url: url ?? this.url,
      meta: meta ?? this.meta,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bookmarked': bookmarked,
      'chapterCount': chapterCount,
      'chapterNumber': chapterNumber,
      'downloaded': downloaded,
      'fetchedAt': fetchedAt,
      'index': index,
      'lastPageRead': lastPageRead,
      'lastReadAt': lastReadAt,
      'mangaId': mangaId,
      'name': name,
      'pageCount': pageCount,
      'read': read,
      'scanlator': scanlator,
      'uploadDate': uploadDate,
      'url': url,
      'meta': meta,
    };
  }

  factory Chapter.fromMap(Map<String, dynamic> map) {
    return Chapter(
      bookmarked: map['bookmarked'],
      chapterCount: map['chapterCount']?.toInt(),
      chapterNumber: map['chapterNumber']?.toInt(),
      downloaded: map['downloaded'],
      fetchedAt: map['fetchedAt']?.toInt(),
      index: map['index']?.toInt(),
      lastPageRead: map['lastPageRead']?.toInt(),
      lastReadAt: map['lastReadAt']?.toInt(),
      mangaId: map['mangaId']?.toInt(),
      name: map['name'],
      pageCount: map['pageCount']?.toInt(),
      read: map['read'],
      scanlator: map['scanlator'],
      uploadDate: map['uploadDate']?.toInt(),
      url: map['url'],
      meta: Map<String, String>.from(map['meta']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Chapter.fromJson(String source) =>
      Chapter.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Chapter(bookmarked: $bookmarked, chapterCount: $chapterCount,'
        ' chapterNumber: $chapterNumber, downloaded: $downloaded,'
        ' fetchedAt: $fetchedAt, index: $index, lastPageRead: $lastPageRead,'
        ' lastReadAt: $lastReadAt, mangaId: $mangaId, name: $name,'
        ' pageCount: $pageCount, read: $read, scanlator: $scanlator,'
        ' uploadDate: $uploadDate, url: $url, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Chapter &&
        other.bookmarked == bookmarked &&
        other.chapterCount == chapterCount &&
        other.chapterNumber == chapterNumber &&
        other.downloaded == downloaded &&
        other.fetchedAt == fetchedAt &&
        other.index == index &&
        other.lastPageRead == lastPageRead &&
        other.lastReadAt == lastReadAt &&
        other.mangaId == mangaId &&
        other.name == name &&
        other.pageCount == pageCount &&
        other.read == read &&
        other.scanlator == scanlator &&
        other.uploadDate == uploadDate &&
        other.url == url &&
        mapEquals(other.meta, meta);
  }

  @override
  int get hashCode {
    return bookmarked.hashCode ^
        chapterCount.hashCode ^
        chapterNumber.hashCode ^
        downloaded.hashCode ^
        fetchedAt.hashCode ^
        index.hashCode ^
        lastPageRead.hashCode ^
        lastReadAt.hashCode ^
        mangaId.hashCode ^
        name.hashCode ^
        pageCount.hashCode ^
        read.hashCode ^
        scanlator.hashCode ^
        uploadDate.hashCode ^
        url.hashCode ^
        meta.hashCode;
  }
}
