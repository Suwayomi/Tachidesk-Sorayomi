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
import '../../../../../constants/enum.dart';
import '../../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../controller/manga_details_controller.dart';

class MangaChapterSortTile extends ConsumerWidget {
  const MangaChapterSortTile({
    super.key,
    required this.sortType,
  });
  final ChapterSort sortType;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortedBy = ref.watch(mangaChapterSortProvider);
    final sortedDirection = ref.watch(mangaChapterSortDirectionProvider);
    return ListTile(
      leading: sortType == sortedBy
          ? Icon(
              sortedDirection ?? true
                  ? Icons.arrow_downward_rounded
                  : Icons.arrow_upward_rounded,
              color: context.theme.indicatorColor,
            )
          : SizedBox(width: context.theme.iconTheme.size),
      title: Text(sortType.toString().tr()),
      onTap: () {
        if (sortedBy == sortType) {
          ref
              .read(mangaChapterSortDirectionProvider.notifier)
              .update(!(sortedDirection ?? false));
        } else {
          ref.read(mangaChapterSortProvider.notifier).update(sortType);
        }
      },
    );
  }
}
