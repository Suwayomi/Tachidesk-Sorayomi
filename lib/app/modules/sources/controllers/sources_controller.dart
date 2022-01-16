import 'package:get/get.dart';
import 'package:tachidesk_flutter/app/data/repository/source_repository.dart';
import 'package:tachidesk_flutter/app/data/source_model.dart';
import 'package:tachidesk_flutter/main.dart';

class SourcesController extends GetxController {
  final SourceRepository _sourceRepository = SourceRepository();
  final LocalStorageService localStorageService =
      Get.find<LocalStorageService>();
  final RxList<Source> sourceList = <Source>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    sourceList.value = (await _sourceRepository.getSourceList()) ?? sourceList;
    super.onReady();
  }

  @override
  void onClose() {}
}
