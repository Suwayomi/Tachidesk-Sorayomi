// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_sizes.dart';
import '../../../../../i18n/locale_keys.g.dart';
import '../../../../../utils/extensions/custom_extensions.dart';
import 'manga_chapter_filter.dart';
import 'manga_chapter_sort.dart';

class MangaChapterOrganizer extends StatelessWidget {
  const MangaChapterOrganizer({
    super.key,
    /* required this.controller */
  });
  // final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
            padding: KEdgeInsets.a8.size,
            labelColor: context.theme.indicatorColor,
            unselectedLabelColor: context.textTheme.bodyLarge!.color,
            indicator: BoxDecoration(
              borderRadius: KBorderRadius.r16.radius,
              color: context.theme.indicatorColor.withOpacity(.3),
            ),
            tabs: [
              Tab(text: LocaleKeys.filter.tr()),
              Tab(text: LocaleKeys.sort.tr()),
            ]),
        body: const TabBarView(
          children: [
            MangaChapterFilter(),
            MangaChapterSort(),
          ],
        ),
      ),
    );
  }
}
