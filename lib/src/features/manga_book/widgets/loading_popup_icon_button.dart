// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/custom_circular_progress_indicator.dart';
import '../../../widgets/list_popup.dart';

class LoadingEnumPopupIconButton<T extends Enum> extends HookWidget {
  const LoadingEnumPopupIconButton({
    super.key,
    required this.title,
    required this.icon,
    required this.initial,
    required this.enumList,
    required this.onChanged,
  });
  final IconData icon;
  final String title;
  final T initial;
  final List<T> enumList;
  final AsyncValueSetter<T> onChanged;
  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    return IconButton(
      tooltip: title,
      icon: isLoading.value
          ? MiniCircularProgressIndicator(
              color: (icon is Icon) ? (icon as Icon).color : null,
              padding: EdgeInsets.zero,
            )
          : Icon(icon),
      onPressed: () => showDialog(
        context: context,
        builder: (context) => RadioListPopup<T>(
          title: title,
          optionList: enumList,
          value: initial,
          onChange: (enumValue) async {
            if (context.mounted) context.pop();
            isLoading.value = true;
            await onChanged(enumValue);
            isLoading.value = false;
          },
        ),
      ),
    );
  }
}
