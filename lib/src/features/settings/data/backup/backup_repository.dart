// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:dio/dio.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../constants/endpoints.dart';
import '../../../../global_providers/global_providers.dart';

import '../../../../utils/extensions/custom_extensions.dart';
import '../../../../utils/storage/dio/dio_client.dart';
import '../../domain/backup_missing/backup_missing.dart';

part 'backup_repository.g.dart';

class BackupRepository {
  const BackupRepository(this.dioClient);

  final DioClient dioClient;

  Future<BackupMissing?> restoreBackup(
      BuildContext context, PlatformFile? file) async {
    if ((file?.name).isBlank ||
        (kIsWeb && (file?.bytes).isBlank ||
            (!kIsWeb && (file?.path).isBlank))) {
      throw context.l10n!.errorFilePick;
    }
    if (!(file!.name.endsWith('.proto.gz'))) {
      throw context.l10n!.errorFilePickUnknownExtension(".proto.gz");
    }
    return (await dioClient.post<BackupMissing, BackupMissing?>(
      BackupUrl.import,
      data: FormData.fromMap({
        'backup.proto.gz': kIsWeb
            ? MultipartFile.fromBytes(
                file.bytes!,
                filename: "backup.proto.gz",
              )
            : MultipartFile.fromFileSync(
                file.path!,
                filename: "backup.proto.gz",
              )
      }),
      decoder: (e) =>
          e is Map<String, dynamic> ? BackupMissing.fromJson(e) : null,
    ))
        .data;
  }
}

@riverpod
BackupRepository backupRepository(BackupRepositoryRef ref) =>
    BackupRepository(ref.watch(dioClientKeyProvider));
