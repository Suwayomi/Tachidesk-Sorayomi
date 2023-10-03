// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:ui';

import '../features/browse_center/domain/language/language_model.dart';

String getLanguageNameFormLocale(Locale locale) {
  String? displayName;
  final localeCode = locale.toLanguageTag().toLowerCase();
  if (languageMap[localeCode] != null) {
    displayName = languageMap[localeCode]!.displayName;
  } else if (languageMap[locale.languageCode.toLowerCase()] != null) {
    displayName = languageMap[locale.languageCode.toLowerCase()]!.displayName;
  }
  return displayName ?? locale.toLanguageTag();
}

String getLanguageNameInEnFormLocale(Locale locale) {
  String? name;
  final localeCode = locale.toLanguageTag().toLowerCase();
  if (languageMap[localeCode] != null) {
    name = languageMap[localeCode]!.name;
  } else if (languageMap[locale.languageCode.toLowerCase()] != null) {
    name = languageMap[locale.languageCode.toLowerCase()]!.name;
  }
  return name ?? locale.toLanguageTag();
}

final languageMap = {
  for (final e in customLanguageList) e['code'] ?? "other": Language.fromJson(e)
};

const customLanguageList = [
  ...languageList,
  {
    "code": 'localsourcelang',
    "name": 'Local source',
    "nativeName": 'Local source'
  },
  {"code": 'installed', "name": 'Installed', "nativeName": 'Installed'},
  {"code": "lastUsed", "name": "Last Used", "nativeName": "Last Used"},
  {
    "code": 'update',
    "name": 'Updates pending',
    "nativeName": 'Updates pending'
  },
  {"code": 'other', "name": 'other langs', "nativeName": 'Other'},
  {"code": 'all', "name": 'All', "nativeName": 'All'},
];

const languageList = [
  {"code": 'en', "name": 'English', "nativeName": 'English'},
  {"code": 'en-us', "name": 'English (US)', "nativeName": 'English (US)'},
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
  {"code": 'zh-hans', "name": 'Simplified Chinese', "nativeName": '简体中文'},
  {"code": 'zh-hant', "name": 'Traditional Chinese', "nativeName": '繁体中文'},
  {
    "code": 'zh-rhk',
    "name": 'Traditional Chinese (HK)',
    "nativeName": '繁体中文（香港）'
  },
  {
    "code": 'zh-rtw',
    "name": 'Traditional Chinese (TW)',
    "nativeName": '繁体中文（台湾）'
  },
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
  {
    "code": 'nb-no',
    "name": 'Norwegian Bokmål (Norway)',
    "nativeName": 'Norwegian Bokmål (Norway)'
  },
];
