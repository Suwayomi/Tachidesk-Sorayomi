// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../i18n/locale_keys.g.dart';
import '../../../../../widgets/custom_checkbox_list_tile.dart';
import '../controller/manga_details_controller.dart';

class MangaChapterFilter extends ConsumerWidget {
  const MangaChapterFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        const Divider(height: .5),
        CustomCheckboxListTile(
          title: LocaleKeys.unread.tr(),
          provider: mangaChapterFilterUnreadProvider,
          onChanged: ref.read(mangaChapterFilterUnreadProvider.notifier).update,
        ),
        CustomCheckboxListTile(
          title: LocaleKeys.bookmarked.tr(),
          provider: mangaChapterFilterBookmarkedProvider,
          onChanged:
              ref.read(mangaChapterFilterBookmarkedProvider.notifier).update,
        ),
        CustomCheckboxListTile(
          title: LocaleKeys.downloaded.tr(),
          provider: mangaChapterFilterDownloadedProvider,
          onChanged:
              ref.read(mangaChapterFilterDownloadedProvider.notifier).update,
        ),
      ],
    );
  }
}
