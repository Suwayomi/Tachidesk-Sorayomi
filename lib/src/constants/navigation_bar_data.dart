// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';

// 🌎 Project imports:
import '../i18n/locale_keys.g.dart';
import '../routes/router_config.dart';

class NavigationBarData {
  final String label;
  final List<String> path;
  final IconData icon;
  final IconData activeIcon;

  static int indexWherePathOrZero(path) {
    final index = navList
        .indexWhere((e) => e.path.any((element) => path.contains(element)));
    return index > 0 ? index : 0;
  }

  static final navList = [
    NavigationBarData(
      icon: Icons.collections_bookmark_outlined,
      activeIcon: Icons.collections_bookmark_rounded,
      label: LocaleKeys.library.tr(),
      path: [Routes.library],
    ),
    NavigationBarData(
      icon: Icons.new_releases_outlined,
      activeIcon: Icons.new_releases_rounded,
      label: LocaleKeys.updates.tr(),
      path: [Routes.updates],
    ),
    NavigationBarData(
      icon: Icons.explore_outlined,
      activeIcon: Icons.explore_rounded,
      label: LocaleKeys.browse.tr(),
      path: [Routes.browse],
    ),
    NavigationBarData(
      icon: Icons.download_outlined,
      activeIcon: Icons.download_rounded,
      label: LocaleKeys.downloads.tr(),
      path: [Routes.downloads],
    ),
    NavigationBarData(
      icon: Icons.more_horiz_outlined,
      activeIcon: Icons.more_horiz_rounded,
      label: LocaleKeys.more.tr(),
      path: [Routes.more, Routes.settings],
    ),
  ];

  NavigationBarData({
    required this.label,
    required this.path,
    required this.icon,
    required this.activeIcon,
  });
}
