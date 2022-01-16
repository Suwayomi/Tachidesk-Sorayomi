import 'package:get/get.dart';

import '../controllers/server_settings_controller.dart';

class ServerSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServerSettingsController>(
      () => ServerSettingsController(),
    );
  }
}
