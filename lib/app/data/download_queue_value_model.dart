import 'dart:convert';

import 'chapter_model.dart';
import 'manga_model.dart';

class DownloadQueueValue {
  Chapter? chapter;
  int? chapterIndex;
  Manga? manga;
  int? mangaId;
  double? progress;
  String? state;
  int? tries;
  DownloadQueueValue({
    this.chapter,
    this.chapterIndex,
    this.manga,
    this.mangaId,
    this.progress,
    this.state,
    this.tries,
  });

  DownloadQueueValue copyWith({
    Chapter? chapter,
    int? chapterIndex,
    Manga? manga,
    int? mangaId,
    double? progress,
    String? state,
    int? tries,
  }) {
    return DownloadQueueValue(
      chapter: chapter ?? this.chapter,
      chapterIndex: chapterIndex ?? this.chapterIndex,
      manga: manga ?? this.manga,
      mangaId: mangaId ?? this.mangaId,
      progress: progress ?? this.progress,
      state: state ?? this.state,
      tries: tries ?? this.tries,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chapter': chapter?.toMap(),
      'chapterIndex': chapterIndex,
      'manga': manga?.toMap(),
      'mangaId': mangaId,
      'progress': progress,
      'state': state,
      'tries': tries,
    };
  }

  factory DownloadQueueValue.fromMap(Map<String, dynamic> map) {
    return DownloadQueueValue(
      chapter: map['chapter'] != null ? Chapter.fromMap(map['chapter']) : null,
      chapterIndex: map['chapterIndex']?.toInt(),
      manga: map['manga'] != null ? Manga.fromMap(map['manga']) : null,
      mangaId: map['mangaId']?.toInt(),
      progress: map['progress']?.toDouble(),
      state: map['state'],
      tries: map['tries']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory DownloadQueueValue.fromJson(String source) =>
      DownloadQueueValue.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DownloadQueueValue(chapter: chapter, chapterIndex: $chapterIndex,'
        ' manga: manga, mangaId: $mangaId, progress: $progress,'
        ' state: $state, tries: $tries)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DownloadQueueValue &&
        other.chapter == chapter &&
        other.chapterIndex == chapterIndex &&
        other.manga == manga &&
        other.mangaId == mangaId &&
        other.progress == progress &&
        other.state == state &&
        other.tries == tries;
  }

  @override
  int get hashCode {
    return chapter.hashCode ^
        chapterIndex.hashCode ^
        manga.hashCode ^
        mangaId.hashCode ^
        progress.hashCode ^
        state.hashCode ^
        tries.hashCode;
  }
}
