import 'package:get/get.dart';

import '../controllers/sources_controller.dart';

class SourcesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SourcesController>(
      () => SourcesController(),
    );
  }
}
