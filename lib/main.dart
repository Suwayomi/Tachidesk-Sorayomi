import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/core/constants/db_keys.dart';
import 'app/core/utils/language.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

class LocalStorageService extends GetxService {
  final box = GetStorage();

  // Browse Source Screen Start
  String? get lastUsed => box.read<String>(lastUsedKey);
  set lastUsed(String? source) => box.write(lastUsedKey, source);

  List get sourceLanguages =>
      box.read<List?>(sourceLangKey) ?? sourceDefualtLangs();
  set sourceLanguages(List langs) => box.write(sourceLangKey, langs);
  // End

  bool get isDark => box.read(darkModeKey) ?? false;
  ThemeMode get theme => isDark ? ThemeMode.dark : ThemeMode.light;
  set isDark(bool val) => box.write(darkModeKey, val);

  bool get showNSFW => box.read(showNsfwKey) ?? false;
  set showNSFW(bool val) => box.write(showNsfwKey, val);

  String get baseURL => box.read(baseUrlKey) ?? "http://127.0.0.1:4567";
  set baseURL(String val) => box.write(baseUrlKey, val);
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
      debugShowCheckedModeBanner: false,
    ),
  );
}
