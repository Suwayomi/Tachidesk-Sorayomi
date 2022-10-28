// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import 'package:tachidesk_sorayomi/src/constants/db_keys.dart';
import 'package:tachidesk_sorayomi/src/constants/enum.dart';
import 'package:tachidesk_sorayomi/src/features/browse/domain/source/source_model.dart';
import 'package:tachidesk_sorayomi/src/features/browse/presentation/source/controller/source_controller.dart';
import 'package:tachidesk_sorayomi/src/features/settings/presentation/server/credentials_popup.dart';
import 'package:tachidesk_sorayomi/src/features/settings/widgets/server_url_tile.dart';
import 'package:tachidesk_sorayomi/src/global_providers/global_providers.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/string_extensions.dart';

class SourceListTile extends ConsumerWidget {
  const SourceListTile({super.key, required this.source});

  final Source source;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseUrl = ref.watch(serverUrlProvider);
    final authType = ref.watch(authTypeProvider);
    final basicToken = ref.watch(credentialsProvider);
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
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl:
              (baseUrl ?? DBKeys.serverUrl.initial) + (source.iconUrl ?? ""),
          height: 48,
          httpHeaders: authType == AuthType.basic && basicToken != null
              ? {"Authorization": basicToken}
              : null,
          width: 48,
          fit: BoxFit.cover,
          errorWidget: (context, error, stackTrace) =>
              const Icon(Icons.broken_image_rounded),
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
              child: Text(LocaleKeys.sourceScreen_latest.tr()),
            )
          : null,
    );
  }
}
