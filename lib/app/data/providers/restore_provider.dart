import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';

import '../../../main.dart';
import '../../core/constants/api_url.dart';

class RestoreProvider extends GetConnect {
  RestoreProvider() : super(timeout: Duration(minutes: 1));
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();

  Future<Response> postRestore(File file) async {
    Uint8List bytefile = await file.readAsBytes();

    return await post(
      _localStorageService.baseURL + restoreURL,
      FormData({
        'backup.proto.gz': MultipartFile(bytefile, filename: "backup.proto.gz")
      }),
    );
  }
}
