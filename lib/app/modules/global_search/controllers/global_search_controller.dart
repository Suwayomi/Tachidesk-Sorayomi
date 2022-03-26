import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/source_model.dart';
import '../repository/global_search_repository.dart';

class GlobalSearchController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  final GlobalSearchRepository repository = GlobalSearchRepository();

  final RxString _query = "".obs;
  String get query => _query.value;
  set query(String value) => _query.value = value;

  final RxList<Source> _sourceList = <Source>[].obs;
  List<Source> get sourceList => _sourceList;
  set sourceList(List<Source> value) => _sourceList.value = value;

  @override
  void onInit() {
    textEditingController.text = Get.parameters["query"] ?? "";
    query = textEditingController.text;
    super.onInit();
  }

  @override
  void onReady() async {
    sourceList = (await repository.getSourceList())
            ?.skipWhile((value) => value.id == '0')
            .toList() ??
        sourceList;
    // search();
    super.onReady();
  }

  @override
  void onClose() {}
}
