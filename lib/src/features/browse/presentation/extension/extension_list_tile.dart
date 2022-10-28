// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import 'package:tachidesk_sorayomi/src/constants/db_keys.dart';
import 'package:tachidesk_sorayomi/src/constants/enum.dart';
import 'package:tachidesk_sorayomi/src/features/browse/domain/extension/extension_model.dart';
import 'package:tachidesk_sorayomi/src/features/settings/presentation/server/credentials_popup.dart';
import 'package:tachidesk_sorayomi/src/features/settings/widgets/server_url_tile.dart';
import 'package:tachidesk_sorayomi/src/global_providers/global_providers.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/string_extensions.dart';

class ExtensionListTile extends ConsumerWidget {
  const ExtensionListTile({super.key, required this.extension});

  final Extension extension;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseUrl = ref.watch(serverUrlProvider);
    final authType = ref.watch(authTypeProvider);
    final basicToken = ref.watch(credentialsProvider);
    return ListTile(
      onTap: (() async {
        // await controller.localStorageService
        //     .setLastUsed(extension.id);
        // Get.toNamed(
        //   "${Routes.extensionManga}/${extension.id}/popular",
        // );
      }),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl:
              (baseUrl ?? DBKeys.serverUrl.initial) + (extension.iconUrl ?? ""),
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
      title: Text(extension.name ?? ""),
      subtitle: Text.rich(
        TextSpan(
          text: (extension.lang) != null
              ? "${extension.lang?.displayName} "
              : null,
          style: const TextStyle(fontWeight: FontWeight.bold),
          children: [
            if (extension.versionName.isNotBlank)
              TextSpan(
                text: "${extension.versionName ?? ""} ",
                style: const TextStyle(fontWeight: FontWeight.normal),
              ),
            TextSpan(
              text: extension.isNsfw ?? false
                  ? LocaleKeys.extensionScreen_nsfw.tr()
                  : "",
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
      trailing: (extension.installed ?? false)
          ? TextButton(
              onPressed: () async {
                // await controller.localStorageService
                //     .setLastUsed(extension.id);
                // Get.toNamed("${Routes.extensionManga}"
                //     "/${extension.id}/latest");
              },
              child: Text(
                extension.hasUpdate ?? false
                    ? LocaleKeys.extensionScreen_update.tr()
                    : LocaleKeys.extensionScreen_uninstall.tr(),
              ),
            )
          : TextButton(
              onPressed: () async {
                // await controller.localStorageService
                //     .setLastUsed(extension.id);
                // Get.toNamed("${Routes.extensionManga}"
                //     "/${extension.id}/latest");
              },
              child: Text(LocaleKeys.extensionScreen_install.tr()),
            ),
    );
  }
}
