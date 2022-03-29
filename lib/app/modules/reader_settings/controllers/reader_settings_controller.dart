import 'package:get/get.dart';

import '../../../core/values/db_keys.dart';
import '../../../data/enums/reader_mode.dart';
import '../../../data/services/local_storage_service.dart';

class ReaderSettingsController extends GetxController {
  final LocalStorageService localStorageService =
      Get.find<LocalStorageService>();

  final Rx<ReaderMode> readerMode = ReaderMode.webtoon.obs;
  @override
  void onInit() {
    readerMode.value = localStorageService.readerMode;

    localStorageService.box.listenKey(
      readerModeKey,
      (value) => readerMode.value = readerModeFromString(value),
    );
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {}
}
