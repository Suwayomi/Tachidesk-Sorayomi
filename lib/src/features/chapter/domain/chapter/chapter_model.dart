// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter_model.freezed.dart';
part 'chapter_model.g.dart';

@freezed
class Chapter with _$Chapter {
  factory Chapter({
    bool? bookmarked,
    int? chapterCount,
    double? chapterNumber,
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
  }) = _Chapter;

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);
}
