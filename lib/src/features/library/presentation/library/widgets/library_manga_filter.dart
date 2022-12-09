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
import '../controller/library_controller.dart';

class LibraryMangaFilter extends ConsumerWidget {
  const LibraryMangaFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        CustomCheckboxListTile(
          title: LocaleKeys.unread.tr(),
          provider: libraryMangaFilterUnreadProvider,
          onChanged: ref.read(libraryMangaFilterUnreadProvider.notifier).update,
        ),
        CustomCheckboxListTile(
          title: LocaleKeys.completed.tr(),
          provider: libraryMangaFilterCompletedProvider,
          onChanged:
              ref.read(libraryMangaFilterCompletedProvider.notifier).update,
        ),
        CustomCheckboxListTile(
          title: LocaleKeys.downloaded.tr(),
          provider: libraryMangaFilterDownloadedProvider,
          onChanged:
              ref.read(libraryMangaFilterDownloadedProvider.notifier).update,
        ),
      ],
    );
  }
}
