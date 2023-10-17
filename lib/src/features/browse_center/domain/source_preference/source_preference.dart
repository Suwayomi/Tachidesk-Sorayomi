// Copyright (c) 2023 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:freezed_annotation/freezed_annotation.dart';

import '../source_preference_prop/source_preference_prop.dart';

part 'source_preference.freezed.dart';
part 'source_preference.g.dart';

@freezed
class SourcePreference with _$SourcePreference {
  factory SourcePreference({
    String? type,
    @JsonKey(readValue: SourcePreference.propsFromJson, name: 'props')
    SourcePreferenceProp? sourcePreferenceProp,
  }) = _SourcePreference;

  factory SourcePreference.fromJson(Map<String, dynamic> json) =>
      _$SourcePreferenceFromJson(json);

  static Map<String, dynamic> propsFromJson(
      Map<dynamic, dynamic> json, String str) {
    final props = json['props'];
    final type = json['type'];
    if (type == 'MultiSelectListPreference' || type == 'ListPreference') {
      final entries = props['entries'];
      final entryValues = props['entryValues'];
      if (entries != null &&
          entries is List &&
          entryValues != null &&
          entryValues is List) {
        props['entries'] = Map<String, String>.fromIterables(
          entryValues.map((e) => e.toString()),
          entries.map((e) => e.toString()),
        );
      }
    }
    return {
      'type': json['type'],
      if (props is Map<String, dynamic>) ...props,
    };
  }
}
