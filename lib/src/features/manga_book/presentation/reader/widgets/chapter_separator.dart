// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import '../../../../../constants/app_sizes.dart';
import '../../../../../utils/extensions/custom_extensions.dart';

class ChapterSeparator extends StatelessWidget {
  const ChapterSeparator({super.key, required this.title, required this.name});
  final String title;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        KSizedBox.h16.size,
        Text(
          "$title:",
          style: context.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          name,
          style: context.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
        ),
        KSizedBox.h16.size,
      ],
    );
  }
}
