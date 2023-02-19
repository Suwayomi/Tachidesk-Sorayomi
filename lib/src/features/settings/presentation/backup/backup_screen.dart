// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/endpoints.dart';

import '../../../../utils/extensions/custom_extensions.dart';
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
      if (context.mounted) {
        toast.show(context.l10n!.restoring);
      }
    }
    AsyncValue.guard(() => ref
        .read(backupRepositoryProvider)
        .restoreBackup(context, file?.files.single)).then(
      (result) => result.whenOrNull<void>(
        error: (error, stackTrace) => result.showToastOnError(toast),
        data: (data) {
          final backupMissing = data?.filter;
          if (backupMissing == null) return;
          toast.instantShow(context.l10n!.restored);
          if (!backupMissing.isEmpty) {
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
      appBar: AppBar(title: Text(context.l10n!.backup)),
      body: ListView(
        children: [
          ListTile(
            title: Text(context.l10n!.createBackupTitle),
            subtitle: Text(context.l10n!.createBackupDescription),
            leading: const Icon(Icons.backup_rounded),
            onTap: () async {
              final toast = ref.read(toastProvider(context));
              launchUrlInWeb(
                context,
                Endpoints.baseApi(baseUrl: ref.read(serverUrlProvider)) +
                    BackupUrl.export,
                toast,
              );
            },
          ),
          ListTile(
            title: Text(context.l10n!.restoreBackupTitle),
            subtitle: Text(context.l10n!.restoreBackupDescription),
            leading: const Icon(Icons.restore_rounded),
            onTap: () => backupFilePicker(ref, context),
          ),
        ],
      ),
    );
  }
}
