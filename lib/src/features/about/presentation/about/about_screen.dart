// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pub_semver/pub_semver.dart';

// 🌎 Project imports:
import '../../../../constants/app_sizes.dart';
import '../../../../constants/gen/assets.gen.dart';
import '../../../../constants/urls.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/async_value_extensions.dart';
import '../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../utils/extensions/custom_extensions/date_time_extensions.dart';
import '../../../../utils/extensions/custom_extensions/int_extensions.dart';
import '../../../../utils/extensions/custom_extensions/string_extensions.dart';
import '../../../../utils/launch_url_in_web.dart';
import '../../../../utils/misc/toast/toast.dart';
import '../../data/about_repository.dart';
import '../../domain/about/about_model.dart';
import '../../domain/server_update/server_update_model.dart';
import 'controllers/about_controller.dart';
import 'widget/app_update_dialog.dart';
import 'widget/clipboard_list_tile.dart';
import 'widget/media_launch_button.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  void checkForServerUpdate({
    required BuildContext context,
    required String serverVer,
    required About about,
    required Future<List<ServerUpdate>?> Function() updateCallback,
    required Toast toast,
  }) {
    toast.show(LocaleKeys.searchingForUpdates.tr());
    AsyncValue.guard(updateCallback).then(
      (value) {
        toast.close();
        try {
          value.whenOrNull(
            data: (data) {
              if (data == null) return;
              final newUpdate = data.firstWhere(
                (e) => e.channel == about.buildType,
                orElse: () => ServerUpdate(),
              );
              final currentVer = Version.parse(serverVer.substring(1));
              final newVer = Version.parse(newUpdate.tag?.substring(1) ?? "");
              if ((newVer.compareTo(currentVer)).isGreaterThan(-1)) {
                appUpdateDialog(
                  title: about.name ?? LocaleKeys.server.tr(),
                  newRelease: "${newVer.canonicalizedVersion}"
                      " (${newUpdate.channel})",
                  context: context,
                  toast: toast,
                  url: newUpdate.url,
                );
              } else {
                toast.show(LocaleKeys.noUpdatesAvailable.tr());
              }
            },
            error: (error, stackTrace) => value.showToastOnError(toast),
          );
        } catch (e) {
          toast.showError(
            kDebugMode
                ? e.toString()
                : LocaleKeys.error_somethingWentWrong.tr(),
          );
        }
      },
    );
  }

  Future<void> checkForUpdate({
    required String? title,
    required BuildContext context,
    required Future<AsyncValue<Version?>> Function() updateCallback,
    required Toast toast,
  }) async {
    toast.show(LocaleKeys.searchingForUpdates.tr());
    updateCallback().then((value) {
      toast.close();
      value.whenOrNull(
        data: (version) {
          if (version != null) {
            appUpdateDialog(
              title: title ?? LocaleKeys.appTitle.tr(),
              newRelease: "v${version.canonicalizedVersion}",
              context: context,
              toast: toast,
            );
          } else {
            toast.show(LocaleKeys.noUpdatesAvailable.tr());
          }
        },
        error: (error, stackTrace) => value.showToastOnError(toast),
      );
      return;
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toast = ref.watch(toastProvider(context));
    final about = ref
        .watch(aboutControllerProvider)
        .valueOrToast(toast, withMicrotask: true);
    final serverVer = about?.buildType == "Stable"
        ? about?.version
        : "${about?.version}-${about?.revision}";
    final packageInfo = ref.watch(packageInfoProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.about.tr()),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(aboutControllerProvider.future),
        child: ListView(
          children: [
            ImageIcon(
              AssetImage(Assets.icons.darkIcon.path),
              size: context.height * .2,
            ),
            const Divider(),
            ClipboardListTile(
              title: LocaleKeys.client.tr(),
              subtitle: packageInfo.appName,
            ),
            ClipboardListTile(
              title: LocaleKeys.clientVersion.tr(),
              subtitle: "v${packageInfo.version}",
            ),
            ListTile(
              title: Text(LocaleKeys.whatsNew.tr()),
              onTap: () async {
                final url = AppUrls.sorayomiWhatsNew.url + packageInfo.version;
                await launchUrlInWeb(url, toast);
              },
            ),
            ListTile(
              title: Text(LocaleKeys.checkForUpdates.tr()),
              onTap: () => checkForUpdate(
                title: packageInfo.appName,
                context: context,
                updateCallback: ref.read(aboutRepositoryProvider).checkUpdate,
                toast: toast,
              ),
            ),
            if (about != null) ...[
              const Divider(),
              ClipboardListTile(
                title: LocaleKeys.server.tr(),
                subtitle: about.name,
              ),
              ClipboardListTile(
                title: LocaleKeys.channel.tr(),
                subtitle: about.buildType,
              ),
              if (serverVer.isNotBlank)
                ClipboardListTile(
                  title: LocaleKeys.serverVersion.tr(),
                  subtitle: serverVer,
                ),
              ClipboardListTile(
                title: LocaleKeys.buildTime.tr(),
                subtitle: (about.buildTime).isNull
                    ? null
                    : DateTime.fromMillisecondsSinceEpoch(
                        (about.buildTime ?? 0) * 1000,
                      ).toDateString,
              ),
              if (serverVer.isNotBlank)
                ListTile(
                  title: Text(LocaleKeys.checkForServerUpdates.tr()),
                  onTap: () => checkForServerUpdate(
                    context: context,
                    serverVer: serverVer ?? "",
                    about: about,
                    updateCallback:
                        ref.read(aboutRepositoryProvider).checkServerUpdate,
                    toast: toast,
                  ),
                ),
            ],
            Padding(
              padding: KEdgeInsets.a8.size,
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  MediaLaunchButton(
                    title: "${LocaleKeys.gitHub.tr()} ",
                    iconData: FontAwesomeIcons.github,
                    url: AppUrls.sorayomiGithubUrl.url,
                    toast: toast,
                  ),
                  if ((about?.discord).isNotBlank)
                    MediaLaunchButton(
                      title: LocaleKeys.discord.tr(),
                      iconData: FontAwesomeIcons.discord,
                      url: about!.discord!,
                      toast: toast,
                    ),
                  MediaLaunchButton(
                    title: LocaleKeys.reddit.tr(),
                    iconData: FontAwesomeIcons.reddit,
                    url: AppUrls.tachideskReddit.url,
                    toast: toast,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
