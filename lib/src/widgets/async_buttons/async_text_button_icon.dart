// Copyright (c) 2023 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AsyncTextButtonIcon extends HookWidget {
  const AsyncTextButtonIcon({
    super.key,
    required this.isPrimary,
    this.onPressed,
    required this.primaryIcon,
    required this.primaryLabel,
    this.primaryStyle,
    this.secondaryIcon,
    this.secondaryLabel,
    this.secondaryStyle,
  });

  final bool isPrimary;
  final VoidCallback? onPressed;
  final Widget primaryIcon;
  final Widget primaryLabel;
  final Widget? secondaryIcon;
  final Widget? secondaryLabel;
  final ButtonStyle? primaryStyle;
  final ButtonStyle? secondaryStyle;

  @override
  Widget build(BuildContext context) {
    final isLocalPrimary = useState(isPrimary);
    return TextButton.icon(
      style: isLocalPrimary.value ? primaryStyle : secondaryStyle,
      onPressed: onPressed != null
          ? () {
              isLocalPrimary.value = (!isLocalPrimary.value);
              onPressed!();
            }
          : null,
      icon: (secondaryIcon != null && !isLocalPrimary.value)
          ? secondaryIcon!
          : primaryIcon,
      label: (secondaryLabel != null && !isLocalPrimary.value)
          ? secondaryLabel!
          : primaryLabel,
    );
  }
}
