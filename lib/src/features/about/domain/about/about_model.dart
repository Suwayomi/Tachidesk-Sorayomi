// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_model.freezed.dart';
part 'about_model.g.dart';

@freezed
class About with _$About {
  const factory About({
    String? name,
    String? version,
    String? revision,
    String? buildType,
    int? buildTime,
    String? github,
    String? discord,
  }) = _About;

  factory About.fromJson(Map<String, dynamic> json) => _$AboutFromJson(json);
}
