// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '../../../../../constants/app_sizes.dart';
import '../../../../../utils/extensions/custom_extensions/bool_extensions.dart';
import '../../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../../utils/extensions/custom_extensions/int_extensions.dart';
import '../../../../../utils/extensions/custom_extensions/string_extensions.dart';
import '../../../../../widgets/search_field.dart';
import '../../../../../widgets/sort_list_tile.dart';
import '../../../domain/filter/filter_model.dart';
import '../../../domain/filter_state/filter_state_model.dart';

class FilterToWidget extends StatelessWidget {
  const FilterToWidget({
    Key? key,
    required this.filter,
    required this.onChanged,
  }) : super(key: key);
  final Filter filter;
  final ValueChanged<Filter> onChanged;

  void onChangedFilterCopyWith<T extends FilterState>(T filterState) =>
      onChanged(filter.copyWith(filterState: filterState));

  @override
  Widget build(BuildContext context) {
    return filter.filterState?.map<Widget>(
          header: (header) => header.name.isNotBlank
              ? ListTile(
                  title: Text(header.name ?? ""),
                  dense: true,
                )
              : const SizedBox.shrink(),
          separator: (_) => const Divider(),
          text: (text) => SearchField(
            autofocus: false,
            onChanged: (val) =>
                onChangedFilterCopyWith(text.copyWith(state: val)),
            hintText: text.name,
            initialText: text.state,
          ),
          checkBox: (checkbox) => CheckboxListTile(
            value: checkbox.state ?? false,
            title: Text(checkbox.name ?? ""),
            onChanged: (value) =>
                onChangedFilterCopyWith(checkbox.copyWith(state: value)),
            controlAffinity: ListTileControlAffinity.leading,
          ),
          triState: (triState) => CheckboxListTile(
            value: triState.state.toBool,
            onChanged: (value) =>
                onChangedFilterCopyWith(triState.copyWith(state: value.toInt)),
            title: Text(triState.name ?? ""),
            controlAffinity: ListTileControlAffinity.leading,
            tristate: true,
          ),
          sort: (sort) => ExpansionTile(
            title: Text(
              sort.name ?? "",
              style: context.textTheme.labelLarge,
            ),
            children: [
              for (int i = 0; i < (sort.values?.length ?? 0); i++)
                SortListTile(
                  key: ValueKey("${sort.name}-$i"),
                  ascending: sort.state?.ascending ?? true,
                  title: Text(sort.values != null ? sort.values![i] : ""),
                  selected: i == sort.state?.index,
                  onChanged: (value) {
                    if (sort.copyWith.state == null) return;
                    onChangedFilterCopyWith(
                      sort.copyWith.state!(ascending: value),
                    );
                  },
                  onSelected: () {
                    if (sort.copyWith.state == null) return;
                    onChangedFilterCopyWith(sort.copyWith.state!(index: i));
                  },
                )
            ],
          ),
          select: (select) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListTile(
                  title: Text(
                    select.name ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: Padding(
                    padding: KEdgeInsets.h16.size,
                    child: DropdownButton(
                      icon: const Icon(Icons.keyboard_arrow_down),
                      isExpanded: true,
                      value: select.state,
                      hint: Text(select.name ?? ""),
                      items: List.generate(
                        select.displayValues?.length ?? 0,
                        (index) => index,
                      )
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  select.displayValues![e],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textTheme.bodySmall,
                                ),
                              ))
                          .toList(),
                      onChanged: (value) => onChangedFilterCopyWith(
                          select.copyWith(state: value)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          group: (group) => ExpansionTile(
            title: Text(
              group.name ?? "",
              style: context.textTheme.labelLarge,
            ),
            children: [
              for (int i = 0; i < (group.state?.length ?? 0); i++)
                FilterToWidget(
                  key: ValueKey("${group.name}-$i"),
                  filter: group.state![i],
                  onChanged: (groupFilter) => onChangedFilterCopyWith(
                    group.copyWith(
                      state: [...group.state!]
                        ..replaceRange(i, i + 1, [groupFilter]),
                    ),
                  ),
                ),
            ],
          ),
        ) ??
        const SizedBox.shrink();
  }
}
