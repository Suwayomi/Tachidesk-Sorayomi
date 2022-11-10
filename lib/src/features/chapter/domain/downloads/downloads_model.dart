// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../downloads_queue/downloads_queue_model.dart';

part 'downloads_model.freezed.dart';
part 'downloads_model.g.dart';

@freezed
class Downloads with _$Downloads {
  factory Downloads({
    List<DownloadsQueue>? queue,
    String? status,
  }) = _Downloads;

  factory Downloads.fromJson(Map<String, dynamic> json) =>
      _$DownloadsFromJson(json);
}
