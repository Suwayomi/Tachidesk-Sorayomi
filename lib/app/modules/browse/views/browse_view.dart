import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../extensions/views/extensions_view.dart';
import '../../sources/views/sources_view.dart';
import '../controllers/browse_controller.dart';

class BrowseView extends GetView<BrowseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
          controller: controller.tabController,
          padding: EdgeInsets.all(8),
          isScrollable: context.width > 700 ? true : false,
          labelColor: context.theme.indicatorColor,
          unselectedLabelColor: context.textTheme.bodyText1!.color,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: context.theme.indicatorColor.withOpacity(.3),
          ),
          tabs: [
            Tab(text: LocaleKeys.screenTitle_sources.tr),
            Tab(text: LocaleKeys.screenTitle_extensions.tr),
          ]),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          SourcesView(),
          ExtensionsView(),
        ],
      ),
    );
  }
}
