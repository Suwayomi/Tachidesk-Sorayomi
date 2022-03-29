import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/values/db_keys.dart';
import '../../../data/services/local_storage_service.dart';

class MoreController extends GetxController {
  final LocalStorageService localStorageService =
      Get.find<LocalStorageService>();
  late RxBool _isDark;
  bool get isDark => _isDark.value;
  set isDark(bool value) => _isDark.value = value;

  late RxString _baseURL;
  String get baseURL => _baseURL.value;
  set baseURL(String value) => _baseURL.value = value;

  @override
  void onInit() {
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
