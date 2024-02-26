// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../utils/extensions/custom_extensions.dart';
import '../../controller/settings_controller.dart';
import 'automatic_backup/automatic_backup_section.dart';
import 'backup_and_restore/backup_and_restore_section.dart';

class BackupScreen extends ConsumerWidget {
  const BackupScreen({super.key});

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.backup)),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(automaticBackupSettingsProvider.future),
        child: ListView(
          children: const [
            BackupAndRestoreSection(),
            AutomaticBackupSection(),
          ],
        ),
      ),
    );
  }
}
