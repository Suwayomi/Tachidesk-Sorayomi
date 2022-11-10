// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import 'package:tachidesk_sorayomi/src/features/browse/data/extension_repository.dart';
import 'package:tachidesk_sorayomi/src/features/browse/domain/extension/extension_model.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/async_value_extensions.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/string_extensions.dart';
import 'package:tachidesk_sorayomi/src/utils/misc/toast/toast.dart';
import '../../../../utils/misc/custom_typedef.dart';
import '../../../../widgets/server_image.dart';

class ExtensionListTile extends HookConsumerWidget {
  const ExtensionListTile({
    super.key,
    required this.extension,
    required this.refresh,
  });

  final Extension extension;
  final AsyncVoidCallBack refresh;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.watch(extensionRepositoryProvider);
    final toast = ref.watch(toastProvider(context));
    final isLoading = useState(false);
    return ListTile(
      key: key,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ServerImageWithCpi(
          url: extension.iconUrl ?? "",
          outerSize: const Size.square(48),
          innerSize: const Size.square(24),
          isLoading: isLoading.value,
        ),
        // isLoading.value
        //     ? SizedBox(
        //         height: 48,
        //         width: 48,
        //         child: Stack(
        //           alignment: AlignmentDirectional.center,
        //           children: [
        //             const Padding(
        //               padding: EdgeInsets.all(4.0),
        //               child: CircularProgressIndicator(strokeWidth: 2),
        //             ),
        //             ServerImage(
        //               imageUrl: extension.iconUrl ?? "",
        //               size: const Size.square(24),
        //             )
        //           ],
        //         ),
        //       )
        //     : ServerImage(
        //         imageUrl: extension.iconUrl ?? "",
        //         size: const Size.square(48),
        //       ),
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
              onPressed: isLoading.value
                  ? null
                  : () async {
                      try {
                        isLoading.value = true;
                        (await AsyncValue.guard(() async {
                          if (extension.pkgName.isBlank) {
                            throw LocaleKeys.error_extension.tr();
                          }
                          await (extension.hasUpdate ?? false
                              ? repository.updateExtension(extension.pkgName!)
                              : repository
                                  .uninstallExtension(extension.pkgName!));

                          await refresh();
                        }))
                            .showToastOnError(toast);
                        isLoading.value = false;
                      } catch (e) {
                        //
                      }
                    },
              child: Text(
                extension.hasUpdate ?? false
                    ? isLoading.value
                        ? LocaleKeys.extensionScreen_updating.tr()
                        : LocaleKeys.extensionScreen_update.tr()
                    : isLoading.value
                        ? LocaleKeys.extensionScreen_uninstalling.tr()
                        : LocaleKeys.extensionScreen_uninstall.tr(),
              ),
            )
          : TextButton(
              onPressed: isLoading.value
                  ? null
                  : () async {
                      try {
                        isLoading.value = true;
                        (await AsyncValue.guard(() async {
                          if (extension.pkgName.isBlank) {
                            throw LocaleKeys.error_extension.tr();
                          }
                          await repository.installExtension(extension.pkgName!);
                          await refresh();
                        }))
                            .showToastOnError(toast);
                        isLoading.value = false;
                      } catch (e) {
                        //
                      }
                    },
              child: Text(
                isLoading.value
                    ? LocaleKeys.extensionScreen_installing.tr()
                    : LocaleKeys.extensionScreen_install.tr(),
              ),
            ),
    );
  }
}
