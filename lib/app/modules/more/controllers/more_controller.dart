import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../core/constants/db_keys.dart';

class MoreController extends GetxController {
  final LocalStorageService localStorageService =
      Get.find<LocalStorageService>();
  late RxBool _isDark;
  bool get isDark => _isDark.value;

  set isDark(bool value) => _isDark.value = value;

  @override
  void onInit() {
    _isDark = localStorageService.isDark.obs;
    localStorageService.box.listenKey(darkModeKey, (value) {
      isDark = value;
      Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
    });
    super.onInit();
  }
}
