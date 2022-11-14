// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../constants/app_sizes.dart';
import '../../../utils/extensions/custom_extensions/async_value_extensions.dart';
import '../../../utils/misc/toast/toast.dart';
import '../../../widgets/custom_circular_progress_indicator.dart';
import '../data/manga_book_repository.dart';
import '../domain/chapter/chapter_model.dart';

class DownloadStatusIcon extends HookConsumerWidget {
  const DownloadStatusIcon({
    super.key,
    required this.updateData,
    required this.chapterIndex,
    required this.mangaId,
    required this.isDownloaded,
  });
  final ValueChanged<Chapter?> updateData;
  final int chapterIndex;
  final int mangaId;
  final bool isDownloaded;
  Future<void> newUpdatePair(
      WidgetRef ref, ValueNotifier<bool> isLoading, Toast toast) async {
    try {
      isLoading.value = true;

      final chapter = (await AsyncValue.guard(
              () => ref.read(mangaBookRepositoryProvider).getChapter(
                    mangaId: mangaId,
                    chapterIndex: chapterIndex,
                  )))
          .valueOrToast(toast);
      updateData(chapter);
      isLoading.value = false;
    } catch (e) {
      //
    }
  }

  Future toggleChapterToQueue(
    Toast toast,
    WidgetRef ref, {
    bool isAdd = false,
    bool isRemove = false,
    bool isError = false,
  }) async {
    try {
      (await AsyncValue.guard(() async {
        final repo = ref.read(mangaBookRepositoryProvider);
        if (isRemove || isError) {
          await repo.removeChapterFromDownloadQueue(mangaId, chapterIndex);
        }
        if (isAdd || isError) {
          await repo.addChapterToDownloadQueue(mangaId, chapterIndex);
        }
      }))
          .showToastOnError(toast);
    } catch (e) {
      //
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final toast = ref.watch(toastProvider(context));
    final download = ref.watch(downloadsFromIdProvider(
        getKeyFromDownloadsQueue(mangaId, chapterIndex)));
    if (download?.state == "Finished") {
      newUpdatePair(ref, isLoading, toast);
    }
    if (isLoading.value) {
      return Padding(
        padding: KEdgeInsets.h8.size,
        child: const MiniCircularProgressIndicator(),
      );
    } else {
      if (download != null) {
        return download.state == "Error"
            ? IconButton(
                onPressed: () =>
                    toggleChapterToQueue(toast, ref, isError: true),
                icon: const Icon(Icons.replay_rounded),
              )
            : IconButton(
                onPressed: () =>
                    toggleChapterToQueue(toast, ref, isRemove: true),
                icon: MiniCircularProgressIndicator(
                  value: download.progress == 0 ? null : download.progress,
                ),
              );
      } else {
        if (isDownloaded) {
          return IconButton(
            icon: const Icon(Icons.check_circle_rounded),
            onPressed: () async {
              (await AsyncValue.guard(() async {
                await ref.read(mangaBookRepositoryProvider).deleteChapter(
                    chapterIndex: chapterIndex, mangaId: mangaId);
              }))
                  .showToastOnError(toast);
              await newUpdatePair(ref, isLoading, toast);
            },
          );
        } else {
          return IconButton(
            icon: const Icon(Icons.download_for_offline_rounded),
            onPressed: () {
              toggleChapterToQueue(toast, ref, isAdd: true);
            },
          );
        }
      }
    }
  }
}
