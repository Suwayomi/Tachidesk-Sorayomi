// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../constants/navigation_bar_data.dart';

class SmallScreenNavigationBar extends StatelessWidget {
  const SmallScreenNavigationBar({super.key, required this.selectedScreen});

  final String selectedScreen;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: NavigationBarData.indexWherePathOrZero(selectedScreen),
      onDestinationSelected: (value) =>
          context.go(NavigationBarData.navList[value].path),
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
