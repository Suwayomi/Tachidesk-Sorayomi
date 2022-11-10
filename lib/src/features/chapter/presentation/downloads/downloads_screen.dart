// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import 'package:tachidesk_sorayomi/src/features/chapter/data/chapter_repository.dart';
import 'package:tachidesk_sorayomi/src/features/chapter/presentation/downloads/downloads_fab.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/iterable_extensions.dart';
import 'package:tachidesk_sorayomi/src/utils/misc/toast/toast.dart';
import 'package:tachidesk_sorayomi/src/widgets/custom_circular_progress_indicator.dart';
import 'package:tachidesk_sorayomi/src/widgets/emoticons.dart';
import 'download_progress_list_tile.dart';

class DownloadsScreen extends HookConsumerWidget {
  const DownloadsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloads = ref.watch(downloadsSocketProvider);
    final toast = ref.watch(toastProvider(context));
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.screenTitle_downloads.tr()),
        // actions: [
        //   IconButton(
        //     onPressed: () => AsyncValue.guard(
        //       ref.read(chapterRepositoryProvider).clearDownloads,
        //     ),
        //     icon: const Icon(Icons.delete_sweep_rounded),
        //   ),
        // ],
      ),
      floatingActionButton: (downloads.valueOrNull?.queue).isNotBlank
          ? DownloadsFab(status: downloads.valueOrNull?.status ?? "")
          : null,
      body: downloads.when(
        data: (data) {
          if (data.queue == null) {
            return Emoticons(text: LocaleKeys.error_somethingWentWrong.tr());
          } else if (data.queue!.isEmpty) {
            return Emoticons(
              text: LocaleKeys.downloadScreen_noDownloads.tr(),
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
        error: (error, stackTrace) => Emoticons(text: error.toString()),
        loading: () => const CenterCircularProgressIndicator(),
      ),
    );
  }
}
