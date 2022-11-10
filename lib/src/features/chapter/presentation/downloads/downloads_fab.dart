// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import 'package:tachidesk_sorayomi/src/features/chapter/data/chapter_repository.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/async_value_extensions.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/context_extensions.dart';
import 'package:tachidesk_sorayomi/src/utils/misc/toast/toast.dart';
import '../../../../i18n/locale_keys.g.dart';

class DownloadsFab extends ConsumerWidget {
  const DownloadsFab({Key? key, required this.status}) : super(key: key);
  final String status;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toast = ref.watch(toastProvider(context));
    if (status == "Stopped" || status == "Error") {
      return FloatingActionButton.extended(
        onPressed: () async {
          (await AsyncValue.guard(
                  ref.read(chapterRepositoryProvider).startDownloads))
              .showToastOnError(toast);
        },
        label: Text(LocaleKeys.downloadScreen_resume.tr()),
        isExtended: context.isTablet,
        icon: const Icon(Icons.play_arrow),
      );
    } else {
      return FloatingActionButton.extended(
        onPressed: () async {
          (await AsyncValue.guard(
                  ref.read(chapterRepositoryProvider).stopDownloads))
              .showToastOnError(toast);
        },
        label: Text(LocaleKeys.downloadScreen_pause.tr()),
        isExtended: context.isTablet,
        icon: const Icon(Icons.pause_rounded),
      );
    }
  }
}
