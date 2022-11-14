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
import '../../../../../i18n/locale_keys.g.dart';
import '../../../../../utils/extensions/custom_extensions/int_extensions.dart';
import '../../../domain/chapter/chapter_model.dart';
import '../../../domain/manga/manga_model.dart';
import '../../../widgets/download_status_icon.dart';

class ChapterListTile extends StatelessWidget {
  const ChapterListTile({
    Key? key,
    required this.manga,
    required this.chapter,
    required this.updateData,
  }) : super(key: key);
  final Manga manga;
  final Chapter chapter;
  final ValueChanged<Chapter?> updateData;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        chapter.name ??
            LocaleKeys.chapterNumber.tr(
              namedArgs: {
                "number": "${chapter.chapterNumber ?? LocaleKeys.unknown.tr()}"
              },
            ),
      ),
      subtitle: chapter.uploadDate != null
          ? Text(chapter.uploadDate!.toDaysAgo)
          : null,
      trailing: (chapter.index != null && manga.id != null)
          ? DownloadStatusIcon(
              updateData: updateData,
              chapterIndex: chapter.index!,
              mangaId: manga.id!,
              isDownloaded: chapter.downloaded ?? false,
            )
          : null,
    );
  }
}
