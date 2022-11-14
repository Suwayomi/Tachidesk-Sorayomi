// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🌎 Project imports:
import '../../constants/language_list.dart';
import '../../features/browse_center/domain/language/language_model.dart';

class LanguageJsonConverter {
  static Language? fromJson(String? langCode) => langCode != null
      ? languageMap[langCode] ?? Language(code: langCode)
      : null;
  static String? toJson(Language? lang) => lang?.code;
}
