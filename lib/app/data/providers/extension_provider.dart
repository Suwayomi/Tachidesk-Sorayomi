import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';

import '../../../main.dart';
import '../../core/constants/api_url.dart';
import '../extension_model.dart';

class ExtensionProvider extends GetConnect {
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Extension.fromJson(map);
      if (map is List) {
        return map.map((item) => Extension.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = _localStorageService.baseURL + extensionURL;
  }

  Future<List<Extension>?> getExtensionList() async {
    final response = await get<List<Extension>>(
        _localStorageService.baseURL + extensionURL + '/list',
        decoder: (map) =>
            map.map<Extension>((item) => Extension.fromJson(item)).toList());
    return response.body;
  }

  Future installExtension(String pkgName) async {
    final response = await get(
        _localStorageService.baseURL + extensionURL + '/install/$pkgName');
    return response.body;
  }

  Future updateExtension(String pkgName) async {
    final response = await get(
        _localStorageService.baseURL + extensionURL + '/update/$pkgName');
    return response.body;
  }

  Future uninstallExtension(String pkgName) async {
    final response = await get(
        _localStorageService.baseURL + extensionURL + '/uninstall/$pkgName');
    return response.body;
  }

  Future<Response> installExtensionFile(File file) async {
    Uint8List bytefile = await file.readAsBytes();

    return await post(
      _localStorageService.baseURL + extensionURL + "/install",
      FormData({
        'file': MultipartFile(bytefile,
            filename: file.path.split("/").last.split('\\').last)
      }),
    );
  }
}
