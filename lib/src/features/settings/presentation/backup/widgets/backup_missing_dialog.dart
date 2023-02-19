// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import '../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../widgets/pop_button.dart';
import '../../../domain/backup_missing/backup_missing.dart';

class BackupMissingDialog extends StatelessWidget {
  const BackupMissingDialog({
    super.key,
    required this.backupMissing,
  });
  final BackupMissing backupMissing;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (backupMissing.missingSources.isNotBlank) ...[
            Text(
              context.l10n!.missingExtension,
              style: context.textTheme.titleMedium,
            ),
            ...?backupMissing.missingSources?.map(
              (e) => ListTile(
                leading: const Icon(Icons.extension_rounded),
                title: Text(e),
              ),
            ),
          ],
          if (backupMissing.missingTrackers.isNotBlank) ...[
            Text(
              context.l10n!.missingTrackers,
              style: context.textTheme.titleMedium,
            ),
            ...?backupMissing.missingTrackers?.map(
              (e) => ListTile(
                leading: const Icon(Icons.sync_rounded),
                title: Text(e),
              ),
            ),
          ],
          if (backupMissing.mangasMissingSources.isNotBlank) ...[
            Text(
              context.l10n!.mangaMissingSources,
              style: context.textTheme.titleMedium,
            ),
            ...?backupMissing.mangasMissingSources?.map(
              (e) => ListTile(
                leading: const Icon(Icons.explore),
                title: Text(e),
              ),
            ),
          ]
        ],
      ),
      actions: [PopButton(popText: context.l10n!.close)],
    );
  }
}
