import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tachidesk_flutter/app/modules/extensions/views/extensions_view.dart';
import 'package:tachidesk_flutter/app/modules/sources/views/sources_view.dart';
import 'package:tachidesk_flutter/generated/locales.g.dart';

import '../controllers/browse_controller.dart';

class BrowseView extends GetView<BrowseController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: TabBar(
            padding: EdgeInsets.all(8),
            isScrollable: context.width > 600 ? true : false,
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
          children: [
            SourcesView(),
            ExtensionsView(),
          ],
        ),
      ),
    );
  }
}
