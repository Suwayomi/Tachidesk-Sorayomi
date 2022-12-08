// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

class EdgeLayout extends StatelessWidget {
  const EdgeLayout({
    super.key,
    this.onLeftTap,
    this.onRightTap,
    this.leftColor,
    this.rightColor,
  });
  final VoidCallback? onLeftTap;
  final VoidCallback? onRightTap;
  final Color? leftColor;
  final Color? rightColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onRightTap,
            child: Container(color: rightColor),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const Expanded(
                flex: 2,
                child: SizedBox.expand(),
              ),
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: onLeftTap,
                  child: Container(color: leftColor),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onRightTap,
            child: Container(color: rightColor),
          ),
        ),
      ],
    );
  }
}
