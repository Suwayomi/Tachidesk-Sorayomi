import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'automatic_backup_settings_dto.freezed.dart';

@freezed
class AutomaticBackupSettingsDto with _$AutomaticBackupSettingsDto {
  factory AutomaticBackupSettingsDto({
    int? backupInterval,
    String? backupPath,
    int? backupTTL,
    TimeOfDay? backupTime,
  }) = _AutomaticBackupSettingsDto;
}
