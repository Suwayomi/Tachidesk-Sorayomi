// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../chapter/chapter_model.dart';
import '../manga/manga_model.dart';

part 'downloads_queue_model.freezed.dart';
part 'downloads_queue_model.g.dart';

@freezed
class DownloadsQueue with _$DownloadsQueue {
  factory DownloadsQueue({
    Chapter? chapter,
    int? chapterIndex,
    Manga? manga,
    int? mangaId,
    double? progress,
    String? state,
    int? tries,
  }) = _DownloadsQueue;

  factory DownloadsQueue.fromJson(Map<String, dynamic> json) =>
      _$DownloadsQueueFromJson(json);
}
