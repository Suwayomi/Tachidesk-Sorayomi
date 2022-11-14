// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../../../constants/app_sizes.dart';
import '../../../../../i18n/locale_keys.g.dart';
import '../../../../../utils/extensions/custom_extensions/async_value_extensions.dart';
import '../../../../../utils/extensions/custom_extensions/int_extensions.dart';
import '../../../../../utils/extensions/custom_extensions/string_extensions.dart';
import '../../../../../utils/misc/toast/toast.dart';
import '../../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../data/manga_book_repository.dart';
import '../../../domain/downloads_queue/downloads_queue_model.dart';

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
          final repo = ref.read(mangaBookRepositoryProvider);
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
            padding: KEdgeInsets.v4.size,
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
          : PopupMenuButton(
              shape: RoundedRectangleBorder(
                borderRadius: KBorderRadius.r16.radius,
              ),
              padding: EdgeInsets.zero,
              child: const Icon(Icons.more_vert_rounded),
              itemBuilder: (context) => [
                if (download.state == "Error")
                  PopupMenuItem(
                    child: Text(LocaleKeys.retry.tr()),
                    onTap: () =>
                        toggleChapterToQueue(isLoading, toast, ref, true),
                  ),
                PopupMenuItem(
                  child: Text(LocaleKeys.delete.tr()),
                  onTap: () =>
                      toggleChapterToQueue(isLoading, toast, ref, false),
                ),
              ],
            ),
    );
  }
}
