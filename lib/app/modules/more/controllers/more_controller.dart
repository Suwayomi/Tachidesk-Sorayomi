import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../../main.dart';
import '../../../core/values/db_keys.dart';

class MoreController extends GetxController {
  final LocalStorageService localStorageService =
      Get.find<LocalStorageService>();
  late RxBool _isDark;
  bool get isDark => _isDark.value;

  set isDark(bool value) => _isDark.value = value;

  late final TextEditingController textEditingController;

  late RxString _baseURL;
  String get baseURL => _baseURL.value;

  set baseURL(String value) => _baseURL.value = value;

  String removeTrailing(String pattern, String from) {
    int i = from.length;
    while (from.startsWith(pattern, i - pattern.length)) {
      i -= pattern.length;
    }
    return from.substring(0, i);
  }

  void submitURL(String url) {
    final String urlRegx =
        r"https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()!@:%_\+.~#?&\/\/=]*)";
    final String urlLocal = "http://localhost:";
    if (url.startsWith(urlLocal) || RegExp(urlRegx).hasMatch(url)) {
      localStorageService.baseURL = (removeTrailing("/", url).toLowerCase());
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
    _isDark = localStorageService.isDark.obs;
    localStorageService.box.listenKey(darkModeKey, (value) {
      isDark = value;
      Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
    });
    super.onInit();
  }
}
