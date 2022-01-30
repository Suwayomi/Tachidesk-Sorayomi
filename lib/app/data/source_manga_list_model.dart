import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'manga_model.dart';

class SourceMangaList {
  bool? hasNextPage;
  List<Manga>? mangaList;
  SourceMangaList({
    this.hasNextPage,
    this.mangaList,
  });

  SourceMangaList copyWith({
    bool? hasNextPage,
    List<Manga>? mangaList,
  }) {
    return SourceMangaList(
      hasNextPage: hasNextPage ?? this.hasNextPage,
      mangaList: mangaList ?? this.mangaList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hasNextPage': hasNextPage,
      'mangaList': mangaList?.map((x) => x.toMap()).toList(),
    };
  }

  factory SourceMangaList.fromMap(Map<String, dynamic> map) {
    return SourceMangaList(
      hasNextPage: map['hasNextPage'],
      mangaList: map['mangaList'] != null
          ? List<Manga>.from(map['mangaList']?.map((x) => Manga.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SourceMangaList.fromJson(String source) =>
      SourceMangaList.fromMap(json.decode(source));

  @override
  String toString() =>
      'SourceManga(hasNextPage: $hasNextPage, mangaList: $mangaList)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SourceMangaList &&
        other.hasNextPage == hasNextPage &&
        listEquals(other.mangaList, mangaList);
  }

  @override
  int get hashCode => hasNextPage.hashCode ^ mangaList.hashCode;
}
