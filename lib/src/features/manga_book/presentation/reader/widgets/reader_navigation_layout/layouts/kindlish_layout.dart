// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

class KindlishLayout extends StatelessWidget {
  const KindlishLayout({
    Key? key,
    this.onLeftTap,
    this.onRightTap,
    this.leftColor,
    this.rightColor,
  }) : super(key: key);
  final VoidCallback? onLeftTap;
  final VoidCallback? onRightTap;
  final Color? leftColor;
  final Color? rightColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Expanded(child: SizedBox.expand()),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: onLeftTap,
                  child: Container(color: leftColor),
                ),
              ),
              Expanded(
                flex: 2,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: onRightTap,
                  child: Container(color: rightColor),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
