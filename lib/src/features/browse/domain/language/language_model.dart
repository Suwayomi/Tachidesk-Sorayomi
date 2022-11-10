// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_model.freezed.dart';
part 'language_model.g.dart';

@freezed
class Language with _$Language {
  Language._();
  factory Language({
    String? code,
    String? name,
    String? nativeName,
  }) = _Language;

  String? get displayName => nativeName ?? name ?? code;

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);
}
