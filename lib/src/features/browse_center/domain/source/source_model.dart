// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../utils/freezed_converters/language_json_converter.dart';
import '../language/language_model.dart';

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
