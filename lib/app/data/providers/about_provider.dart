import 'package:get/get.dart';

import '../../../main.dart';
import '../../core/constants/api_url.dart';
import '../about_model.dart';

class AboutProvider extends GetConnect {
  AboutProvider() : super(timeout: Duration(minutes: 1));
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();

  Future<About?> getAbout() async {
    final response = await get(_localStorageService.baseURL + aboutURL);
    return About.fromMap(response.body);
  }
}
