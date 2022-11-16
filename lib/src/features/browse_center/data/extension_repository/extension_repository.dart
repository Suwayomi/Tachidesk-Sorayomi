// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 🌎 Project imports:
import '../../../../constants/endpoints.dart';
import '../../../../global_providers/global_providers.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/string_extensions.dart';
import '../../../../utils/storage/dio/dio_client.dart';
import '../../domain/extension/extension_model.dart';

part 'extension_repository.g.dart';

class ExtensionRepository {
  final DioClient dioClient;

  ExtensionRepository(this.dioClient);

  Future<void> installExtensionFile({
    PlatformFile? file,
    CancelToken? cancelToken,
  }) async {
    if ((file?.path).isBlank) {
      throw LocaleKeys.error_filePick.tr();
    }
    if (!(file!.name.endsWith('.apk'))) {
      throw LocaleKeys.error_filePickUnknownExtension
          .tr(namedArgs: {"extensionName": ".apk"});
    }
    return (file.path).isNotBlank
        ? (await dioClient.post(
            ExtensionUrl.installFile,
            data: FormData.fromMap({
              'file': MultipartFile.fromFileSync(
                file.path!,
                filename: file.name,
              )
            }),
            cancelToken: cancelToken,
          ))
            .data
        : null;
  }

  Future<void> installExtension(
    String pkgName, {
    CancelToken? cancelToken,
  }) =>
      dioClient.get(
        ExtensionUrl.installPkg(pkgName),
        cancelToken: cancelToken,
      );

  Future<void> uninstallExtension(
    String pkgName, {
    CancelToken? cancelToken,
  }) =>
      dioClient.get(
        ExtensionUrl.uninstallPkg(pkgName),
        cancelToken: cancelToken,
      );

  Future<void> updateExtension(
    String pkgName, {
    CancelToken? cancelToken,
  }) =>
      dioClient.get(
        ExtensionUrl.updatePkg(pkgName),
        cancelToken: cancelToken,
      );

  Future<List<Extension>?> getExtensionList({CancelToken? cancelToken}) async =>
      (await dioClient.get<List<Extension>, Extension>(
        ExtensionUrl.list,
        decoder: (e) =>
            e is Map<String, dynamic> ? Extension.fromJson(e) : Extension(),
        cancelToken: cancelToken,
      ))
          .data;
}

@riverpod
ExtensionRepository extensionRepository(ExtensionRepositoryRef ref) =>
    ExtensionRepository(ref.watch(dioClientKeyProvider));
