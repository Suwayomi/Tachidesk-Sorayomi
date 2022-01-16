class Language {
  String code;
  String name;
  String nativeName;
  Language({
    required this.code,
    required this.name,
    required this.nativeName,
  });

  Language copyWith({
    String? code,
    String? name,
    String? nativeName,
  }) {
    return Language(
      code: code ?? this.code,
      name: name ?? this.name,
      nativeName: nativeName ?? this.nativeName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'nativeName': nativeName,
    };
  }

  factory Language.fromMap(Map<String, dynamic> map) {
    return Language(
      code: map['code'] ?? '',
      name: map['name'] ?? '',
      nativeName: map['nativeName'] ?? '',
    );
  }

  @override
  String toString() =>
      'Language(code: $code, name: $name, nativeName: $nativeName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Language &&
        other.code == code &&
        other.name == name &&
        other.nativeName == nativeName;
  }

  @override
  int get hashCode => code.hashCode ^ name.hashCode ^ nativeName.hashCode;
}

List<Map<String, String>> iSOLanguageMap = [
  {"code": 'all', "name": 'All', "nativeName": 'All'},
  {"code": 'installed', "name": 'Installed', "nativeName": 'Installed'},
  {
    "code": 'updates pending',
    "name": 'Updates pending',
    "nativeName": 'Updates pending'
  },
  {"code": 'other', "name": 'other langs?', "nativeName": 'Other'},
  {
    "code": 'localsourcelang',
    "name": 'Local source',
    "nativeName": 'Local source'
  },
  {"code": 'en', "name": 'English', "nativeName": 'English'},
  {"code": 'ca', "name": 'Catalan; Valencian', "nativeName": 'Català'},
  {"code": 'de', "name": 'German', "nativeName": 'Deutsch'},
  {"code": 'es', "name": 'Spanish; Castilian', "nativeName": 'Español'},
  {
    "code": 'es-419',
    "name": 'Spanish; Castilian',
    "nativeName": 'Español (Latinoamérica)'
  },
  {"code": 'fr', "name": 'French', "nativeName": 'Français'},
  {"code": 'id', "name": 'Indonesian', "nativeName": 'Indonesia'},
  {"code": 'it', "name": 'Italian', "nativeName": 'Italiano'},
  {"code": 'pt', "name": 'Portuguese', "nativeName": 'Português'},
  {"code": 'pt-pt', "name": 'Portuguese', "nativeName": 'Português (Portugal)'},
  {
    "code": 'pt-br',
    "name": 'Portuguese; Brasil',
    "nativeName": 'Português (Brasil)'
  },
  {"code": 'vi', "name": 'Vietnamese', "nativeName": 'Tiếng Việt'},
  {"code": 'tr', "name": 'Turkish', "nativeName": 'Türkçe'},
  {"code": 'ru', "name": 'Russian', "nativeName": 'русский'},
  {"code": 'ar', "name": 'Arabic', "nativeName": 'العربية'},
  {"code": 'hi', "name": 'Hindi', "nativeName": 'हिन्दी'},
  {"code": 'th', "name": 'Thai', "nativeName": 'ไทย'},
  {"code": 'zh', "name": 'Chinese', "nativeName": '中文'},
  {"code": 'zh-hans', "name": 'Chinese', "nativeName": '中文 (HANS)'},
  {"code": 'zh-hant', "name": 'Chinese', "nativeName": '中文 (HANT)'},
  {"code": 'zh-rhk', "name": 'Chinese', "nativeName": '中文 (RHK)'},
  {"code": 'zh-rtw', "name": 'Chinese', "nativeName": '中文 (RTW)'},
  {"code": 'ja', "name": 'Japanese', "nativeName": '日本語'},
  {"code": 'ko', "name": 'Korean', "nativeName": '한국어'},
  {"code": 'zu', "name": 'Zulu', "nativeName": 'isiZulu'},
  {"code": 'xh', "name": 'Xhosa', "nativeName": 'isiXhosa'},
  {"code": 'uk', "name": 'Ukrainian', "nativeName": 'Українська'},
  {"code": 'ro', "name": 'Romanian', "nativeName": 'Română'},
  {"code": 'bg', "name": 'Bulgarian', "nativeName": 'български'},
  {"code": 'cs', "name": 'Czech', "nativeName": 'čeština'},
  {"code": 'pl', "name": 'Polish', "nativeName": 'polski'},
  {"code": 'no', "name": 'Norwegian', "nativeName": 'Norsk'},
  {"code": 'nl', "name": 'Dutch', "nativeName": 'Nederlands'},
  {"code": 'my', "name": 'Burmese', "nativeName": 'ဗမာစာ'},
  {"code": 'ms', "name": 'Malay', "nativeName": 'Malaysia'},
  {"code": 'mn', "name": 'Mongolian', "nativeName": 'Монгол'},
  {"code": 'ml', "name": 'Malayalam', "nativeName": 'മലയാളം'},
  {"code": 'ku', "name": 'Kurdish', "nativeName": 'Kurdî'},
  {"code": 'hu', "name": 'Hungarian', "nativeName": 'Magyar'},
  {"code": 'hr', "name": 'Croatian', "nativeName": 'Hrvatski'},
  {"code": 'he', "name": 'Hebrew', "nativeName": 'עברית'},
  {"code": 'fil', "name": 'Filipino', "nativeName": 'Filipino'},
  {"code": 'fi', "name": 'Finnish', "nativeName": 'suomi'},
  {"code": 'fa', "name": 'Persian', "nativeName": 'فارسی'},
  {"code": 'eu', "name": 'Basque', "nativeName": 'euskara'},
  {"code": 'el', "name": 'Greek', "nativeName": 'Ελληνικά'},
  {"code": 'da', "name": 'Danish', "nativeName": 'dansk'},
  {"code": 'bn', "name": 'Bengali', "nativeName": 'বাংলা'},
  {"code": 'lt', "name": 'Lithuanian', "nativeName": 'lietuvių kalba'},
  {"code": 'sh', "name": 'Serbo-Croatian', "nativeName": 'srpskohrvatski'},
  {"code": 'af', "name": 'Afrikaans', "nativeName": 'Afrikaans'},
  {"code": 'am', "name": 'Amharic', "nativeName": 'አማርኛ'},
  {"code": 'az', "name": 'Azerbaijani', "nativeName": 'Azərbaycan'},
  {"code": 'be', "name": 'Belarusian', "nativeName": 'беларуская'},
  {"code": 'bs', "name": 'Bosnian', "nativeName": 'bosanski'},
  {"code": 'sv', "name": 'Swedish', "nativeName": 'svenska'},
  {"code": 'sv', "name": 'Swedish', "nativeName": 'svenska'},
];
List<Language> iSOLanguages = iSOLanguageMap.map<Language>(
  (map) => Language.fromMap(map),
).toList();
Language langCodeToName(String code) {
  final int whereToCut = code.contains('-') ? code.indexOf('-') : code.length;

  final String proccessedCode = code.toLowerCase().substring(0, whereToCut);

  return iSOLanguages.firstWhere(
      (language) =>
          language.code == proccessedCode ||
          language.code == code.toLowerCase(),
      orElse: () =>
          iSOLanguages.firstWhere((element) => element.code == "other"));
}

Language defaultNativeLang() {
  return iSOLanguages.firstWhere(
      (element) => element.code == "en"); // TODO: infer from the browser
}

List<Language> extensionDefaultLangs() {
  return [
    defaultNativeLang(),
    iSOLanguages.firstWhere((element) => element.code == "all"),
  ];
}

List<Language> sourceDefualtLangs() {
  return [
    defaultNativeLang(),
    iSOLanguages.firstWhere((element) => element.code == "localsourcelang"),
  ];
}

List<Language> sourceForcedDefaultLangs(){
    return [
    iSOLanguages.firstWhere((element) => element.code == "localsourcelang"),
    ];
}

int langSortCmp(String a, String b){
    // puts english first for convience
    final aLang = langCodeToName(a);
    final bLang = langCodeToName(b);

    if (a == 'en') return -1;
    if (b == 'en') return 1;
    if (a == 'localSourceLang') return 1;
    if (b == 'localSourceLang') return -1;

    return aLang.nativeName.compareTo(bLang.nativeName);
}