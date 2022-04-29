import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../enums/auth_type.dart';
import '../services/local_storage_service.dart';
import '../settings_model.dart';

class SettingsProvider extends GetConnect {
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Settings.fromMap(map);
      if (map is List) {
        return map.map((item) => Settings.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = "${_localStorageService.baseURL}/meta";
    httpClient.timeout = Duration(minutes: 5);
    httpClient.addRequestModifier((Request request) async {
      final token = _localStorageService.basicAuth;
      // Set the header
      if (_localStorageService.baseAuthType == AuthType.basic) {
        request.headers['Authorization'] = token;
      }
      return request;
    });
  }

  Future<Settings?> getSettings() async {
    final response = await get('');
    if (response.hasError) return Settings();
    return response.body;
  }
}
