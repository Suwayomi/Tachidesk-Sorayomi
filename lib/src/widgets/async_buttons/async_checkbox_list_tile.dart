// Copyright (c) 2023 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../utils/extensions/custom_extensions.dart';

class AsyncCheckboxListTile extends HookWidget {
  const AsyncCheckboxListTile({
    super.key,
    required this.value,
    this.onChanged,
    required this.title,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;
  final Widget title;
  @override
  Widget build(BuildContext context) {
    final localValue = useState(value);
    return CheckboxListTile(
      value: localValue.value,
      onChanged: onChanged != null
          ? (val) {
              localValue.value = val.ifNull();
              onChanged!(val.ifNull());
            }
          : null,
      title: title,
    );
  }
}
