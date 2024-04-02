import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../../utils/misc/app_utils.dart';
import '../../../../../../utils/misc/toast/toast.dart';
import '../../../../../../widgets/emoticons.dart';
import '../../../../../../widgets/input_popup/domain/input_popup_type.dart';
import '../../../../../../widgets/input_popup/input_popup.dart';
import '../../../../../../widgets/section_title.dart';
import '../../../../controller/server_controller.dart';
import '../../../../domain/automatic_backup_settings/automatic_backup_settings_dto.dart';
import '../../data/backup_settings_repository.dart';

class AutomaticBackupSection extends ConsumerWidget {
  const AutomaticBackupSection({super.key});

  @override
  Widget build(context, ref) {
    final AsyncValue<AutomaticBackupSettingsDto?> automaticBackupSettings =
        ref.watch(settingsProvider);
    final repository = ref.watch(backupSettingsRepositoryProvider);

    return automaticBackupSettings.showUiWhenData(
      context,
      (data) {
        if (data == null) {
          return Emoticons(title: context.l10n.errorSomethingWentWrong);
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: context.l10n.automaticBackup),
            InputPopup(
              title: context.l10n.socksHost,
              leading: const Icon(Icons.folder_rounded),
              type: InputPopupType.textField(
                hintText: context.l10n.enterProp(context.l10n.backupLocation),
              ),
              subtitle: (data.backupPath).isNotBlank
                  ? data.backupPath
                  : context.l10n.backupLocationDescription,
              value: data.backupPath,
              onChange: (newValue) async {
                final result = await AppUtils.guard(
                    () => repository.updateBackupLocation(newValue),
                    ref.read(toastProvider));
                if (result != null) {
                  ref.watch(settingsProvider.notifier).updateState(result);
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.access_alarm_rounded),
              title: Text(context.l10n.backupTime),
              subtitle: data.backupTime.toTimeOfDay != null
                  ? Text(data.backupTime.toTimeOfDay!.format(context))
                  : null,
              onTap: () async {
                final backupTime = await showTimePicker(
                  initialTime: data.backupTime.toTimeOfDay ??
                      const TimeOfDay(hour: 0, minute: 0),
                  context: context,
                );
                if (backupTime != null) {
                  final result = await AppUtils.guard(
                      () => repository.updateBackupTime(backupTime),
                      ref.read(toastProvider));
                  if (result != null) {
                    ref.watch(settingsProvider.notifier).updateState(result);
                  }
                } else {
                  if (context.mounted) {
                    ref.read(toastProvider)?.showError(
                        context.l10n.invalidProp(context.l10n.backupTime));
                  }
                }
              },
            ),
            InputPopup(
              leading: const Icon(Icons.folder_rounded),
              title: context.l10n.backupInterval,
              value: data.backupInterval.toString(),
              subtitle: context.l10n
                  .nDays(data.backupInterval.ifNullOrZero(1).compact()!),
              onChange: (value) async {
                final newValue = int.tryParse(value);
                if (newValue != null) {
                  final result = await AppUtils.guard(
                      () => repository.updateBackupInterval(newValue),
                      ref.read(toastProvider));
                  if (result != null) {
                    ref.watch(settingsProvider.notifier).updateState(result);
                  }
                } else {
                  ref.read(toastProvider)?.showError(
                      context.l10n.invalidProp(context.l10n.backupInterval));
                }
              },
              type: const InputPopupType.numberSlider(min: 1, max: 31),
            ),
            InputPopup(
              leading: const Icon(Icons.cleaning_services_rounded),
              title: context.l10n.backupCleanup,
              value: data.backupTTL.toString(),
              subtitle: context.l10n.backupCleanupDescription(
                  data.backupTTL.ifNull(14).compact()!),
              onChange: (value) async {
                final newValue = int.tryParse(value);
                if (newValue != null) {
                  final result = await AppUtils.guard(
                      () => repository.updateBackupTTL(newValue),
                      ref.read(toastProvider));
                  if (result != null) {
                    ref.watch(settingsProvider.notifier).updateState(result);
                  }
                } else {
                  ref.read(toastProvider)?.showError(
                      context.l10n.invalidProp(context.l10n.backupCleanup));
                }
              },
              type: const InputPopupType.numberSlider(min: 0, max: 1000),
            ),
          ],
        );
      },
    );
  }
}
