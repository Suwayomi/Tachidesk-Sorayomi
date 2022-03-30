import 'package:get/get.dart';

import '../controllers/global_search_controller.dart';

class GlobalSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GlobalSearchController>(
      () => GlobalSearchController(),
      tag: Get.parameters["query"],
    );
  }
}
