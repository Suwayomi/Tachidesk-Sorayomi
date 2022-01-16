import 'package:get/get.dart';

import '../controllers/updates_controller.dart';

class UpdatesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdatesController>(
      () => UpdatesController(),
    );
  }
}
