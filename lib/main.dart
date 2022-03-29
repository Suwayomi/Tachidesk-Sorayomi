import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/data/services/local_storage_service.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

void main() async {
  await GetStorage.init();
  final controller = Get.put(LocalStorageService());
  runApp(
    GetMaterialApp(
      title: "Tachidesk Sorayomi",
      translationsKeys: AppTranslation.translations,
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
        iconTheme: IconThemeData(
          color: ColorScheme.light().primary,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.dark(),
        iconTheme: IconThemeData(
          color: ColorScheme.dark().primary,
        ),
      ),
      themeMode: controller.theme,
      debugShowCheckedModeBanner: false,
    ),
  );
}
