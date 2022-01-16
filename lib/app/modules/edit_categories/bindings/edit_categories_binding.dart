import 'package:get/get.dart';

import '../controllers/edit_categories_controller.dart';

class EditCategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditCategoriesController>(
      () => EditCategoriesController(),
    );
  }
}
