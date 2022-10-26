import 'package:freezed_annotation/freezed_annotation.dart';

part 'source_model.freezed.dart';
part 'source_model.g.dart';

@freezed
class Source with _$Source {
  factory Source({
    String? id,
    String? name,
    String? lang,
    String? iconUrl,
    bool? supportsLatest,
    bool? isConfigurable,
    bool? isNsfw,
    String? displayName,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
