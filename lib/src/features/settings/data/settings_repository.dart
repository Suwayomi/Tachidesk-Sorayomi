// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show MultipartFile;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../global_providers/global_providers.dart';
import '../../../utils/extensions/custom_extensions.dart';
import '../domain/automatic_backup_settings_dto.dart';
import '../domain/restore_status.dart';
import '../enums/restore_state.dart';
import 'graphql/settings_query.dart';

part 'settings_repository.g.dart';

class SettingsRepository {
  const SettingsRepository(this.ferryClient);

  final Client ferryClient;

  Stream<String?> restoreBackup(MultipartFile? file) => ferryClient.fetch(
        SettingsQuery.restoreBackup(file),
        (data) => data.restoreBackup.id,
      );

  Stream<Set<String>?> validateBackup(MultipartFile? file) => ferryClient.fetch(
        SettingsQuery.validateBackup(file),
        (data) => data.validateBackup.missingSources
            .map((value) => value.name)
            .toSet(),
      );

  Stream<RestoreStatus?> getRestoreStatus(String restoreId) =>
      ferryClient.fetch(
          SettingsQuery.restoreStatus(restoreId),
          (data) => data.restoreStatus != null
              ? RestoreStatus(
                  mangaProgress: data.restoreStatus!.mangaProgress,
                  state: RestoreState.fromValue(data.restoreStatus!.state.name),
                  totalManga: data.restoreStatus!.totalManga,
                )
              : null);

  Stream<String?> createBackup(bool includeCategories, bool includeChapters) =>
      ferryClient.fetch(
        SettingsQuery.createBackup(includeCategories, includeChapters),
        (data) => data.createBackup.url,
      );

  Stream<AutomaticBackupSettingsDto?> getAutomaticBackupSettings() =>
      ferryClient.fetch(
        SettingsQuery.automaticBackupSettings(),
        (data) => AutomaticBackupSettingsDto(
          backupInterval: data.settings.backupInterval,
          backupPath: data.settings.backupPath,
          backupTTL: data.settings.backupTTL,
          backupTime: (data.settings.backupTime).toTimeOfDay,
        ),
      );

  Future<void> updateBackupLocation(String? backupPath) =>
      ferryClient.fetch(SettingsQuery.updateBackupPath(backupPath)).first;

  Future<void> updateBackupTime(TimeOfDay backupTime) =>
      ferryClient.fetch(SettingsQuery.updateBackupTime(backupTime)).first;

  Future<void> updateBackupInterval(int backupInterval) => ferryClient
      .fetch(SettingsQuery.updateBackupInterval(backupInterval))
      .first;

  Future<void> updateBackupTTL(int backupTTL) =>
      ferryClient.fetch(SettingsQuery.updateBackupTTL(backupTTL)).first;
}

@riverpod
SettingsRepository settingsRepository(SettingsRepositoryRef ref) =>
    SettingsRepository(ref.watch(ferryClientProvider));
