// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../../constants/app_sizes.dart';
import '../../../../utils/extensions/custom_extensions/async_value_extensions.dart';
import '../../../../utils/extensions/custom_extensions/bool_extensions.dart';
import '../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../utils/extensions/custom_extensions/int_extensions.dart';
import '../../../../utils/misc/custom_typedef.dart';
import '../../../../utils/misc/toast/toast.dart';
import '../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../widgets/server_image.dart';
import '../../data/chapter_repository.dart';
import '../../domain/chapter_page/chapter_page_model.dart';

class ChapterMangaListTile extends StatelessWidget {
  const ChapterMangaListTile({
    Key? key,
    required this.pair,
    required this.toast,
    required this.updatePair,
    required this.toggleSelect,
    this.canTapSelect = false,
    this.isSelected = false,
  }) : super(key: key);
  final ChapterMangaPair pair;
  final Toast toast;
  final AsyncVoidCallBack updatePair;
  final SingleInputCallback<ChapterMangaPair> toggleSelect;
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
      trailing: DownloadStatusIcon(
        pair: pair,
        toast: toast,
        updatePair: updatePair,
      ),
      onTap: canTapSelect ? () => toggleSelect(pair) : null,
      onLongPress: () => toggleSelect(pair),
    );
  }
}

class DownloadStatusIcon extends HookConsumerWidget {
  const DownloadStatusIcon({
    super.key,
    required this.pair,
    required this.toast,
    required this.updatePair,
  });
  final ChapterMangaPair pair;
  final Toast toast;
  final AsyncVoidCallBack updatePair;
  Future<void> newUpdatePair(ValueNotifier<bool> isLoading) async {
    try {
      isLoading.value = true;
      await updatePair();
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
      if (!(pair.chapter?.index).isNull && !(pair.manga?.id).isNull) {
        (await AsyncValue.guard(() async {
          final repo = ref.read(chapterRepositoryProvider);
          if (isRemove || isError) {
            await repo.removeChapterFromDownloadQueue(
              pair.manga!.id!,
              pair.chapter!.index!,
            );
          }
          if (isAdd || isError) {
            await repo.addChapterToDownloadQueue(
              pair.manga!.id!,
              pair.chapter!.index!,
            );
          }
        }))
            .showToastOnError(toast);
      }
    } catch (e) {
      //
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final download = ref.watch(downloadsFromIdProvider(
        getKeyFromDownloadsQueue(pair.manga?.id, pair.chapter?.index)));
    if (download?.state == "Finished") {
      newUpdatePair(isLoading);
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
        if (pair.chapter?.downloaded ?? false) {
          return IconButton(
            icon: const Icon(Icons.check_circle_rounded),
            onPressed: () async {
              (await AsyncValue.guard(() async {
                await ref.read(chapterRepositoryProvider).deleteChapter(
                    chapterIndex: pair.chapter!.index!,
                    mangaId: pair.manga!.id!);
              }))
                  .showToastOnError(toast);
              await newUpdatePair(isLoading);
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
