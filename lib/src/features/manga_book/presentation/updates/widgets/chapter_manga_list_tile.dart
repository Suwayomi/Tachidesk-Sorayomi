// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_sizes.dart';
import '../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../widgets/server_image.dart';
import '../../../domain/chapter/chapter_model.dart';
import '../../../domain/chapter_page/chapter_page_model.dart';
import '../../../widgets/download_status_icon.dart';

class ChapterMangaListTile extends StatelessWidget {
  const ChapterMangaListTile({
    super.key,
    required this.pair,
    required this.updatePair,
    required this.toggleSelect,
    this.canTapSelect = false,
    this.isSelected = false,
  });
  final ChapterMangaPair pair;
  final AsyncCallback updatePair;
  final ValueChanged<Chapter> toggleSelect;
  final bool canTapSelect;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final color = (pair.chapter?.read).ifNull() ? Colors.grey : null;
    return ListTile(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (pair.chapter?.bookmarked ?? false) ...[
            const Icon(Icons.bookmark, size: 20),
            KSizedBox.w4.size,
          ],
          Expanded(
            child: Text(
              pair.manga?.title ?? "",
              style: TextStyle(color: color),
            ),
          ),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ServerImage(
          imageUrl: pair.manga?.thumbnailUrl ?? "",
          size: const Size.square(48),
        ),
      ),
      subtitle: Text(
        pair.chapter?.name ?? pair.chapter?.chapterNumber.toString() ?? "",
        style: TextStyle(color: color),
      ),
      trailing: (pair.manga?.id != null && pair.chapter?.index != null)
          ? DownloadStatusIcon(
              isDownloaded: pair.chapter?.downloaded ?? false,
              mangaId: pair.manga!.id!,
              chapter: pair.chapter!,
              updateData: updatePair,
            )
          : null,
      selectedColor: context.theme.colorScheme.onSurface,
      selectedTileColor:
          context.isDarkMode ? Colors.grey.shade700 : Colors.grey.shade300,
      selected: isSelected,
      onTap: canTapSelect && pair.chapter != null
          ? () => toggleSelect(pair.chapter!)
          : null,
      onLongPress:
          pair.chapter != null ? () => toggleSelect(pair.chapter!) : null,
    );
  }
}
