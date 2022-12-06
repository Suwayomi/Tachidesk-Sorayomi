// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../filter_state/filter_state_model.dart';

part 'filter_model.freezed.dart';
part 'filter_model.g.dart';

@freezed
class Filter with _$Filter {
  factory Filter({
    String? type,
    @JsonKey(readValue: Filter.filterFromJson, name: 'filter')
        FilterState? filterState,
  }) = _Filter;

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);

  static Map<String, dynamic> filterFromJson(
      Map<dynamic, dynamic> json, String str) {
    final filter = json['filter'];
    return {
      'type': json['type'],
      if (filter is Map<String, dynamic>) ...filter,
    };
  }

  static List<Map<String, dynamic>> filtersToJson(List<Filter> filters) {
    final jsonFilter = <Map<String, dynamic>>[];
    for (int i = 0; i < filters.length; i++) {
      final map = Filter.customFilterToJson(filters[i], i);
      if (map != null) jsonFilter.addAll(map);
    }
    return jsonFilter;
  }

  static List<Map<String, dynamic>>? customFilterToJson(
      Filter filter, int position) {
    return filter.filterState?.maybeWhen(
      group: (state, name) => [
        for (int i = 0; i < (state?.length ?? 0); i++)
          {
            "position": position,
            "state": json.encode(customFilterToJson(state![i], i)?.first),
          },
      ],
      orElse: () => [
        {
          "position": position,
          "state": json.encode(filter.filterState?.toJson()["state"])
        }
      ],
    );
  }
}
