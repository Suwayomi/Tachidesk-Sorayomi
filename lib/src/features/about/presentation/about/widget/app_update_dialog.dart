// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pub_semver/pub_semver.dart';

// 🌎 Project imports:
import '../../../../../constants/urls.dart';
import '../../../../../i18n/locale_keys.g.dart';
import '../../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../../utils/launch_url_in_web.dart';
import '../../../../../utils/misc/toast/toast.dart';

void appUpdateDialog(Version newRelease, BuildContext context, Toast toast) =>
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(LocaleKeys.appUpdate_newUpdateAvailable.tr()),
          content: Text(
            LocaleKeys.appUpdate_versionAvailable.tr(
              namedArgs: {"version": newRelease.canonicalizedVersion},
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => context.navPop(),
              child: Text(LocaleKeys.appUpdate_close.tr()),
            ),
            ElevatedButton.icon(
              onPressed: () {
                launchUrlInWeb(AppUrls.sorayomiLatestReleaseUrl.url, toast);
                context.navPop();
              },
              icon: const Icon(FontAwesomeIcons.github),
              label: Text(LocaleKeys.appUpdate_gitHub.tr()),
            ),
          ],
        );
      },
    );
