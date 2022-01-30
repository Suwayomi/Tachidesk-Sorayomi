import 'package:get/get.dart';

import '../controllers/search_source_controller.dart';

class SearchSourceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchSourceController>(
      () => SearchSourceController(),
    );
  }
}
