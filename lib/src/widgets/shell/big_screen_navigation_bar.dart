// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:go_router/go_router.dart';

// 🌎 Project imports:
import '../../constants/navigation_bar_data.dart';
import '../../features/manga_book/widgets/update_status_nav_rail_leading.dart';
import '../../utils/extensions/custom_extensions/context_extensions.dart';

class BigScreenNavigationBar extends StatelessWidget {
  const BigScreenNavigationBar({super.key, required this.selectedScreen});

  final String selectedScreen;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      useIndicator: true,
      elevation: 5,
      extended: context.isDesktop,
      labelType: context.isDesktop
          ? NavigationRailLabelType.none
          : NavigationRailLabelType.all,
      leading: const UpdateStatusNavRailLeading(),
      destinations: NavigationBarData.navList
          .map<NavigationRailDestination>(
            (e) => NavigationRailDestination(
              icon: Icon(e.icon),
              label: Text(e.label),
              selectedIcon: Icon(e.activeIcon),
            ),
          )
          .toList(),
      selectedIndex: NavigationBarData.indexWherePathOrZero(selectedScreen),
      onDestinationSelected: (value) =>
          context.go(NavigationBarData.navList[value].path.first),
    );
  }
}
