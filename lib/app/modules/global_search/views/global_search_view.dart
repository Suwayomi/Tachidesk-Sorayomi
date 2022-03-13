import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../widgets/emoticons.dart';
import '../controllers/global_search_controller.dart';
import '../widgets/source_search_grid.dart';

class GlobalSearchView extends GetView<GlobalSearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: context.width > 600
              ? Text(LocaleKeys.globalSearchScreen_searchGlobally.tr)
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller.textEditingController,
                    autofocus: true,
                    onEditingComplete: () => controller.query =
                        controller.textEditingController.text,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          controller.query =
                              controller.textEditingController.text;
                        },
                      ),
                      border: OutlineInputBorder(),
                      hintText: LocaleKeys.searchManga_searchManga.tr,
                    ),
                  ),
                ),
          actions: [
            context.width > 600
                ? Container(
                    padding: EdgeInsets.all(8.0),
                    width: 300,
                    child: TextField(
                      controller: controller.textEditingController,
                      autofocus: true,
                      onEditingComplete: () => controller.query =
                          controller.textEditingController.text,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            controller.query =
                                controller.textEditingController.text;
                          },
                        ),
                        border: OutlineInputBorder(),
                        hintText: LocaleKeys.searchManga_searchManga.tr,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
        body: Obx(() => ((controller.query.isNotEmpty))
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
                  emptyType: LocaleKeys.globalSearchScreen_globalSearch.tr,
                ),
              )));
  }
}
