// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'source_model.freezed.dart';
part 'source_model.g.dart';

@freezed
class Source with _$Source {
  factory Source({
    String? displayName,
    String? iconUrl,
    String? id,
    bool? isConfigurable,
    bool? isNsfw,
    String? lang,
    String? name,
    bool? supportsLatest,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
