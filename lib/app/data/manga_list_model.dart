import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'manga_model.dart';

class MangaListModel {
  bool? hasNextPage;
  List<Manga>? mangaList;
  MangaListModel({
    this.hasNextPage,
    this.mangaList,
  });

  MangaListModel copyWith({
    bool? hasNextPage,
    List<Manga>? mangaList,
  }) {
    return MangaListModel(
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

  factory MangaListModel.fromMap(Map<String, dynamic> map) {
    return MangaListModel(
      hasNextPage: map['hasNextPage'],
      mangaList: map['mangaList'] != null
          ? List<Manga>.from(map['mangaList']?.map((x) => Manga.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MangaListModel.fromJson(String source) =>
      MangaListModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'MangaListModel(hasNextPage: $hasNextPage, mangaList: $mangaList)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MangaListModel &&
        other.hasNextPage == hasNextPage &&
        listEquals(other.mangaList, mangaList);
  }

  @override
  int get hashCode => hasNextPage.hashCode ^ mangaList.hashCode;
}
