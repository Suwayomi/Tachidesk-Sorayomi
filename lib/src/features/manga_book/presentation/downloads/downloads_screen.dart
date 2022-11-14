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
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/iterable_extensions.dart';
import '../../../../utils/misc/toast/toast.dart';
import '../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../widgets/emoticons.dart';
import '../../data/manga_book_repository.dart';
import '../../domain/downloads/downloads_model.dart';
import 'widgets/download_progress_list_tile.dart';
import 'widgets/downloads_fab.dart';

class DownloadsScreen extends ConsumerWidget {
  const DownloadsScreen({Key? key}) : super(key: key);

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
        title: Text(LocaleKeys.downloads.tr()),
        actions: [
          IconButton(
            onPressed: () => AsyncValue.guard(
              ref.read(mangaBookRepositoryProvider).clearDownloads,
            ),
            icon: const Icon(Icons.delete_sweep_rounded),
          ),
        ],
      ),
      floatingActionButton: showFab(downloads)
          ? DownloadsFab(status: downloads.valueOrNull?.status ?? "")
          : null,
      body: downloads.when(
        data: (data) {
          if (data.queue == null) {
            return Emoticons(text: LocaleKeys.error_somethingWentWrong.tr());
          } else if (data.queue!.isEmpty) {
            return Emoticons(
              text: LocaleKeys.noDownloads.tr(),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                final download = data.queue![index];
                return DownloadProgressListTile(
                  key: ValueKey(
                    "${download.mangaId}${download.chapterIndex}",
                  ),
                  download: download,
                  toast: toast,
                );
              },
              itemCount: data.queue?.length ?? 0,
            );
          }
        },
        error: (error, stackTrace) =>
            Emoticons(text: LocaleKeys.error_somethingWentWrong.tr()),
        loading: () => const CenterCircularProgressIndicator(),
      ),
    );
  }
}
