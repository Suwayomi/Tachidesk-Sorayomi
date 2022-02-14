import 'dart:io';

import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../../main.dart';
import '../../../data/repository/extension_repository.dart';
import '../../extensions/controllers/extensions_controller.dart';

class BrowseController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final LocalStorageService localStorageService =
      Get.find<LocalStorageService>();

  final RxInt _tabIndex = 0.obs;
  int get tabIndex => _tabIndex.value;

  final TextEditingController textEditingController = TextEditingController();

  final RxBool _isSearching = false.obs;
  bool get isSearching => _isSearching.value;
  set isSearching(bool value) => _isSearching.value = value;

  void installExtensionApk() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowedExtensions: [".apk"]);
    if (result != null && result.files.single.path!.endsWith("apk")) {
      File file = File(result.files.single.path!);
      Get.rawSnackbar(
        title: LocaleKeys.extensionScreen_installFile_title.tr,
        message: LocaleKeys.extensionScreen_installFile_subtitle.tr,
      );

      Response res = await ExtensionRepository.installExtensionFile(file);
      if (res.statusCode == null || res.statusCode == 200) {
        try {
          Get.find<ExtensionsController>().updateExtensionList();
        } catch (e) {/**/}
        Get.rawSnackbar(
          title: LocaleKeys.extensionScreen_extensionInstalled_title.tr,
          message: LocaleKeys.extensionScreen_extensionInstalled_subtitle.tr,
        );
      } else {
        Get.rawSnackbar(
          title: LocaleKeys.error_installeExtensionFile_title.tr,
          message: LocaleKeys.error_installeExtensionFile_message.tr,
        );
      }
    } else {
      if (result != null && !result.files.single.path!.endsWith(".apk")) {
        Get.rawSnackbar(
          title: LocaleKeys.error_filePickUnknownExtension_title.tr,
          message: LocaleKeys.error_filePickUnknownExtension_message
              .trParams({"extensionName": ".apk"}),
        );
      } else {
        Get.rawSnackbar(
          title: LocaleKeys.error_filePick_title.tr,
          message: LocaleKeys.error_filePick_message
              .trParams({"process": "installing"}),
        );
      }
    }
  }

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    tabController.addListener(() => _tabIndex.value = tabController.index);

    super.onInit();
  }
}
