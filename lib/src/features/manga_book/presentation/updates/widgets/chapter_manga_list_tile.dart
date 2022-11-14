// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '../../../../../utils/extensions/custom_extensions/bool_extensions.dart';
import '../../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../../utils/misc/custom_typedef.dart';
import '../../../../../widgets/server_image.dart';
import '../../../domain/chapter/chapter_model.dart';
import '../../../domain/chapter_page/chapter_page_model.dart';
import '../../../widgets/download_status_icon.dart';

// 📦 Package imports:

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
  final AsyncValueChanged<Chapter?> updatePair;
  final ValueChanged<ChapterMangaPair> toggleSelect;
  final bool canTapSelect;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final color = (pair.chapter?.read).ifNull() ? Colors.grey : null;
    return ListTile(
      selectedColor: context.theme.colorScheme.onSurface,
      selectedTileColor:
          context.isDarkMode ? Colors.grey.shade700 : Colors.grey.shade300,
      selected: isSelected,
      title: Text(pair.manga?.title ?? "", style: TextStyle(color: color)),
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
              chapterIndex: pair.chapter!.index!,
              updateData: updatePair,
            )
          : null,
      onTap: canTapSelect ? () => toggleSelect(pair) : null,
      onLongPress: () => toggleSelect(pair),
    );
  }
}
