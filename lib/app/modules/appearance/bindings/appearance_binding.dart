import 'package:get/get.dart';

import '../controllers/appearance_controller.dart';

class AppearanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppearanceController>(
      () => AppearanceController(),
    );
  }
}
