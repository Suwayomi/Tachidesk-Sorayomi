// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../utils/misc/toast/toast.dart';
import '../../../data/downloads/downloads_repository.dart';
import '../../../domain/chapter/chapter_download_presets.dart';
import '../../../domain/chapter/chapter_model.dart';

class ChapterDownloadPresetsButton extends ConsumerWidget {
  const ChapterDownloadPresetsButton({
    super.key,
    required this.chapterList,
    required this.refresh,
  });

  /// The full (unfiltered) chapter list as the screen has it.
  final AsyncValue<List<ChapterDto>?> chapterList;

  /// Callback to re-fetch chapters after a successful enqueue.
  /// Mirrors the signature used elsewhere in manga_details_screen.
  final Future<void> Function(bool) refresh;

  Future<void> _handlePreset(
    BuildContext context,
    WidgetRef ref,
    DownloadPreset preset,
  ) async {
    final chapters = chapterList.valueOrNull ?? const [];
    final candidates = [
      for (final c in chapters)
        ChapterDownloadCandidate(
          id: c.id,
          chapterNumber: c.chapterNumber,
          isRead: c.isRead,
          isDownloaded: c.isDownloaded,
        ),
    ];

    final ids = chaptersToQueueForPreset(candidates, preset);

    if (ids.isEmpty) {
      ref.read(toastProvider)?.show(context.l10n.nothingToDownload);
      return;
    }

    final result = await AsyncValue.guard(
      () => ref
          .read(downloadsRepositoryProvider)
          .addChaptersBatchToDownloadQueue(ids),
    );
    if (context.mounted) {
      result.showToastOnError(ref.read(toastProvider));
    }
    await refresh(true);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<DownloadPreset>(
      icon: const Icon(Icons.download_outlined),
      tooltip: context.l10n.downloads,
      onSelected: (preset) => _handlePreset(context, ref, preset),
      itemBuilder: (context) => <PopupMenuEntry<DownloadPreset>>[
        PopupMenuItem(
          value: DownloadPreset.nextChapter,
          child: Text(context.l10n.downloadNextChapter),
        ),
        PopupMenuItem(
          value: DownloadPreset.next5,
          child: Text(context.l10n.downloadNextChaptersN(5)),
        ),
        PopupMenuItem(
          value: DownloadPreset.next10,
          child: Text(context.l10n.downloadNextChaptersN(10)),
        ),
        PopupMenuItem(
          value: DownloadPreset.next25,
          child: Text(context.l10n.downloadNextChaptersN(25)),
        ),
        PopupMenuItem(
          value: DownloadPreset.unread,
          child: Text(context.l10n.downloadUnreadChapters),
        ),
        PopupMenuItem(
          value: DownloadPreset.all,
          child: Text(context.l10n.downloadAllChapters),
        ),
      ],
    );
  }
}
