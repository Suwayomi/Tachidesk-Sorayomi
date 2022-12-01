// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import '../utils/extensions/custom_extensions/context_extensions.dart';

class SortListTile extends StatelessWidget {
  const SortListTile({
    Key? key,
    required this.ascending,
    required this.selected,
    required this.onChanged,
    required this.onSelected,
    this.title,
    this.subtitle,
  }) : super(key: key);
  final bool ascending;
  final bool selected;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onSelected;
  final Widget? title;
  final Widget? subtitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: selected
          ? Icon(
              ascending
                  ? Icons.arrow_upward_rounded
                  : Icons.arrow_downward_rounded,
              color: context.theme.indicatorColor,
            )
          : SizedBox(width: context.theme.iconTheme.size),
      title: title,
      subtitle: subtitle,
      onTap: () => selected ? onChanged(!ascending) : onSelected(),
    );
  }
}
