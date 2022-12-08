// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

import '../custom_circular_progress_indicator.dart';

class LoadingTextIconButton extends HookWidget {
  const LoadingTextIconButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.icon,
    this.style,
  });
  final AsyncCallback onPressed;
  final Icon icon;
  final ButtonStyle? style;
  final Widget label;
  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    return TextButton.icon(
      onPressed: isLoading.value
          ? null
          : () async {
              isLoading.value = true;
              await onPressed();
              isLoading.value = false;
            },
      icon: isLoading.value
          ? MiniCircularProgressIndicator(
              color: icon.color,
            )
          : icon,
      style: style,
      label: label,
    );
  }
}
