import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../generated/locales.g.dart';
import '../core/values/string.dart';

Future<void> appUpdateDialog(Version newRelease) {
  return Get.defaultDialog(
    title: LocaleKeys.appUpdate_newUpdateAvilable.tr,
    content: Text(
      LocaleKeys.appUpdate_versionAvilable.trParams(
        {"version": newRelease.canonicalizedVersion},
      ),
    ),
    confirm: ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      onPressed: () async {
        if (!await launch(sorayomiLatestReleaseUrl,
            forceSafariVC: false, forceWebView: false)) {
          Clipboard.setData(
            ClipboardData(
              text: sorayomiLatestReleaseUrl,
            ),
          );
          Get.rawSnackbar(
            title: LocaleKeys.error_launchURL_title.trParams({
              "website": LocaleKeys.aboutScreen_gitHub.tr,
            }),
            message: LocaleKeys.error_launchURL_message.trParams(
              {"url": sorayomiLatestReleaseUrl},
            ),
          );
        }
        Get.back();
      },
      icon: Icon(Icons.open_in_new),
      label: Text(LocaleKeys.appUpdate_gitHub.tr),
    ),
    textCancel: LocaleKeys.appUpdate_close.tr,
    onCancel: () {},
  );
}
