import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../../main.dart';
import '../../../core/constants/db_keys.dart';

class ServerSettingsController extends GetxController {
  final LocalStorageService localStorageService =
      Get.find<LocalStorageService>();
  late final TextEditingController textEditingController;

  late RxString _baseURL;
  String get baseURL => _baseURL.value;

  set baseURL(String value) => _baseURL.value = value;

  void submitURL(String url) {
    final String urlRegx =
        r"https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()!@:%_\+.~#?&\/\/=]*)";
    final String urlLocal = "http://localhost:";
    if (url.startsWith(urlLocal) || RegExp(urlRegx).hasMatch(url)) {
      localStorageService.baseURL = (url.toLowerCase());
      Get.back();
    } else {
      Get.rawSnackbar(
        title: LocaleKeys.error_invalidURL_title.tr,
        message: LocaleKeys.error_invalidURL_message.tr,
      );
    }
  }

  @override
  void onInit() {
    textEditingController =
        TextEditingController(text: localStorageService.baseURL);
    _baseURL = localStorageService.baseURL.obs;
    localStorageService.box.listenKey(baseUrlKey, (value) {
      baseURL = value;
    });
    super.onInit();
  }
}
