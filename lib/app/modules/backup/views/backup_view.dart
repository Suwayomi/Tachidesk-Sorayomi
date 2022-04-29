import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../generated/locales.g.dart';
import '../controllers/backup_controller.dart';

class BackupView extends GetView<BackupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.settingsScreen_backup.tr),
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text(LocaleKeys.backupSettings_create_title.tr),
              subtitle: Text(LocaleKeys.backupSettings_create_subtitle.tr),
              onTap: () async {
                if (!await launchUrl(
                  Uri.parse(controller.totalBackupURL),
                  mode: LaunchMode.externalApplication,
                )) {
                  Clipboard.setData(
                      ClipboardData(text: controller.totalBackupURL));
                }
              },
            ),
            ListTile(
              title: Text(LocaleKeys.backupSettings_restore_title.tr),
              subtitle: Text(LocaleKeys.backupSettings_restore_subtitle.tr),
              onTap: () => controller.restoreBackup(),
            ),
          ],
        ));
  }
}
