import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../../main.dart';
import '../../extensions/controllers/extensions_controller.dart';
import '../repository/browse_repository.dart';

class BrowseController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final BrowseRepository repository = Get.put(BrowseRepository());
  late TabController tabController;
  final LocalStorageService localStorageService =
      Get.find<LocalStorageService>();

  final RxInt _tabIndex = 0.obs;
  int get tabIndex => _tabIndex.value;

  final TextEditingController textEditingController = TextEditingController();

  final RxBool _isSearching = false.obs;
  bool get isSearching => _isSearching.value;
  set isSearching(bool value) => _isSearching.value = value;

  final RxBool _isGlobalMangaSearching = false.obs;
  bool get isGlobalMangaSearching => _isGlobalMangaSearching.value;
  set isGlobalMangaSearching(bool value) =>
      _isGlobalMangaSearching.value = value;

  void installExtensionApk() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ["apk"],
      type: FileType.custom,
    );
    if (result != null && result.files.single.extension == "apk") {
      Get.rawSnackbar(
        title: LocaleKeys.extensionScreen_installFile_title.tr,
        message: LocaleKeys.extensionScreen_installFile_subtitle.tr,
      );
      Uint8List bytefile;
      if (result.files.single.bytes == null) {
        bytefile = await File(result.files.single.path!).readAsBytes();
      } else {
        bytefile = result.files.single.bytes!;
      }
      Response res = await repository.installExtensionFile(
        bytefile: bytefile,
        filename: result.files.single.name,
      );
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
              .trParams({"process": "Install"}),
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
