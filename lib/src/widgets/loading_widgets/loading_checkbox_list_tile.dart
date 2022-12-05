// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

import '../custom_circular_progress_indicator.dart';

class LoadingCheckboxListTile extends HookWidget {
  const LoadingCheckboxListTile({
    Key? key,
    required this.onChanged,
    required this.value,
    required this.title,
  }) : super(key: key);

  final AsyncValueSetter<bool> onChanged;
  final bool value;
  final String title;
  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    asyncOnChanged(value) async {
      isLoading.value = true;
      await onChanged(value ?? false);
      isLoading.value = false;
    }

    return ListTile(
      leading: isLoading.value
          ? const MiniCircularProgressIndicator()
          : Checkbox(
              onChanged: (_) => asyncOnChanged(!value),
              value: value,
            ),
      onTap: isLoading.value ? null : () => asyncOnChanged(!value),
      title: Text(title),
    );
  }
}
