// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';

// 🌎 Project imports:
import '../../../../../constants/app_sizes.dart';
import '../../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../../i18n/locale_keys.g.dart';
import '../../../../../utils/extensions/custom_extensions/int_extensions.dart';
import '../../../domain/chapter/chapter_model.dart';
import '../../../domain/chapter_page/chapter_page_model.dart';
import '../../../domain/manga/manga_model.dart';
import '../../../widgets/download_status_icon.dart';

class ChapterListTile extends StatelessWidget {
  const ChapterListTile({
    Key? key,
    required this.manga,
    required this.chapter,
    required this.updateData,
    required this.toggleSelect,
    this.canTapSelect = false,
    this.isSelected = false,
  }) : super(key: key);
  final Manga manga;
  final Chapter chapter;
  final VoidCallback updateData;
  final ValueChanged<ChapterMangaPair> toggleSelect;
  final bool canTapSelect;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return ListTile(
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
            ? Text(
                chapter.uploadDate!.toDaysAgo,
                style: TextStyle(
                    color: chapter.read ?? false ? Colors.grey : null),
              )
            : null,
        trailing: (chapter.index != null && manga.id != null)
            ? DownloadStatusIcon(
                updateData: (_) => updateData,
                chapter: chapter,
                mangaId: manga.id!,
                isDownloaded: chapter.downloaded ?? false,
                needUpdatedChapter: false,
              )
            : null,
        selectedColor: context.theme.colorScheme.onSurface,
        selectedTileColor:
            context.isDarkMode ? Colors.grey.shade700 : Colors.grey.shade300,
        selected: isSelected,
        onTap: canTapSelect
            ? () =>
                toggleSelect(ChapterMangaPair(chapter: chapter, manga: manga))
            : null,
        onLongPress: () =>
            toggleSelect(ChapterMangaPair(chapter: chapter, manga: manga)));
  }
}
