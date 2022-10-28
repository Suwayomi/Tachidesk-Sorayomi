// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/string_extensions.dart';
import '../../../constants/endpoints.dart';
import '../../../global_providers/global_providers.dart';
import '../../../i18n/locale_keys.g.dart';
import '../../../utils/storage/dio/dio_client.dart';
import '../domain/extension/extension_model.dart';

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
            ExtensionUrl.extensionInstall,
            data: FormData.fromMap({
              'file': MultipartFile.fromFileSync(
                file.path!,
                filename: file.name,
              )
            }),
          ))
            .data
        : null;
  }

  Future<List<Extension>?> getExtensionList({CancelToken? cancelToken}) async =>
      (await dioClient.get<List<Extension>, Extension>(
        ExtensionUrl.extensionList,
        decoder: (e) =>
            e is Map<String, dynamic> ? Extension.fromJson(e) : Extension(),
        cancelToken: cancelToken,
      ))
          .data;
}

final extensionRepositoryProvider = Provider<ExtensionRepository>(
  (ref) => ExtensionRepository(ref.watch(dioClientProvider)),
);
