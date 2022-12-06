// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../i18n/locale_keys.g.dart';
import '../routes/router_config.dart';

class NavigationBarData {
  final String label;
  final String path;
  final IconData icon;
  final IconData activeIcon;
  final List<String> activeOn;

  static int indexWherePathOrZero(path) {
    final index = navList
        .indexWhere((e) => e.activeOn.any((element) => path.contains(element)));
    return index > 0 ? index : 0;
  }

  static final navList = [
    NavigationBarData(
      icon: Icons.collections_bookmark_outlined,
      activeIcon: Icons.collections_bookmark_rounded,
      label: LocaleKeys.library.tr(),
      path: Routes.library,
      activeOn: [Routes.library],
    ),
    NavigationBarData(
      icon: Icons.new_releases_outlined,
      activeIcon: Icons.new_releases_rounded,
      label: LocaleKeys.updates.tr(),
      path: Routes.updates,
      activeOn: [Routes.updates],
    ),
    NavigationBarData(
      icon: Icons.explore_outlined,
      activeIcon: Icons.explore_rounded,
      label: LocaleKeys.browse.tr(),
      path: Routes.browse,
      activeOn: [Routes.browse],
    ),
    NavigationBarData(
      icon: Icons.download_outlined,
      activeIcon: Icons.download_rounded,
      label: LocaleKeys.downloads.tr(),
      path: Routes.downloads,
      activeOn: [Routes.downloads],
    ),
    NavigationBarData(
      icon: Icons.more_horiz_outlined,
      activeIcon: Icons.more_horiz_rounded,
      label: LocaleKeys.more.tr(),
      path: Routes.more,
      activeOn: [Routes.more, Routes.settings],
    ),
  ];

  NavigationBarData({
    required this.label,
    required this.path,
    required this.icon,
    required this.activeIcon,
    required this.activeOn,
  });
}
