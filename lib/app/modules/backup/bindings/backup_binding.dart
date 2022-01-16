import 'package:get/get.dart';

import '../controllers/backup_controller.dart';

class BackupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BackupController>(
      () => BackupController(),
    );
  }
}
