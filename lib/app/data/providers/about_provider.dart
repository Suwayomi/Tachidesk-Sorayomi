import 'package:get/get.dart';

import '../../../main.dart';
import '../../core/values/api_url.dart';
import '../about_model.dart';

class AboutProvider extends GetConnect {
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is List) {
        return map.map((item) => About.fromMap(item)).toList();
      }
      if (map is Map<String, dynamic>) return About.fromMap(map);
    };
    httpClient.baseUrl = _localStorageService.baseURL;
    httpClient.timeout = Duration(minutes: 5);
  }

  Future<About?> getAbout() async {
    final response = await get(aboutURL);
    if (response.hasError) return About();
    return response.body;
  }
}
