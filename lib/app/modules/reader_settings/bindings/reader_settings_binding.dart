import 'package:get/get.dart';

import '../controllers/reader_settings_controller.dart';

class ReaderSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReaderSettingsController>(
      () => ReaderSettingsController(),
    );
  }
}
