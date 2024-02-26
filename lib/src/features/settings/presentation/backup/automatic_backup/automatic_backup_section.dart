import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../widgets/popup_widgets/slider_popup.dart';
import '../../../../../widgets/popup_widgets/text_field_popup.dart';
import '../../../../../widgets/section_title.dart';
import '../../../controller/settings_controller.dart';
import '../../../data/settings_repository.dart';

class AutomaticBackupSection extends ConsumerWidget {
  const AutomaticBackupSection({super.key});

  @override
  Widget build(context, ref) {
    final automaticBackupSettings = ref.watch(automaticBackupSettingsProvider);
    final repository = ref.watch(settingsRepositoryProvider);

    reload() => ref.refresh(automaticBackupSettingsProvider.future);

    return automaticBackupSettings.showUiWhenData(
      context,
      (data) {
        if (data == null) {
          return const SizedBox.shrink();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: context.l10n.automaticBackup),
            ListTile(
              leading: const Icon(Icons.folder_rounded),
              title: Text(context.l10n.backupLocation),
              subtitle: (data.backupPath).isNotBlank
                  ? Text(data.backupPath!)
                  : Text(context.l10n.backupLocationDescription),
              onTap: () => showDialog(
                context: context,
                builder: (context) => TextFieldPopup(
                  title: context.l10n.backupLocation,
                  initialValue: data.backupPath,
                  subtitle: context.l10n.backupLocationDescription,
                  onChange: (value) async {
                    await repository.updateBackupLocation(value);
                    await reload();
                    if (context.mounted) Navigator.pop(context);
                  },
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.access_alarm_rounded),
              title: Text(context.l10n.backupTime),
              subtitle: data.backupTime != null
                  ? Text(data.backupTime!.format(context))
                  : null,
              onTap: () async {
                final backupTime = await showTimePicker(
                  initialTime:
                      data.backupTime ?? const TimeOfDay(hour: 0, minute: 0),
                  context: context,
                );
                if (backupTime != null) {
                  await repository.updateBackupTime(backupTime);
                  await reload();
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.folder_rounded),
              title: Text(context.l10n.backupInterval),
              subtitle: (data.backupInterval) != null
                  ? Text(context.l10n
                      .nDays(data.backupInterval.ifNullOrZero(1).compact()!))
                  : null,
              onTap: () => showDialog(
                context: context,
                builder: (context) => SliderPopup(
                  min: 1,
                  max: 31,
                  title: context.l10n.backupInterval,
                  initialValue: data.backupInterval.ifNull(1),
                  onChange: (value) async {
                    await repository.updateBackupInterval(value);
                    await reload();
                    if (context.mounted) Navigator.pop(context);
                  },
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.cleaning_services_rounded),
              title: Text(context.l10n.backupCleanup),
              subtitle: (data.backupTTL) != null
                  ? Text(context.l10n.backupCleanupDescription(
                      data.backupTTL.ifNull(14).compact()!))
                  : null,
              onTap: () => showDialog(
                context: context,
                builder: (context) => SliderPopup(
                  min: 0,
                  max: 1000,
                  title: context.l10n.backupCleanup,
                  initialValue: data.backupTTL.ifNull(1),
                  onChange: (value) async {
                    await repository.updateBackupTTL(value);
                    await reload();
                    if (context.mounted) Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
