// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../chapter/chapter_model.dart';
import '../manga/manga_model.dart';

part 'chapter_page_model.freezed.dart';
part 'chapter_page_model.g.dart';

@freezed
class ChapterMangaPair with _$ChapterMangaPair {
  factory ChapterMangaPair({
    Chapter? chapter,
    Manga? manga,
  }) = _ChapterMangaPair;

  factory ChapterMangaPair.fromJson(Map<String, dynamic> json) =>
      _$ChapterMangaPairFromJson(json);
}

@freezed
class ChapterPage with _$ChapterPage {
  factory ChapterPage({
    bool? hasNextPage,
    List<ChapterMangaPair>? page,
  }) = _ChapterPage;

  factory ChapterPage.fromJson(Map<String, dynamic> json) =>
      _$ChapterPageFromJson(json);
}
