// 🌎 Project imports:
import '../../constants/language_list.dart';
import '../../features/browse/domain/language/language_model.dart';

class LanguageJsonConverter {
  static Language? fromJson(String? langCode) => langCode != null
      ? languageMap[langCode] ?? Language(code: langCode)
      : null;
  static String? toJson(Language? lang) => lang?.code;
}
