// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

enum AuthType { none, basic }

enum ReaderMode {
  defaultReader,
  continuousHorizontalLTR,
  continuousHorizontalRTL,
  continuousVertical,
  singleHorizontalLTR,
  singleHorizontalRTL,
  singleVertical,
  webtoon,
}

enum ReaderNavigationLayout {
  defaultNavigation,
  lShaped,
  rightAndLeft,
  edge,
  kindlish,
  disabled,
}

enum MangaSort { alphabetical, dateAdded, unread }

enum ChapterSort { source, fetchedDate }

enum DisplayMode {
  grid(Icons.grid_view_rounded),
  list(Icons.view_list_rounded),
  descriptiveList(Icons.view_list_rounded),
  ;

  static const List<DisplayMode> sourceDisplayList = [
    DisplayMode.grid,
    DisplayMode.list
  ];

  final IconData icon;
  const DisplayMode(this.icon);
}

enum MangaStatus {
  unknown("UNKNOWN", Icons.block_outlined),
  ongoing("ONGOING", Icons.schedule_rounded),
  completed("COMPLETED", Icons.done_all_rounded),
  licensed("LICENSED", Icons.shield_rounded),
  publishingFinished("PUBLISHING_FINISHED", Icons.publish_rounded),
  cancelled("CANCELLED", Icons.cancel_rounded),
  onHiatus("ON_HIATUS", Icons.pause_circle_rounded);

  final IconData icon;
  final String title;
  const MangaStatus(
    this.title,
    this.icon,
  );
  static final _statusMap = <String, MangaStatus>{
    for (MangaStatus status in MangaStatus.values) status.title: status
  };
  static MangaStatus fromJson(String status) =>
      _statusMap[status] ?? MangaStatus.unknown;
  static String toJson(MangaStatus? status) =>
      status?.title ?? MangaStatus.unknown.title;
}

enum SourceType {
  latest(Icons.new_releases_outlined, Icons.new_releases_rounded),
  popular(Icons.favorite_border_rounded, Icons.favorite_rounded),
  filter(Icons.filter_list_outlined, Icons.filter_list_rounded);

  const SourceType(this.icon, this.selectedIcon);

  final IconData icon;
  final IconData selectedIcon;
}
