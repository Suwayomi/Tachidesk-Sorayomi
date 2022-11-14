// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 📦 Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// 🌎 Project imports:
import '../../../../utils/misc/language_json_converter.dart';
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
