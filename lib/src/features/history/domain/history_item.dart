// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import '../../../utils/extensions/custom_extensions.dart';
import '../../manga_book/domain/chapter/chapter_model.dart';

// Use existing ChapterWithMangaDto as the base for history items
// since it already contains all the data we need including lastReadAt
typedef HistoryItemDto = ChapterWithMangaDto;

extension HistoryItemExtension on HistoryItemDto {
  /// Get the read timestamp as DateTime
  DateTime? get readAt => lastReadAt.parseTimestamp;

  /// Check if this item was read today
  bool get isReadToday {
    final readDate = readAt;
    if (readDate == null) return false;
    return readDate.isToday;
  }

  /// Check if this item was read yesterday
  bool get isReadYesterday {
    final readDate = readAt;
    if (readDate == null) return false;
    return readDate.isYesterday;
  }

  /// Get a formatted date string for grouping (by day)
  String readDateGroup(BuildContext context) {
    final readDate = readAt;
    if (readDate == null) {
      return DateGroupKeys.recentlyRead.toLocale(context);
    }

    return readDate.dateGroupString(context);
  }

  /// Get a simple key for grouping without needing context
  String get readDateGroupKey {
    final readDate = readAt;
    if (readDate == null) {
      return DateGroupKeys.recentlyRead.value;
    }

    return readDate.dateGroupKey;
  }

  /// Search functionality for history items
  bool historyQuery([String? query]) {
    if (query.isBlank) return true;
    final searchQuery = query!.toLowerCase();

    return manga.title.toLowerCase().contains(searchQuery) ||
        name.toLowerCase().contains(searchQuery) ||
        (manga.author?.toLowerCase().contains(searchQuery) ?? false) ||
        (scanlator?.toLowerCase().contains(searchQuery) ?? false);
  }
}
