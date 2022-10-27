// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../constants/endpoints.dart';
import '../../../global_providers/global_providers.dart';
import '../../../i18n/locale_keys.g.dart';
import '../../../utils/extensions/custom_extensions/string_extensions.dart';
import '../../../utils/storage/dio/dio_client.dart';
import '../domain/backup_missing/backup_missing.dart';

class BackupRepository {
  const BackupRepository(this.dioClient);

  final DioClient dioClient;

  Future<BackupMissing?> restoreBackup(PlatformFile? file) async {
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
  }
}

final backupRepositoryProvider = Provider.autoDispose<BackupRepository>(
  (ref) => BackupRepository(ref.watch(dioClientProvider)),
);
