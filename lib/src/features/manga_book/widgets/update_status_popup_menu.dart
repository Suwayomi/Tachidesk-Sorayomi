// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../constants/app_sizes.dart';
import '../../../i18n/locale_keys.g.dart';
import '../data/manga_book_repository.dart';
import 'update_status_summary_sheet.dart';

class UpdateStatusPopupMenu extends ConsumerWidget {
  const UpdateStatusPopupMenu({
    Key? key,
    this.getCategoryId,
    this.showSummaryButton = true,
  }) : super(key: key);
  final int? Function()? getCategoryId;
  final bool showSummaryButton;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert_rounded),
      shape: RoundedRectangleBorder(borderRadius: KBorderRadius.r16.radius),
      itemBuilder: (context) {
        final categoryId = getCategoryId != null ? getCategoryId!() : null;
        return [
          if (categoryId != null && categoryId != 0)
            PopupMenuItem(
              child: Text(LocaleKeys.categoryUpdate.tr()),
              onTap: () => ref
                  .read(mangaBookRepositoryProvider)
                  .fetchUpdates(categoryId: categoryId),
            ),
          PopupMenuItem(
            onTap: ref.read(mangaBookRepositoryProvider).fetchUpdates,
            child: Text(LocaleKeys.globalUpdate.tr()),
          ),
          if (showSummaryButton)
            PopupMenuItem(
              onTap: () => Future.microtask(
                  () => showUpdateStatusSummaryBottomSheet(context)),
              child: Text(
                LocaleKeys.updatesSummary.tr(),
              ),
            ),
        ];
      },
    );
  }
}
