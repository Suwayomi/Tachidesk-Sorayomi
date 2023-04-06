// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import '../routes/router_config.dart';
import '../utils/extensions/custom_extensions.dart';

class NavigationBarData {
  final String Function(BuildContext context) label;
  final ValueSetter<BuildContext> go;
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
      label: (context) => context.l10n!.library,
      go: const LibraryRoute().go,
      activeOn: [const LibraryRoute().location],
    ),
    NavigationBarData(
      icon: Icons.new_releases_outlined,
      activeIcon: Icons.new_releases_rounded,
      label: (context) => context.l10n!.updates,
      go: const UpdatesRoute().go,
      activeOn: [const UpdatesRoute().location],
    ),
    NavigationBarData(
      icon: Icons.explore_outlined,
      activeIcon: Icons.explore_rounded,
      label: (context) => context.l10n!.browse,
      go: const BrowseRoute().go,
      activeOn: [const BrowseRoute().location],
    ),
    NavigationBarData(
      icon: Icons.download_outlined,
      activeIcon: Icons.download_rounded,
      label: (context) => context.l10n!.downloads,
      go: const DownloadsRoute().go,
      activeOn: [const DownloadsRoute().location],
    ),
    NavigationBarData(
      icon: Icons.more_horiz_outlined,
      activeIcon: Icons.more_horiz_rounded,
      label: (context) => context.l10n!.more,
      go: const MoreRoute().go,
      activeOn: [const MoreRoute().location, const SettingsRoute().location],
    ),
  ];

  NavigationBarData({
    required this.label,
    required this.go,
    required this.icon,
    required this.activeIcon,
    required this.activeOn,
  });
}
