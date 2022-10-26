import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:tachidesk_sorayomi/src/constants/navigation_bar_data.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';

import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/context_extensions.dart';

import '../../constants/gen/assets.gen.dart';
import '../../routes/router_config.dart';

class BigScreenNavigationBar extends HookWidget {
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
      leading: context.isDesktop
          ? TextButton.icon(
              onPressed: () => context.push(Routes.about),
              icon: ImageIcon(
                AssetImage(Assets.icons.darkIcon.path),
                size: 48,
              ),
              label: context.isDesktop
                  ? Text(LocaleKeys.appTitle.tr())
                  : const SizedBox.shrink(),
              style: TextButton.styleFrom(
                foregroundColor: context.textTheme.bodyLarge?.color,
              ),
            )
          : IconButton(
              onPressed: () => context.push(Routes.about),
              icon: ImageIcon(
                AssetImage(Assets.icons.darkIcon.path),
                size: 48,
              ),
            ),
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
          context.go(NavigationBarData.navList[value].path),
    );
  }
}
