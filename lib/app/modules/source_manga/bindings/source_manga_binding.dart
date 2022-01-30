import 'package:get/get.dart';

import '../controllers/source_manga_controller.dart';

class SourceMangaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SourceMangaController>(
      () => SourceMangaController(),
    );
  }
}
