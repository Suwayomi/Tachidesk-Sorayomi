import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';

import '../../core/values/api_url.dart';
import '../services/local_storage_service.dart';

class RestoreProvider extends GetConnect {
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();

  @override
  void onInit() {
    httpClient.baseUrl = _localStorageService.baseURL;
    httpClient.timeout = Duration(minutes: 5);
  }

  Future<Response> postRestore(File file) async {
    Uint8List bytefile = await file.readAsBytes();

    return await post(
      restoreURL,
      FormData({
        'backup.proto.gz': MultipartFile(
          bytefile,
          filename: "backup.proto.gz",
        )
      }),
    );
  }
}
