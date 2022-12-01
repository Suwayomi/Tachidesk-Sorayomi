// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../i18n/locale_keys.g.dart';
import '../../../../../utils/extensions/custom_extensions/async_value_extensions.dart';
import '../../../../../utils/extensions/custom_extensions/string_extensions.dart';
import '../../../../../utils/misc/custom_typedef.dart';
import '../../../../../utils/misc/toast/toast.dart';
import '../../../../../widgets/server_image.dart';
import '../../../data/extension_repository/extension_repository.dart';
import '../../../domain/extension/extension_model.dart';

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
            if (extension.isNsfw ?? false)
              TextSpan(
                text: LocaleKeys.nsfw18.tr(),
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
                        ? LocaleKeys.updating.tr()
                        : LocaleKeys.update.tr()
                    : isLoading.value
                        ? LocaleKeys.uninstalling.tr()
                        : LocaleKeys.uninstall.tr(),
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
                    ? LocaleKeys.installing.tr()
                    : LocaleKeys.install.tr(),
              ),
            ),
    );
  }
}
