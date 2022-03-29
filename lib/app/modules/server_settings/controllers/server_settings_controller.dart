import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/values/db_keys.dart';
import '../../../data/enums/auth_type.dart';
import '../../../data/services/local_storage_service.dart';

class ServerSettingsController extends GetxController {
  final LocalStorageService localStorageService =
      Get.find<LocalStorageService>();
  late final TextEditingController baseUrlEditingController;
  late final TextEditingController userNameEditingController;
  late final TextEditingController passwordEditingController;

  late RxString _baseURL;
  String get baseURL => _baseURL.value;
  final Rx<AuthType> _baseAuthType = AuthType.none.obs;
  AuthType get baseAuthType => _baseAuthType.value;
  set baseAuthType(AuthType value) => _baseAuthType.value = value;

  set baseURL(String value) => _baseURL.value = value;

  String removeTrailing(String pattern, String from) {
    int i = from.length;
    while (from.startsWith(pattern, i - pattern.length)) {
      i -= pattern.length;
    }
    return from.substring(0, i);
  }

  void submitURL(String url) async {
    final String urlRegx =
        r"https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()!@:%_\+.~#?&\/\/=]*)";
    final String urlLocal = "http://localhost:";
    if (url.startsWith(urlLocal) || RegExp(urlRegx).hasMatch(url)) {
      await localStorageService
          .setBaseURL(removeTrailing("/", url).toLowerCase());
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
    baseUrlEditingController =
        TextEditingController(text: localStorageService.baseURL);
    userNameEditingController =
        TextEditingController(text: localStorageService.authUserName);
    passwordEditingController =
        TextEditingController(text: localStorageService.authPassword);

    _baseURL = localStorageService.baseURL.obs;
    baseAuthType = localStorageService.baseAuthType;
    localStorageService.box.listenKey(baseUrlKey, (value) {
      baseURL = value;
    });
    localStorageService.box.listenKey(baseAuthTypeKey, (value) {
      baseAuthType = authTypeFromString(value);
    });
    super.onInit();
  }
}
