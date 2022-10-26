import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tachidesk_sorayomi/src/constants/endpoints.dart';
import 'package:tachidesk_sorayomi/src/features/settings/data/backup_repository.dart';
import 'package:tachidesk_sorayomi/src/features/settings/widgets/server_url_tile.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/async_value_extensions.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/iterable_extensions.dart';

import 'package:tachidesk_sorayomi/src/utils/launch_url_in_web.dart';
import 'package:tachidesk_sorayomi/src/utils/misc/toast.dart';
import 'package:file_picker/file_picker.dart';

import 'backup_missing_dialog.dart';

class BackupScreen extends ConsumerWidget {
  const BackupScreen({super.key});

  void backupFilePicker(WidgetRef ref, BuildContext context) async {
    final toast = ref.read(toastProvider(context));
    final file = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['gz'],
    );
    if ((file?.files).isNotBlank) {
      toast.show(LocaleKeys.backupSettings_restoring_title.tr());
    }
    final result = (await AsyncValue.guard(() =>
        ref.read(backupRepositoryProvider).restoreBackup(file?.files.single)))
      ..showToastOnError(toast);
    result.maybeWhen(
      data: (data) {
        final backupMissing = data?.filter;
        if (backupMissing == null) return null;
        toast.instantShow(LocaleKeys.backupSettings_restored_title.tr());
        if (backupMissing.isNotEmpty) {
          return showDialog(
            context: context,
            builder: (context) => BackupMissingDialog(
              backupMissing: backupMissing,
            ),
          );
        }
      },
      orElse: () {},
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.settingsScreen_browse.tr())),
      body: ListView(
        children: [
          ListTile(
            title: Text(LocaleKeys.backupSettings_create_title.tr()),
            subtitle: Text(LocaleKeys.backupSettings_create_subtitle.tr()),
            leading: const Icon(Icons.backup_rounded),
            onTap: () async {
              final toast = ref.read(toastProvider(context));
              launchUrlInWeb(
                Endpoints.baseApi(
                        baseUrl: await ref.read(serverUrlProvider).get()) +
                    BackupUrl.export,
                toast,
              );
            },
          ),
          ListTile(
            title: Text(LocaleKeys.backupSettings_restore_title.tr()),
            subtitle: Text(LocaleKeys.backupSettings_restore_subtitle.tr()),
            leading: const Icon(Icons.restore_rounded),
            onTap: () => backupFilePicker(ref, context),
          ),
        ],
      ),
    );
  }
}
