import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tachidesk_sorayomi/src/features/settings/domain/backup_missing/backup_missing.dart';
import 'package:tachidesk_sorayomi/src/widgets/pop_button.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/context_extensions.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/iterable_extensions.dart';

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
              LocaleKeys.backupSettings_missingExtension.tr(),
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
              LocaleKeys.backupSettings_missingTrackers.tr(),
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
      actions: [PopButton(popText: LocaleKeys.common_close.tr())],
    );
  }
}
