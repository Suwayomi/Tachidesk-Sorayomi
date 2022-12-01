// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/endpoints.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/async_value_extensions.dart';
import '../../../../utils/extensions/custom_extensions/iterable_extensions.dart';
import '../../../../utils/launch_url_in_web.dart';
import '../../../../utils/misc/toast/toast.dart';
import '../../data/backup/backup_repository.dart';
import '../../widgets/server_url_tile/server_url_tile.dart';
import 'widgets/backup_missing_dialog.dart';

class BackupScreen extends ConsumerWidget {
  const BackupScreen({super.key});

  void backupFilePicker(WidgetRef ref, BuildContext context) async {
    final toast = ref.read(toastProvider(context));
    final file = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['gz'],
    );
    if ((file?.files).isNotBlank) {
      toast.show(LocaleKeys.restoring.tr());
    }
    AsyncValue.guard(() => ref
        .read(backupRepositoryProvider)
        .restoreBackup(file?.files.single)).then(
      (result) => result.whenOrNull<void>(
        error: (error, stackTrace) => result.showToastOnError(toast),
        data: (data) {
          final backupMissing = data?.filter;
          if (backupMissing == null) return;
          toast.instantShow(LocaleKeys.restored.tr());
          if (backupMissing.isNotEmpty) {
            showDialog(
              context: context,
              builder: (context) => BackupMissingDialog(
                backupMissing: backupMissing,
              ),
            );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.browse.tr())),
      body: ListView(
        children: [
          ListTile(
            title: Text(LocaleKeys.createBackup_title.tr()),
            subtitle: Text(LocaleKeys.createBackup_subtitle.tr()),
            leading: const Icon(Icons.backup_rounded),
            onTap: () async {
              final toast = ref.read(toastProvider(context));
              launchUrlInWeb(
                Endpoints.baseApi(baseUrl: ref.read(serverUrlProvider)) +
                    BackupUrl.export,
                toast,
              );
            },
          ),
          ListTile(
            title: Text(LocaleKeys.restore_title.tr()),
            subtitle: Text(LocaleKeys.restore_subtitle.tr()),
            leading: const Icon(Icons.restore_rounded),
            onTap: () => backupFilePicker(ref, context),
          ),
        ],
      ),
    );
  }
}
