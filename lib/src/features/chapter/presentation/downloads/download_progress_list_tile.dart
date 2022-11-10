// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import 'package:tachidesk_sorayomi/src/constants/app_sizes.dart';
import 'package:tachidesk_sorayomi/src/features/chapter/domain/downloads_queue/downloads_queue_model.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/async_value_extensions.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/int_extensions.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/string_extensions.dart';
import 'package:tachidesk_sorayomi/src/widgets/custom_circular_progress_indicator.dart';
import '../../../../utils/misc/toast/toast.dart';
import '../../data/chapter_repository.dart';

class DownloadProgressListTile extends HookConsumerWidget {
  const DownloadProgressListTile({
    Key? key,
    required this.download,
    required this.toast,
  }) : super(key: key);
  final DownloadsQueue download;
  final Toast toast;

  Future toggleChapterToQueue(
    ValueNotifier<bool> isLoading,
    Toast toast,
    WidgetRef ref,
    bool addToDownload,
  ) async {
    try {
      isLoading.value = true;
      if (!download.chapterIndex.isNull && !download.mangaId.isNull) {
        (await AsyncValue.guard(() async {
          final repo = ref.read(chapterRepositoryProvider);
          await repo.removeChapterFromDownloadQueue(
            download.mangaId!,
            download.chapterIndex!,
          );
          if (addToDownload) {
            await repo.addChapterToDownloadQueue(
              download.mangaId!,
              download.chapterIndex!,
            );
          }
        }))
            .showToastOnError(toast);
      }

      isLoading.value = false;
    } catch (e) {
      //
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = download.state == "Downloading"
        ? "${((download.progress ?? 0) * 100).toInt()}%"
        : download.state == "Error"
            ? "${download.state}(${download.tries})"
            : download.state;
    final isLoading = useState(false);
    return ListTile(
      title: Text(download.manga?.title ?? ""),
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: Edge.v4.size,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  download.chapter?.name ??
                      download.chapter?.chapterNumber.toString() ??
                      "",
                ),
                if (!status.isNull) Text(status!),
              ],
            ),
          ),
          LinearProgressIndicator(
            value: (download.progress ?? 0),
            semanticsValue: "${((download.progress ?? 0) * 100).toInt()}%",
          ),
        ],
      ),
      trailing: isLoading.value
          ? const MiniCircularProgressIndicator()
          : download.state == "Error"
              ? IconButton(
                  onPressed: () =>
                      toggleChapterToQueue(isLoading, toast, ref, true),
                  icon: const Icon(Icons.replay_rounded),
                )
              : IconButton(
                  icon: const Icon(Icons.delete_rounded),
                  onPressed: () =>
                      toggleChapterToQueue(isLoading, toast, ref, false),
                ),
    );
  }
}
