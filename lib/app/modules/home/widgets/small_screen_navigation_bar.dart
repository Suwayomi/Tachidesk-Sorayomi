import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class SmallScreenNavigationBar extends StatelessWidget {
  const SmallScreenNavigationBar({
    Key? key,
    required this.controller,
    required this.navigationBarTitles,
  }) : super(key: key);

  final HomeController controller;
  final List<String> navigationBarTitles;

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Get.theme.unselectedWidgetColor,
          selectedItemColor: Get.theme.indicatorColor,
          currentIndex: controller.selectedIndex,
          onTap: (value) => controller.selectedIndex = value,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.collections_bookmark_outlined,
              ),
              label: navigationBarTitles[0].tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.new_releases_outlined,
              ),
              label: navigationBarTitles[1].tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              label: navigationBarTitles[2].tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.download_outlined,
              ),
              label: navigationBarTitles[3].tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.more_horiz_outlined,
              ),
              label: navigationBarTitles[4].tr,
            ),
          ],
        ));
  }
}
