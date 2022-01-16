import 'package:get/get.dart';

import '../controllers/browse_settings_controller.dart';

class BrowseSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BrowseSettingsController>(
      () => BrowseSettingsController(),
    );
  }
}
