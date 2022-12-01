// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:freezed_annotation/freezed_annotation.dart';

import '../filter/filter_model.dart';

part 'filter_state_model.freezed.dart';
part 'filter_state_model.g.dart';

abstract class _FilterStateGeneric<T> {
  T? get state;
  String? get name;
}

@Freezed(
  unionKey: 'type',
  unionValueCase: FreezedUnionCase.pascal,
  fallbackUnion: 'separator',
)
class FilterState with _$FilterState {
  @Implements<_FilterStateGeneric<int>>()
  const factory FilterState.header({int? state, String? name}) = _Header;

  @Implements<_FilterStateGeneric<int>>()
  const factory FilterState.separator({int? state, String? name}) = _Separator;

  @Implements<_FilterStateGeneric<String>>()
  const factory FilterState.text({String? state, String? name}) = _Text;

  @Implements<_FilterStateGeneric<bool>>()
  const factory FilterState.checkBox({bool? state, String? name}) = _CheckBox;

  @Implements<_FilterStateGeneric<int>>()
  const factory FilterState.triState({int? state, String? name}) = _TriState;

  @Implements<_FilterStateGeneric<SortState>>()
  const factory FilterState.sort(
      {SortState? state, String? name, List<String>? values}) = _Sort;

  @Implements<_FilterStateGeneric<int>>()
  const factory FilterState.select({
    int? state,
    String? name,
    List<String>? displayValues,
  }) = _Select;

  @Implements<_FilterStateGeneric<List<Filter>>>()
  const factory FilterState.group({
    List<Filter>? state,
    String? name,
  }) = _Group;

  factory FilterState.fromJson(Map<String, dynamic> json) =>
      _$FilterStateFromJson(json);
}

@freezed
class SortState with _$SortState {
  factory SortState({
    int? index,
    bool? ascending,
  }) = _SortState;

  factory SortState.fromJson(Map<String, dynamic> json) =>
      _$SortStateFromJson(json);
}

@freezed
class SelectValues with _$SelectValues {
  factory SelectValues({
    String? first,
    String? second,
  }) = _SelectValues;

  factory SelectValues.fromJson(Map<String, dynamic> json) =>
      _$SelectValuesFromJson(json);
}
