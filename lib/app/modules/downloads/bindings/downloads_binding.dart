import 'package:get/get.dart';

import '../controllers/downloads_controller.dart';

class DownloadsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DownloadsController>(
      () => DownloadsController(),
    );
  }
}
