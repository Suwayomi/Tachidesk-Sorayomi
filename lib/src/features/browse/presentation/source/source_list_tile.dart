// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../../domain/source/source_model.dart';
import 'controller/source_controller.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/string_extensions.dart';
import '../../../../widgets/server_image.dart';

class SourceListTile extends ConsumerWidget {
  const SourceListTile({super.key, required this.source});

  final Source source;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: (() async {
        ref.read(sourceLastUsedProvider.notifier).update(source.id);
        // await controller.localStorageService
        //     .setLastUsed(source.id);
        // Get.toNamed(
        //   "${Routes.sourceManga}/${source.id}/popular",
        // );
      }),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ServerImage(
          imageUrl: source.iconUrl ?? "",
          size: const Size.square(48),
        ),
      ),
      title: Text(source.displayName ?? source.name ?? ""),
      subtitle: (source.lang?.displayName).isNotBlank
          ? Text(source.lang?.displayName ?? "")
          : null,
      trailing: (source.supportsLatest ?? false)
          ? TextButton(
              onPressed: () async {
                ref.read(sourceLastUsedProvider.notifier).update(source.id);
                // await controller.localStorageService
                //     .setLastUsed(source.id);
                // Get.toNamed("${Routes.sourceManga}"
                //     "/${source.id}/latest");
              },
              child: Text(LocaleKeys.latest.tr()),
            )
          : null,
    );
  }
}
