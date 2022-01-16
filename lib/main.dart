import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/core/constants/db_keys.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

class LocalStorageService extends GetxService {
  final box = GetStorage();

  bool get isDark => box.read(darkModeKey) ?? false;
  ThemeMode get theme => isDark ? ThemeMode.dark : ThemeMode.light;
  String get baseURL => box.read(baseUrlKey) ?? "http://127.0.0.1:4567";
  bool get showNSFW => box.read(showNsfwKey) ?? false;

  void changeTheme(bool val) {
    box.write(darkModeKey, val);
  }

  void changeNSFW(bool val) {
    box.write(showNsfwKey, val);
  }

  void changeBaseURL(String val) {
    box.write(baseUrlKey, val);
  }
}

void main() async {
  await GetStorage.init();
  final controller = Get.put(LocalStorageService());
  runApp(
    GetMaterialApp(
      title: LocaleKeys.appTitle.tr,
      translationsKeys: AppTranslation.translations,
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: controller.theme,
    ),
  );
}
