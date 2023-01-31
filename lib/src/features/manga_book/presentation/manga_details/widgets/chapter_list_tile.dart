// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/app_sizes.dart';
import '../../../../../i18n/locale_keys.g.dart';
import '../../../../../routes/router_config.dart';
import '../../../../../utils/extensions/custom_extensions.dart';
import '../../../domain/chapter/chapter_model.dart';
import '../../../domain/manga/manga_model.dart';
import '../../../widgets/download_status_icon.dart';

class ChapterListTile extends StatelessWidget {
  const ChapterListTile({
    super.key,
    required this.manga,
    required this.chapter,
    required this.updateData,
    required this.toggleSelect,
    this.canTapSelect = false,
    this.isSelected = false,
  });
  final Manga manga;
  final Chapter chapter;
  final AsyncCallback updateData;
  final ValueChanged<Chapter> toggleSelect;
  final bool canTapSelect;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onSecondaryTap: () => toggleSelect(chapter),
      child: ListTile(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (chapter.bookmarked ?? false) ...[
              Icon(
                Icons.bookmark,
                color: chapter.read ?? false ? Colors.grey : context.iconColor,
                size: 20,
              ),
              KSizedBox.w4.size,
            ],
            Expanded(
              child: Text(
                chapter.name ??
                    LocaleKeys.chapterNumber.tr(
                      namedArgs: {
                        "number":
                            "${chapter.chapterNumber ?? LocaleKeys.unknown.tr()}"
                      },
                    ),
                style: TextStyle(
                  color: chapter.read ?? false ? Colors.grey : null,
                ),
              ),
            ),
          ],
        ),
        subtitle: chapter.uploadDate != null
            ? Row(
                children: [
                  Text(
                    chapter.uploadDate!.toDaysAgo,
                    style: TextStyle(
                      color: chapter.read ?? false ? Colors.grey : null,
                    ),
                  ),
                  if (!chapter.read.ifNull() &&
                      (chapter.lastPageRead).ifNullOrNegative() != 0)
                    Text(
                      " • ${LocaleKeys.page.tr(
                        namedArgs: {
                          "number":
                              "${chapter.lastPageRead.ifNullOrNegative() + 1}"
                        },
                      )}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                ],
              )
            : null,
        trailing: (chapter.index != null && manga.id != null)
            ? DownloadStatusIcon(
                updateData: updateData,
                chapter: chapter,
                mangaId: manga.id!,
                isDownloaded: chapter.downloaded ?? false,
              )
            : null,
        selectedColor: context.theme.colorScheme.onSurface,
        selectedTileColor:
            context.isDarkMode ? Colors.grey.shade700 : Colors.grey.shade300,
        selected: isSelected,
        onTap: canTapSelect
            ? () => toggleSelect(chapter)
            : () => context.push(
                  Routes.getReader(
                    "${manga.id}",
                    "${chapter.index}",
                  ),
                ),
        onLongPress: () => toggleSelect(chapter),
      ),
    );
  }
}
