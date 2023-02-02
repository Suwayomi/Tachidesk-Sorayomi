// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../constants/endpoints.dart';
import '../../../../global_providers/global_providers.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions.dart';
import '../../../../utils/storage/dio/dio_client.dart';
import '../../domain/backup_missing/backup_missing.dart';

part 'backup_repository.g.dart';

class BackupRepository {
  const BackupRepository(this.dioClient);

  final DioClient dioClient;

  Future<BackupMissing?> restoreBackup(PlatformFile? file) async {
    if (kIsWeb == false) {
      if ((file?.path).isBlank) {
        throw LocaleKeys.error_filePick.tr();
      }
      if (!(file!.name.endsWith('.proto.gz'))) {
        throw LocaleKeys.error_filePickUnknownExtension
            .tr(namedArgs: {"extensionName": ".proto.gz"});
      }
      return (file.path).isNotBlank
          ? (await dioClient.post<BackupMissing, BackupMissing?>(
              BackupUrl.import,
              data: FormData.fromMap({
                'backup.proto.gz': MultipartFile.fromFileSync(
                  file.path!,
                  filename: "backup.proto.gz",
                )
              }),
              decoder: (e) =>
                  e is Map<String, dynamic> ? BackupMissing.fromJson(e) : null,
            ))
              .data
          : null;
    } else {
      if ((file?.bytes).isBlank) {
        throw LocaleKeys.error_filePick.tr();
      }
      if (!(file!.name.endsWith('.proto.gz'))) {
        throw LocaleKeys.error_filePickUnknownExtension
            .tr(namedArgs: {"extensionName": ".proto.gz"});
      }
      return (file.bytes).isNotBlank
          ? (await dioClient.post<BackupMissing, BackupMissing?>(
              BackupUrl.import,
              data: FormData.fromMap({
                'backup.proto.gz': MultipartFile.fromBytes(
                  file.bytes as List<int>,
                  filename: "backup.proto.gz",
                )
              }),
              decoder: (e) =>
                  e is Map<String, dynamic> ? BackupMissing.fromJson(e) : null,
            ))
              .data
          : null;
    }
  }
}

@riverpod
BackupRepository backupRepository(BackupRepositoryRef ref) =>
    BackupRepository(ref.watch(dioClientKeyProvider));
