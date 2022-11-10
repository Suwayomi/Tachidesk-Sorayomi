// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 🌎 Project imports:
import '../../../../../constants/urls.dart';
import '../../../../../i18n/locale_keys.g.dart';
import '../../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../../utils/launch_url_in_web.dart';
import '../../../../../utils/misc/toast/toast.dart';

void appUpdateDialog(String newRelease, BuildContext context, Toast toast,
        [String? url]) =>
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(LocaleKeys.newUpdateAvailable.tr()),
          content: Text(
            LocaleKeys.versionAvailable.tr(
              namedArgs: {"version": newRelease},
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => context.navPop(),
              child: Text(LocaleKeys.close.tr()),
            ),
            ElevatedButton.icon(
              onPressed: () {
                launchUrlInWeb(
                    url ?? AppUrls.sorayomiLatestReleaseUrl.url, toast);
                context.navPop();
              },
              icon: const Icon(FontAwesomeIcons.github),
              label: Text(LocaleKeys.gitHub.tr()),
            ),
          ],
        );
      },
    );
