import 'package:get/get.dart';

import '../controllers/browse_controller.dart';

class BrowseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BrowseController>(
      () => BrowseController(),
    );
  }
}
