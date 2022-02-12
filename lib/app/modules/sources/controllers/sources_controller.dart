import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../core/constants/db_keys.dart';
import '../../../core/utils/language.dart';
import '../../../data/repository/source_repository.dart';
import '../../../data/source_model.dart';

class SourcesController extends GetxController {
  final LocalStorageService localStorageService =
      Get.find<LocalStorageService>();
  final RxList<Source> sourceList = <Source>[].obs;
  List<Language> groupByLanguageList = [];
  RxMap<Language, List<Source>> groupByMap = <Language, List<Source>>{}.obs;

  Map<Language, List<Source>> get groupBy {
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
    sourceList.value = (await SourceRepository.getSourceList()) ?? sourceList;
  }

  @override
  void onReady() async {
    sourceList.listen((p0) => groupByMap.value = groupBy);
    localStorageService.box.listenKey(sourceLangKey, (value) {
      groupByMap.value = groupBy;
    });
    await updateSourceList();
    super.onReady();
  }
}
