// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../language/language_model.dart';
import '../../../../utils/misc/language_json_converter.dart';

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
    @JsonKey(
      fromJson: LanguageJsonConverter.fromJson,
      toJson: LanguageJsonConverter.toJson,
    )
        Language? lang,
    String? name,
    bool? supportsLatest,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
