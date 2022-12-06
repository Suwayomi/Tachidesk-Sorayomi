// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/urls.dart';
import '../../../../../i18n/locale_keys.g.dart';
import '../../../../../utils/launch_url_in_web.dart';
import '../../../../../utils/misc/toast/toast.dart';

void appUpdateDialog({
  required String title,
  required String newRelease,
  required BuildContext context,
  required Toast toast,
  String? url,
}) =>
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(LocaleKeys.newUpdateAvailable.tr()),
          content: Text(
            LocaleKeys.versionAvailable.tr(
              namedArgs: {"app": title, "version": newRelease},
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: Text(LocaleKeys.close.tr()),
            ),
            ElevatedButton.icon(
              onPressed: () {
                launchUrlInWeb(
                    url ?? AppUrls.sorayomiLatestReleaseUrl.url, toast);
                context.pop();
              },
              icon: const Icon(FontAwesomeIcons.github),
              label: Text(LocaleKeys.gitHub.tr()),
            ),
          ],
        );
      },
    );
