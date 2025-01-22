// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import '../../../../graphql/__generated__/schema.graphql.dart';
import 'graphql/__generated__/fragment.graphql.dart';

typedef Filter = Fragment$FilterDto;

typedef FilterHeader = Fragment$FilterDto$$HeaderFilter;

typedef FilterSeparator = Fragment$FilterDto$$SeparatorFilter;

typedef FilterText = Fragment$FilterDto$$TextFilter;

typedef FilterCheckBox = Fragment$FilterDto$$CheckBoxFilter;

typedef FilterTriState = Fragment$FilterDto$$TriStateFilter;

typedef FilterSort = Fragment$FilterDto$$SortFilter;

typedef FilterSelect = Fragment$FilterDto$$SelectFilter;

typedef FilterGroup = Fragment$FilterDto$$GroupFilter;

typedef TriState = Enum$TriState;

typedef FilterChange = Input$FilterChangeInput;

typedef SortStateChange = Input$SortSelectionInput;

typedef SortState = Enum$SortOrder;

extension TriStateExtension on TriState {
  bool? get toBool => switch (this) {
        TriState.IGNORE => null,
        Enum$TriState.INCLUDE => true,
        Enum$TriState.EXCLUDE => false,
        Enum$TriState.$unknown => throw UnimplementedError(),
      };

  static TriState fromBool(bool? value) => switch (value) {
        true => TriState.INCLUDE,
        false => TriState.EXCLUDE,
        null => TriState.IGNORE,
      };
}

extension SortStateExtension on SortState {
  bool get ascending => switch (this) {
        SortState.ASC ||
        SortState.ASC_NULLS_FIRST ||
        SortState.ASC_NULLS_LAST =>
          true,
        SortState.DESC ||
        SortState.DESC_NULLS_FIRST ||
        SortState.DESC_NULLS_LAST =>
          false,
        SortState.$unknown => throw UnimplementedError(),
      };
}
