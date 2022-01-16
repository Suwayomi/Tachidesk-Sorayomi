import 'dart:convert';

import 'chapter_model.dart';
import 'manga_model.dart';

class MangaPage {
  Chapter? chapter;
  Manga? manga;
  MangaPage({
    this.chapter,
    this.manga,
  });

  MangaPage copyWith({
    Chapter? chapter,
    Manga? manga,
  }) {
    return MangaPage(
      chapter: chapter ?? this.chapter,
      manga: manga ?? this.manga,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chapter': chapter?.toMap(),
      'manga': manga?.toMap(),
    };
  }

  factory MangaPage.fromMap(Map<String, dynamic> map) {
    return MangaPage(
      chapter: map['chapter'] != null ? Chapter.fromMap(map['chapter']) : null,
      manga: map['manga'] != null ? Manga.fromMap(map['manga']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MangaPage.fromJson(String source) =>
      MangaPage.fromMap(json.decode(source));

  @override
  String toString() => 'Page(chapter: $chapter, manga: $manga)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MangaPage &&
        other.chapter == chapter &&
        other.manga == manga;
  }

  @override
  int get hashCode => chapter.hashCode ^ manga.hashCode;
}
