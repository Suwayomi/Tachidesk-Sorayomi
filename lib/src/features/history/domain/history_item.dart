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
  DateTime? get readAt {
    final timestamp = lastReadAt;
    if (timestamp.isBlank) return null;
    final milliseconds = int.tryParse(timestamp);
    if (milliseconds == null || milliseconds <= 0) return null;

    // Try parsing as milliseconds first, then as seconds if the result is too old
    var dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);

    // If the parsed date is before 1990, it's likely in seconds format
    if (dateTime.year < 1990) {
      dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds * 1000);
    }

    // If still before 1990, something is wrong with the data
    if (dateTime.year < 1990) {
      return null;
    }

    return dateTime;
  }

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
      return 'Recently Read';
    }

    return readDate.dateGroupString(context);
  }

  /// Get a simple key for grouping without needing context
  String get readDateGroupKey {
    final readDate = readAt;
    if (readDate == null) {
      return 'Recently Read';
    }

    if (readDate.isToday) return 'Today';
    if (readDate.isYesterday) return 'Yesterday';

    final now = DateTime.now();
    final difference = now.difference(readDate).inDays;

    if (difference < 0) {
      return 'Recently Read';
    } else if (difference < 7) {
      // Use weekday number for grouping, will be localized in UI
      return 'week_${readDate.weekday}';
    } else {
      // Use date string for older items
      return readDate.toDateString;
    }
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
