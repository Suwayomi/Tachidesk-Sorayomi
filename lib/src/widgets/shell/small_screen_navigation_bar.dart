// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import '../../constants/navigation_bar_data.dart';

class SmallScreenNavigationBar extends StatelessWidget {
  const SmallScreenNavigationBar({super.key, required this.selectedScreen});

  final String selectedScreen;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      currentIndex: NavigationBarData.indexWherePathOrZero(selectedScreen),
      onTap: (value) => context.go(NavigationBarData.navList[value].path),
      items: NavigationBarData.navList
          .map<BottomNavigationBarItem>(
            (e) => BottomNavigationBarItem(
              icon: Icon(e.icon),
              label: e.label,
              activeIcon: Icon(e.activeIcon),
              tooltip: e.label,
            ),
          )
          .toList(),
    );
  }
}
