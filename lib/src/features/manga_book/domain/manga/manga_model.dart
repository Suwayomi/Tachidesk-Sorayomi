// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../../../browse_center/domain/source/source_model.dart';

part 'manga_model.freezed.dart';
part 'manga_model.g.dart';

@freezed
class Manga with _$Manga {
  factory Manga({
    String? artist,
    String? author,
    String? description,
    int? downloadCount,
    int? chapterCount,
    int? lastChapterRead,
    bool? freshData,
    List<String>? genre,
    bool? inLibrary,
    int? id,
    int? inLibraryAt,
    bool? initialized,
    String? realUrl,
    Source? source,
    String? sourceId,
    String? status,
    String? thumbnailUrl,
    String? title,
    int? unreadCount,
    int? lastFetchedAt,
    int? chaptersLastFetchedAt,
    String? url,
    Map<String, dynamic>? meta,
  }) = _Manga;

  factory Manga.fromJson(Map<String, dynamic> json) => _$MangaFromJson(json);
}
