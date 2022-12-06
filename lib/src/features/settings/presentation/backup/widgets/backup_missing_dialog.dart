// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../i18n/locale_keys.g.dart';
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
          if (backupMissing.missingSources.isNotBlank)
            Text(
              LocaleKeys.missingExtension.tr(),
              style: context.textTheme.titleMedium,
            ),
          ...?backupMissing.missingSources?.map(
            (e) => ListTile(
              leading: const Icon(Icons.extension_rounded),
              title: Text(e),
            ),
          ),
          if (backupMissing.missingTrackers.isNotBlank)
            Text(
              LocaleKeys.missingTrackers.tr(),
              style: context.textTheme.titleMedium,
            ),
          ...?backupMissing.missingTrackers?.map(
            (e) => ListTile(
              leading: const Icon(Icons.sync_rounded),
              title: Text(e),
            ),
          ),
        ],
      ),
      actions: [PopButton(popText: LocaleKeys.close.tr())],
    );
  }
}
