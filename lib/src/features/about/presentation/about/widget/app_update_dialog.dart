import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pub_semver/pub_semver.dart';
import 'package:tachidesk_sorayomi/src/constants/urls.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/context_extensions.dart';

import 'package:tachidesk_sorayomi/src/utils/launch_url_in_web.dart';
import 'package:tachidesk_sorayomi/src/utils/misc/toast.dart';

void appUpdateDialog(Version newRelease, BuildContext context, Toast toast) =>
    showDialog(
      context: context,
      useRootNavigator: false,
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
