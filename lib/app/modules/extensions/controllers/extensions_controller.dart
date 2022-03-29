import 'package:get/get.dart';

import '../../../core/utils/language.dart';
import '../../../core/values/db_keys.dart';
import '../../../data/extension_model.dart';
import '../../../data/services/local_storage_service.dart';
import '../../browse/controllers/browse_controller.dart';
import '../../sources/controllers/sources_controller.dart';
import '../repository/extension_repository.dart';

class ExtensionsController extends GetxController {
  final ExtensionRepository repository = ExtensionRepository();
  final RxBool isLoading = true.obs;
  final SourcesController _sourcesController = Get.find<SourcesController>();
  final BrowseController _browseController = Get.find<BrowseController>();
  final LocalStorageService localStorageService =
      Get.find<LocalStorageService>();
  final RxList<Extension> extensionList = <Extension>[].obs;
  List<Language> groupByLanguageList = [];
  RxMap<Language, List<Extension>> groupByMap =
      <Language, List<Extension>>{}.obs;

  Map<Language, List<Extension>> get groupBy {
    var map = <Language, List<Extension>>{};
    for (var element in extensionList) {
      if (element.isNsfw! && !localStorageService.showNSFW) {
        continue;
      }
      if (localStorageService.sourceLanguages.contains(element.lang!) &&
          ((_browseController.textEditingController.text.isEmpty) ||
              (element.name ?? element.apkName ?? "").toLowerCase().contains(
                    _browseController.textEditingController.text.toLowerCase(),
                  ))) {
        if (element.installed ?? false) {
          if (element.hasUpdate ?? false) {
            (map[langCodeToName('update')] ??= []).add(element);
          } else {
            (map[langCodeToName('installed')] ??= []).add(element);
          }
        } else {
          (map[langCodeToName(element.lang!)] ??= []).add(element);
        }
      }
    }

    groupByLanguageList = map.keys.toList()
      ..sort((l1, l2) => langSortCmp(l1, l2));
    return map;
  }

  // @override
  // void onInit() async {
  //   extensionList.value = (await _extensionRepository.getExtensionList()) ?? extensionList;
  //   super.onInit();
  // }

  Future<void> updateExtensionList() async {
    extensionList.value =
        (await repository.getExtensionList()) ?? extensionList;
    await _sourcesController.updateSourceList();
  }

  @override
  void onReady() async {
    extensionList.listen((p0) => groupByMap.value = groupBy);
    localStorageService.box.listenKey(sourceLangKey, (value) {
      groupByMap.value = groupBy;
    });
    _browseController.textEditingController.addListener(
      () => groupByMap.value = groupBy,
    );
    await updateExtensionList();
    isLoading.value = false;
    super.onReady();
  }

  @override
  void onClose() {}
}
