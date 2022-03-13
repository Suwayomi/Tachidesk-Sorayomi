import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../browse/views/browse_view.dart';
import '../../browse/widgets/browse_appbar_actions.dart';
import '../../downloads/views/downloads_view.dart';
import '../../library/views/library_view.dart';
import '../../library/widgets/library_appbar_actions.dart';
import '../../more/views/more_view.dart';
import '../../updates/views/updates_view.dart';
import '../controllers/home_controller.dart';
import '../widgets/big_screen_navigation_bar.dart';
import '../widgets/small_screen_navigation_bar.dart';

const List<String> navigationBarTitles = [
  LocaleKeys.screenTitle_library,
  LocaleKeys.screenTitle_updates,
  LocaleKeys.screenTitle_browse,
  LocaleKeys.screenTitle_downloads,
  LocaleKeys.screenTitle_more,
];

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(navigationBarTitles[controller.selectedIndex].tr),
        ),
        actions: [
          Obx(() => controller.selectedIndex == 0
              ? LibraryAppBarActions()
              : Container()),
          Obx(() => controller.selectedIndex == 2
              ? BrowseAppBarActions()
              : Container())
        ],
      ),
      bottomNavigationBar: context.width > 600.0
          ? null
          : SmallScreenNavigationBar(
              controller: controller,
              navigationBarTitles: navigationBarTitles,
            ),
      body: Row(
        children: [
          context.width > 600.0
              ? context.height < 500
                  ? SingleChildScrollView(
                      controller: ScrollController(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 500),
                        child: BigScreenNavigationBar(
                          controller: controller,
                          navigationBarTitles: navigationBarTitles,
                        ),
                      ),
                    )
                  : BigScreenNavigationBar(
                      controller: controller,
                      navigationBarTitles: navigationBarTitles,
                    )
              : Container(),
          Expanded(
            child: PageView(
              controller: controller.pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                LibraryView(),
                UpdatesView(),
                BrowseView(),
                DownloadsView(),
                MoreView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
