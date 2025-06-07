// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

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
    final now = DateTime.now();
    return readDate.year == now.year &&
        readDate.month == now.month &&
        readDate.day == now.day;
  }

  /// Check if this item was read yesterday
  bool get isReadYesterday {
    final readDate = readAt;
    if (readDate == null) return false;
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return readDate.year == yesterday.year &&
        readDate.month == yesterday.month &&
        readDate.day == yesterday.day;
  }

  /// Get a formatted date string for grouping (by day)
  String get readDateGroup {
    final readDate = readAt;
    if (readDate == null) {
      return 'Recently Read';
    }

    if (isReadToday) return 'Today';
    if (isReadYesterday) return 'Yesterday';

    final now = DateTime.now();
    final difference = now.difference(readDate).inDays;

    if (difference < 0) {
      // Future date (shouldn't happen but handle gracefully)
      return 'Recently Read';
    } else if (difference < 7) {
      // Show specific days for the past week
      final weekdays = [
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday'
      ];
      return weekdays[readDate.weekday - 1];
    } else {
      // For older items, show the specific date
      final months = [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December'
      ];
      return '${months[readDate.month - 1]} ${readDate.day}, ${readDate.year}';
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
