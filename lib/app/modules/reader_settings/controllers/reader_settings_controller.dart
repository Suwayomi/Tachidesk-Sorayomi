import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../core/constants/db_keys.dart';
import '../../../core/enums/reader_mode.dart';

class ReaderSettingsController extends GetxController {
  final LocalStorageService localStorageService =
      Get.find<LocalStorageService>();

  final Rx<ReaderMode> readerMode = ReaderMode.webtoon.obs;
  @override
  void onInit() {
    readerMode.value = localStorageService.readerMode;

    localStorageService.box.listenKey(
      readerModeKey,
      (value) =>
          readerMode.value = stringToReaderMode(value) ?? readerMode.value,
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
