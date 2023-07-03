// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/app_sizes.dart';

import '../../../../utils/extensions/custom_extensions.dart';
import '../../../../utils/misc/toast/toast.dart';
import '../../../../widgets/emoticons.dart';
import '../../data/downloads/downloads_repository.dart';
import '../../domain/downloads/downloads_model.dart';
import 'widgets/download_progress_list_tile.dart';
import 'widgets/downloads_fab.dart';

class DownloadsScreen extends ConsumerWidget {
  const DownloadsScreen({super.key});

  bool showFab(AsyncValue<Downloads> downloads) =>
      (downloads.valueOrNull?.queue).isNotBlank &&
      downloads.valueOrNull!.queue!.any(
        (element) => element.state != "Error" || element.tries != 3,
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toast = ref.watch(toastProvider(context));
    final downloads = ref.watch(downloadsSocketProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n!.downloads),
        actions: [
          if ((downloads.valueOrNull?.queue).isNotBlank)
            IconButton(
              onPressed: () => AsyncValue.guard(
                ref.read(downloadsRepositoryProvider).clearDownloads,
              ),
              icon: const Icon(Icons.delete_sweep_rounded),
            ),
        ],
      ),
      floatingActionButton: showFab(downloads)
          ? DownloadsFab(status: downloads.valueOrNull?.status ?? "")
          : null,
      body: downloads.showUiWhenData(
        context,
        (data) {
          if (data.queue == null) {
            return Emoticons(text: context.l10n!.errorSomethingWentWrong);
          } else if (data.queue!.isEmpty) {
            return Emoticons(
              text: context.l10n!.noDownloads,
            );
          } else {
            final downloadsCount = (data.queue?.length).ifNullOrNegative();
            return ListView.builder(
              itemBuilder: (context, index) {
                if (index == downloadsCount) return KSizedBox.h96.size;
                final download = data.queue![index];
                return DownloadProgressListTile(
                  key: ValueKey(
                    "${download.mangaId}${download.chapterIndex}",
                  ),
                  index: index,
                  downloadsCount: downloadsCount,
                  download: download,
                  toast: toast,
                );
              },
              itemCount: downloadsCount + 1,
            );
          }
        },
        showGenericError: true,
      ),
    );
  }
}
