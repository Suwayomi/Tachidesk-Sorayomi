import 'package:get/get.dart';

import '../controllers/extensions_controller.dart';

class ExtensionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExtensionsController>(
      () => ExtensionsController(),
    );
  }
}
