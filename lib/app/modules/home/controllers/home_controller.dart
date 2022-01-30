import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

const List<String> navigationBarPageNames = [
  Routes.library,
  Routes.updates,
  Routes.browse,
  Routes.downloads,
  Routes.more,
];

class HomeController extends GetxController {
  final PageController _pageController = PageController();
  final RxInt _selectedIndex = 0.obs;
  final RxBool _expandedState = false.obs;

  PageController get pageController => _pageController;

  int get selectedIndex => _selectedIndex.value;
  RxInt get selectedIndexObs => _selectedIndex;
  set selectedIndex(int value) => _selectedIndex.value = value;

  bool get expandedState => _expandedState.value;
  set expandedState(bool value) => _expandedState.value = value;

  @override
  void onInit() {
    _selectedIndex.listen((index) {
      pageController.jumpToPage(index);
    });
    super.onInit();
  }
}
