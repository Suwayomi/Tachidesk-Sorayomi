// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🎯 Dart imports:
import 'dart:math';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';

// 🌎 Project imports:
import '../constants/app_sizes.dart';
import '../utils/extensions/custom_extensions/context_extensions.dart';
import '../utils/extensions/custom_extensions/string_extensions.dart';

const errorFaces = [
  '(･o･;)',
  'Σ(ಠ_ಠ)',
  'ಥ_ಥ',
  '(˘･_･˘)',
  '(；￣Д￣)',
  '(･Д･。',
];

class Emoticons extends HookWidget {
  const Emoticons({
    super.key,
    this.text,
    this.button,
    this.iconData,
  });
  final String? text;
  final IconData? iconData;
  final Widget? button;

  @override
  Widget build(BuildContext context) {
    final errorNumber = useMemoized(() => Random().nextInt(errorFaces.length));
    return Padding(
      padding: KEdgeInsets.a8.size,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconData != null
                ? Icon(iconData, size: context.height * .2)
                : Text(
                    errorFaces[errorNumber],
                    textAlign: TextAlign.center,
                    style: context.textTheme.displayMedium,
                  ),
            KSizedBox.h16.size,
            if (text.isNotBlank)
              Text(
                text!,
                textAlign: TextAlign.center,
                style: context.textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            if (button != null) button!,
          ],
        ),
      ),
    );
  }
}
