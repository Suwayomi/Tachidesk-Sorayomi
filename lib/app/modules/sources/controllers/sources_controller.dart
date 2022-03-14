import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../core/utils/language.dart';
import '../../../core/values/db_keys.dart';
import '../../../data/source_model.dart';
import '../repository/sources_repository.dart';

class SourcesController extends GetxController {
  final SourcesRepository repository = SourcesRepository();
  final LocalStorageService localStorageService =
      Get.find<LocalStorageService>();
  final RxList<Source> sourceList = <Source>[].obs;

  final RxBool _isLoading = true.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  List<Language> groupByLanguageList = [];

  RxMap<Language, List<Source>> groupByMap = <Language, List<Source>>{}.obs;

  Map<Language, List<Source>> groupBy() {
    var map = <Language, List<Source>>{};
    for (var element in sourceList) {
      if (localStorageService.sourceLanguages.contains(element.lang!)) {
        (map[langCodeToName(element.lang!)] ??= []).add(element);
      }
      if (element.id == localStorageService.lastUsed) {
        (map[langCodeToName('lastused')] ??= []).add(element);
      }
    }
    groupByLanguageList = map.keys.toList()
      ..sort((l1, l2) => langSortCmp(l1, l2));
    return map;
  }

  Future<void> updateSourceList() async {
    isLoading = true;
    sourceList.value = (await repository.getSourceList()) ?? sourceList;
    groupByMap.value = groupBy();
    isLoading = false;
  }

  @override
  void onReady() async {
    // sourceList.listen((p0) => groupByMap.value = groupBy);
    localStorageService.box.listenKey(sourceLangKey, (value) {
      groupByMap.value = groupBy();
    });
    localStorageService.box.listenKey(lastUsedKey, (value) {
      groupByMap.value = groupBy();
    });
    await updateSourceList();
    super.onReady();
  }
}
