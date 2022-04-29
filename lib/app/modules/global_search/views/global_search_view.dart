import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../widgets/emoticons.dart';
import '../controllers/global_search_controller.dart';
import '../widgets/global_search_field.dart';
import '../widgets/source_search_grid.dart';

class GlobalSearchView extends GetView<GlobalSearchController> {
  final globalSearchhTag = Get.parameters["query"];
  @override
  Widget build(BuildContext context) {
    GlobalSearchController controller =
        Get.find<GlobalSearchController>(tag: globalSearchhTag);
    return Scaffold(
      appBar: AppBar(
        title: context.width > 700
            ? Text(LocaleKeys.globalSearchScreen_searchGlobally.tr)
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GlobalSearchField(controller: controller),
              ),
        actions: [
          context.width > 700
              ? Container(
                  padding: EdgeInsets.all(8.0),
                  width: 300,
                  child: GlobalSearchField(controller: controller),
                )
              : Container(),
        ],
      ),
      body: Obx(
        () => ((controller.query.isNotEmpty))
            ? ListView.builder(
                itemCount: controller.sourceList.length,
                itemBuilder: (context, index) => SourceSearchGrid(
                  source: controller.sourceList[index],
                  query: controller.query,
                  repository: controller.repository,
                ),
              )
            : Center(
                child: EmoticonsView(
                  text: "${LocaleKeys.no.tr} "
                      "${LocaleKeys.globalSearchScreen_globalSearch.tr}",
                ),
              ),
      ),
    );
  }
}
