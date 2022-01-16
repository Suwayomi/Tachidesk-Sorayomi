import 'package:get/get.dart';
import 'package:tachidesk_flutter/app/modules/browse/controllers/browse_controller.dart';
import 'package:tachidesk_flutter/app/modules/extensions/controllers/extensions_controller.dart';
import 'package:tachidesk_flutter/app/modules/sources/controllers/sources_controller.dart';

import '../../downloads/controllers/downloads_controller.dart';
import '../../more/controllers/more_controller.dart';
import '../../updates/controllers/updates_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<MoreController>(() => MoreController());
    Get.lazyPut<DownloadsController>(() => DownloadsController());
    Get.lazyPut<UpdatesController>(() => UpdatesController());
    Get.lazyPut<BrowseController>(() => BrowseController());
    Get.lazyPut<ExtensionsController>(() => ExtensionsController());
    Get.lazyPut<SourcesController>(() => SourcesController());
  }
}
