// 🐦 Flutter imports:
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
import '../../../../global_providers/global_providers.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/async_value_extensions.dart';
import '../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../utils/extensions/custom_extensions/date_time_extensions.dart';
import '../../../../utils/extensions/custom_extensions/int_extensions.dart';
import '../../../../utils/extensions/custom_extensions/string_extensions.dart';
import '../../../../utils/launch_url_in_web.dart';
import '../../../../utils/misc/toast/toast.dart';
import '../../data/about_repository.dart';
import 'controllers/about_controller.dart';
import 'widget/app_update_dialog.dart';
import 'widget/clipboard_list_tile.dart';
import 'widget/media_launch_button.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  Future<void> checkForUpdate(
    BuildContext context,
    Future<AsyncValue<Version?>> Function() updateCallback,
    Toast toast,
  ) async {
    toast.show(LocaleKeys.searchingForUpdates.tr());
    updateCallback().then((value) {
      toast.close();
      value.whenOrNull(
        data: (version) {
          if (version != null) {
            appUpdateDialog("v${version.canonicalizedVersion}", context, toast);
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
    final about = ref.watch(aboutControllerProvider).valueOrToast(toast);
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
                context,
                ref.read(aboutRepositoryProvider).checkUpdate,
                toast,
              ),
            ),
            const Divider(),
            ClipboardListTile(
              title: LocaleKeys.server.tr(),
              subtitle: about?.name,
            ),
            ClipboardListTile(
              title: LocaleKeys.channel.tr(),
              subtitle: about?.buildType,
            ),
            ClipboardListTile(
              title: LocaleKeys.serverVersion.tr(),
              subtitle: about?.buildType == "Stable"
                  ? about?.version
                  : "${about?.version}-${about?.revision}",
            ),
            ClipboardListTile(
              title: LocaleKeys.buildTime.tr(),
              subtitle: (about?.buildTime).isNull
                  ? null
                  : DateTime.fromMillisecondsSinceEpoch(
                      (about?.buildTime ?? 0) * 1000,
                    ).toDateString,
            ),
            ListTile(
              title: Text(LocaleKeys.checkForServerUpdates.tr()),
              onTap: () async {
                toast.show(LocaleKeys.searchingForUpdates.tr());
                AsyncValue.guard(
                  () => ref.read(aboutRepositoryProvider).checkServerUpdate(),
                ).then(
                  (value) {
                    toast.close();
                    value.maybeWhen(
                      data: (data) {
                        if (data != null && data.tag.isNotBlank) {
                          appUpdateDialog(
                            "${data.tag} (${data.channel})",
                            context,
                            toast,
                            data.url,
                          );
                        } else {
                          toast.show(LocaleKeys.noUpdatesAvailable.tr());
                        }
                      },
                      error: (error, stackTrace) =>
                          value.showToastOnError(toast),
                      orElse: () {},
                    );
                  },
                );
              },
            ),
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
