import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';

import '../../../main.dart';
import '../../core/values/api_url.dart';
import '../extension_model.dart';

class ExtensionProvider extends GetConnect {
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is List) {
        return map.map((item) => Extension.fromMap(item)).toList();
      }
      if (map is Map<String, dynamic>) return Extension.fromMap(map);
    };
    httpClient.baseUrl = _localStorageService.baseURL + extensionURL;
    httpClient.timeout = Duration(minutes: 1);
  }

  Future<List<Extension>?> getExtensionList() async {
    final response = await get('/list');
    if (response.hasError) return <Extension>[];
    return response.body;
  }

  Future<Response> installExtension(String pkgName) async {
    final response = await get('/install/$pkgName');
    return response;
  }

  Future<Response> updateExtension(String pkgName) async {
    final response = await get('/update/$pkgName');
    return response;
  }

  Future<Response> uninstallExtension(String pkgName) async {
    final response = await get('/uninstall/$pkgName');
    return response;
  }

  Future<Response> installExtensionFile(File file) async {
    Uint8List bytefile = await file.readAsBytes();
    return await post(
      "/install",
      FormData({
        'file': MultipartFile(bytefile,
            filename: file.path.split("/").last.split('\\').last)
      }),
    );
  }
}
