// Copyright (c) 2023 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'source_preference_prop.freezed.dart';
part 'source_preference_prop.g.dart';

@Freezed(
  unionKey: 'type',
  unionValueCase: FreezedUnionCase.pascal,
  fallbackUnion: 'fallback',
)
sealed class SourcePreferenceProp with _$SourcePreferenceProp {
  const factory SourcePreferenceProp.fallback({
    String? key,
    dynamic currentValue,
  }) = Fallback;

  const factory SourcePreferenceProp.checkBoxPreference({
    String? key,
    String? title,
    String? summary,
    bool? defaultValue,
    bool? currentValue,
    String? defaultValueType,
  }) = CheckBoxPreference;

  const factory SourcePreferenceProp.switchPreferenceCompat({
    String? key,
    String? title,
    String? summary,
    bool? defaultValue,
    bool? currentValue,
    String? defaultValueType,
  }) = SwitchPreferenceCompat;

  const factory SourcePreferenceProp.listPreference({
    String? key,
    String? title,
    String? summary,
    String? defaultValue,
    String? currentValue,
    String? defaultValueType,
    Map<String, String>? entries,
  }) = ListPreference;

  const factory SourcePreferenceProp.multiSelectListPreference({
    String? key,
    String? title,
    String? summary,
    List<String>? defaultValue,
    List<String>? currentValue,
    String? defaultValueType,
    Map<String, String>? entries,
  }) = MultiSelectListPreference;

  const factory SourcePreferenceProp.editTextPreference({
    String? key,
    String? title,
    String? summary,
    String? defaultValue,
    String? currentValue,
    String? defaultValueType,
    String? dialogTitle,
    String? dialogMessage,
    String? text,
  }) = EditTextPreference;

  factory SourcePreferenceProp.fromJson(Map<String, dynamic> json) =>
      _$SourcePreferencePropFromJson(json);
}
