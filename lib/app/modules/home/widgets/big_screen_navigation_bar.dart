import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class BigScreenNavigationBar extends StatelessWidget {
  const BigScreenNavigationBar({
    Key? key,
    required this.controller,
    required this.navigationBarTitles,
  }) : super(key: key);

  final HomeController controller;
  final List<String> navigationBarTitles;

  @override
  Widget build(BuildContext context) {
    return Obx(() => NavigationRail(
          useIndicator: true,
          elevation: 5,
          extended: controller.expandedState,
          selectedIndex: controller.selectedIndex,
          selectedIconTheme: IconThemeData(color: Get.theme.indicatorColor),
          selectedLabelTextStyle: TextStyle(color: Get.theme.indicatorColor),
          onDestinationSelected: (value) => controller.selectedIndex = value,
          labelType: controller.expandedState
              ? NavigationRailLabelType.none
              : NavigationRailLabelType.all,
          leading: IconButton(
            onPressed: () =>
                controller.expandedState = !controller.expandedState,
            icon: Icon(
              controller.expandedState
                  ? Icons.arrow_back_ios
                  : Icons.arrow_forward_ios,
              color: Get.theme.unselectedWidgetColor,
            ),
          ),
          destinations: <NavigationRailDestination>[
            NavigationRailDestination(
              icon: Icon(Icons.collections_bookmark_outlined),
              selectedIcon: Icon(Icons.collections_bookmark_rounded),
              label: Text(navigationBarTitles[0].tr),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.new_releases_outlined),
              selectedIcon: Icon(Icons.new_releases_rounded),
              label: Text(navigationBarTitles[1].tr),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.explore_outlined),
              selectedIcon: Icon(Icons.explore_rounded),
              label: Text(navigationBarTitles[2].tr),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.download_outlined),
              selectedIcon: Icon(Icons.download_rounded),
              label: Text(navigationBarTitles[3].tr),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.more_horiz_outlined),
              selectedIcon: Icon(Icons.more_horiz_rounded),
              label: Text(navigationBarTitles[4].tr),
            ),
          ],
        ));
  }
}
