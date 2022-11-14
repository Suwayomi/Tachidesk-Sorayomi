// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '../constants/app_sizes.dart';

class CenterCircularProgressIndicator extends StatelessWidget {
  const CenterCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) =>
      const Center(child: CircularProgressIndicator());
}

class MiniCircularProgressIndicator extends StatelessWidget {
  const MiniCircularProgressIndicator({super.key, this.color, this.value});
  final Color? color;
  final double? value;
  @override
  Widget build(BuildContext context) => Padding(
        padding: KEdgeInsets.a8.size,
        child: SizedBox.square(
          dimension: 16,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            color: color,
            value: value,
          ),
        ),
      );
}
