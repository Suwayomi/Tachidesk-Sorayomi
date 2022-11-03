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

class AboutScreen extends HookConsumerWidget {
  const AboutScreen({super.key});

  Future<void> checkForUpdate(
    BuildContext context,
    Future<AsyncValue<Version?>> Function() updateCallback,
    Toast toast,
  ) async {
    toast.show(LocaleKeys.aboutScreen_searchingForUpdates.tr());
    updateCallback().then((value) {
      toast.close();
      value.whenOrNull(
        data: (version) {
          if (version != null) {
            appUpdateDialog(version, context, toast);
          } else {
            toast.show(LocaleKeys.aboutScreen_noUpdatesAvailable.tr());
          }
        },
        error: (error, stackTrace) => toast.showError(error.toString()),
      );
      return;
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final about = ref.watch(aboutControllerProvider).asData?.value;
    final packageInfo = ref.watch(packageInfoProvider);
    final toast = ref.watch(toastProvider(context));
    ref.listen(
      aboutControllerProvider,
      ((_, state) => state.showToastOnError(toast)),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.screenTitle_about.tr()),
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
              title: LocaleKeys.aboutScreen_client.tr(),
              subtitle: packageInfo.appName,
            ),
            ClipboardListTile(
              title: LocaleKeys.aboutScreen_clientVersion.tr(),
              subtitle: "v${packageInfo.version}",
            ),
            ListTile(
              title: Text(LocaleKeys.aboutScreen_whatsNew.tr()),
              onTap: () async {
                final url = AppUrls.sorayomiWhatsNew.url + packageInfo.version;
                await launchUrlInWeb(url, toast);
              },
            ),
            ListTile(
              title: Text(LocaleKeys.aboutScreen_checkForUpdates.tr()),
              onTap: () => checkForUpdate(
                context,
                ref.read(aboutRepositoryProvider).checkUpdate,
                toast,
              ),
            ),
            const Divider(),
            ClipboardListTile(
              title: LocaleKeys.aboutScreen_server.tr(),
              subtitle: about?.name,
            ),
            ClipboardListTile(
              title: LocaleKeys.aboutScreen_channel.tr(),
              subtitle: about?.buildType,
            ),
            ClipboardListTile(
              title: LocaleKeys.aboutScreen_serverVersion.tr(),
              subtitle: about?.buildType == "Stable"
                  ? about?.version
                  : about?.revision,
            ),
            ClipboardListTile(
              title: LocaleKeys.aboutScreen_buildTime.tr(),
              subtitle: (about?.buildTime).isNull
                  ? null
                  : DateTime.fromMillisecondsSinceEpoch(
                      (about?.buildTime ?? 0) * 1000,
                    ).toDateString,
            ),
            Padding(
              padding: Edge.a8.size,
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  MediaLaunchButton(
                    title: "${LocaleKeys.aboutScreen_gitHub.tr()} ",
                    iconData: FontAwesomeIcons.github,
                    url: AppUrls.sorayomiGithubUrl.url,
                    toast: toast,
                  ),
                  if ((about?.discord).isNotBlank)
                    MediaLaunchButton(
                      title: LocaleKeys.aboutScreen_discord.tr(),
                      iconData: FontAwesomeIcons.discord,
                      url: about!.discord!,
                      toast: toast,
                    ),
                  MediaLaunchButton(
                    title: LocaleKeys.aboutScreen_reddit.tr(),
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
