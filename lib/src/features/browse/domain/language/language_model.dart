// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../../constants/language_list.dart';

part 'language_model.freezed.dart';
part 'language_model.g.dart';

@freezed
class Language with _$Language {
  factory Language({
    String? code,
    String? name,
    String? nativeName,
  }) = _Language;

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);
}

final languageMapProvider = Provider<Map<String, Language>>((ref) =>
    {for (var e in languageList) e['code'] ?? "other": Language.fromJson(e)});

final languageMapWithCustomProvider = Provider<Map<String, Language>>(
  (ref) => {
    ...ref.watch(languageMapProvider),
    for (var e in customLanguageList) e['code'] ?? "other": Language.fromJson(e)
  },
);
