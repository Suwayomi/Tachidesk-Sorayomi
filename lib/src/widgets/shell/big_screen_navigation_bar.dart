// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import '../../constants/gen/assets.gen.dart';
import '../../constants/navigation_bar_data.dart';
import '../../routes/router_config.dart';
import '../../utils/extensions/custom_extensions.dart';

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
      leading: context.isDesktop
          ? TextButton.icon(
              onPressed: () => const AboutRoute().push(context),
              icon: ImageIcon(
                AssetImage(Assets.icons.darkIcon.path),
                size: 48,
              ),
              label: Text(context.l10n!.appTitle),
              style: TextButton.styleFrom(
                foregroundColor: context.textTheme.bodyLarge?.color,
              ),
            )
          : IconButton(
              onPressed: () => const AboutRoute().push(context),
              icon: ImageIcon(
                AssetImage(Assets.icons.darkIcon.path),
                size: 48,
              ),
            ),
      destinations: NavigationBarData.navList
          .map<NavigationRailDestination>(
            (e) => NavigationRailDestination(
              icon: Icon(e.icon),
              label: Text(e.label(context)),
              selectedIcon: Icon(e.activeIcon),
            ),
          )
          .toList(),
      selectedIndex: NavigationBarData.indexWherePathOrZero(selectedScreen),
      onDestinationSelected: (value) =>
          NavigationBarData.navList[value].go(context),
    );
  }
}
