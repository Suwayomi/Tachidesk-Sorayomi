import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/settings_repository.dart';
import '../domain/automatic_backup_settings_dto.dart';
import '../domain/restore_status.dart';

part 'settings_controller.g.dart';

@riverpod
Stream<RestoreStatus?> restoreStatus(RestoreStatusRef ref, String restoreId) =>
    ref.watch(settingsRepositoryProvider).getRestoreStatus(restoreId);

@riverpod
Stream<AutomaticBackupSettingsDto?> automaticBackupSettings(
        AutomaticBackupSettingsRef ref) =>
    ref.watch(settingsRepositoryProvider).getAutomaticBackupSettings();
