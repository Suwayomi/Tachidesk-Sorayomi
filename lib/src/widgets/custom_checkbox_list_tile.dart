// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/extensions/custom_extensions.dart';

/// Tri-state filter tile used across the library and chapter filter sheets.
///
/// Tristate cycle on tap: `null` (ignore) → `true` (include / require) →
/// `false` (exclude) → `null`. This matches the convention users carry over
/// from Mihon, Komikku, and Tachiyomi, where the default empty state means
/// "do not filter" and the two active states clearly distinguish include
/// from exclude with different icons.
///
/// In binary mode (`tristate: false`) the widget falls back to Flutter's
/// `CheckboxListTile`, which is what existing display-preference callers
/// (e.g. badge toggles) rely on.
class CustomCheckboxListTile<NotifierT extends AutoDisposeNotifier<bool?>>
    extends ConsumerWidget {
  const CustomCheckboxListTile({
    super.key,
    required this.title,
    required this.provider,
    required this.onChanged,
    this.tristate = true,
  });
  final String title;
  final AutoDisposeNotifierProvider<NotifierT, bool?> provider;
  final ValueChanged<bool?> onChanged;
  final bool tristate;

  static bool? _nextValue(bool? current) {
    if (current == null) return true;
    if (current == true) return false;
    return null;
  }

  Widget _tristateLeading(BuildContext context, bool? value) {
    final activeColor = context.theme.indicatorColor;
    final excludeColor = context.theme.colorScheme.error;
    if (value == null) {
      return Icon(
        Icons.check_box_outline_blank_rounded,
        color: context.theme.unselectedWidgetColor,
      );
    } else if (value == true) {
      return Icon(Icons.check_box_rounded, color: activeColor);
    } else {
      return Icon(Icons.disabled_by_default_rounded, color: excludeColor);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final val = ref.watch(provider);
    if (!tristate) {
      return CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: context.theme.indicatorColor,
        value: val.ifNull(true),
        title: Text(title),
        tristate: false,
        onChanged: onChanged,
      );
    }
    return ListTile(
      leading: _tristateLeading(context, val),
      title: Text(title),
      onTap: () => onChanged(_nextValue(val)),
    );
  }
}
