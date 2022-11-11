// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:go_router/go_router.dart';

// 🌎 Project imports:
import '../../constants/navigation_bar_data.dart';

class SmallScreenNavigationBar extends StatelessWidget {
  const SmallScreenNavigationBar({super.key, required this.selectedScreen});

  final String selectedScreen;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: NavigationBarData.indexWherePathOrZero(selectedScreen),
      onDestinationSelected: (value) =>
          context.go(NavigationBarData.navList[value].path.first),
      destinations: NavigationBarData.navList
          .map<NavigationDestination>(
            (e) => NavigationDestination(
              icon: Icon(e.icon),
              label: e.label,
              selectedIcon: Icon(e.activeIcon),
              tooltip: e.label,
            ),
          )
          .toList(),
    );
  }
}
