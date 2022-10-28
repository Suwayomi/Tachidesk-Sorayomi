// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import 'package:tachidesk_sorayomi/src/utils/misc/language_json_converter.dart';
import '../language/language_model.dart';

part 'extension_model.freezed.dart';
part 'extension_model.g.dart';

@freezed
class Extension with _$Extension {
  factory Extension({
    String? apkName,
    bool? hasUpdate,
    String? iconUrl,
    bool? installed,
    bool? isNsfw,
    @JsonKey(
      fromJson: LanguageJsonConverter.fromJson,
      toJson: LanguageJsonConverter.toJson,
    )
        Language? lang,
    String? name,
    bool? obsolete,
    String? pkgName,
    int? versionCode,
    String? versionName,
  }) = _Extension;

  factory Extension.fromJson(Map<String, dynamic> json) =>
      _$ExtensionFromJson(json);
}
