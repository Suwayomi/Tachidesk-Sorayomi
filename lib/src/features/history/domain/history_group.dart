// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/extensions/custom_extensions.dart';
import '../../manga_book/domain/chapter/graphql/__generated__/fragment.graphql.dart';
import 'history_item.dart';

part 'history_group.freezed.dart';

@freezed
class HistoryGroup with _$HistoryGroup {
  const factory HistoryGroup({
    required String title,
    required List<HistoryItemDto> items,
  }) = _HistoryGroup;

  const HistoryGroup._();

  /// Get the total number of items in this group
  int get itemCount => items.length;

  /// Check if this group is empty
  bool get isEmpty => items.isEmpty;

  /// Check if this group is not empty
  bool get isNotEmpty => items.isNotEmpty;

  /// Get the most recent read date in this group
  DateTime? get mostRecentReadDate {
    if (items.isEmpty) return null;

    DateTime? mostRecent;
    for (final item in items) {
      final readDate = item.readAt;
      if (readDate != null) {
        if (mostRecent == null || readDate.isAfter(mostRecent)) {
          mostRecent = readDate;
        }
      }
    }
    return mostRecent;
  }

  /// Get the localized title for this group
  String getLocalizedTitle(BuildContext context) {
    // Handle special keys
    switch (title) {
      case 'Today':
        return context.l10n.today;
      case 'Yesterday':
        return context.l10n.yesterday;
      case 'Recently Read':
        return 'Recently Read'; // This might need localization if available
    }

    // Handle weekday keys
    if (title.startsWith('week_')) {
      final weekdayNumber = int.tryParse(title.split('_')[1]);
      if (weekdayNumber != null && weekdayNumber >= 1 && weekdayNumber <= 7) {
        // Create a date for the specific weekday and format it
        final now = DateTime.now();
        final daysToSubtract = (now.weekday - weekdayNumber) % 7;
        final targetDate = now.subtract(Duration(days: daysToSubtract));
        return targetDate.toDayString;
      }
    }

    // Return the title as-is for date strings and unknown formats
    return title;
  }

  /// Filter items in this group by search query
  HistoryGroup filterByQuery(String? query) {
    if (query == null || query.trim().isEmpty) return this;

    final filteredItems = items.where((HistoryItemDto item) {
      if (query.trim().isEmpty) return true;
      final searchQuery = query.toLowerCase();

      return item.manga.title.toLowerCase().contains(searchQuery) ||
          item.name.toLowerCase().contains(searchQuery) ||
          (item.manga.author?.toLowerCase().contains(searchQuery) ?? false) ||
          (item.scanlator?.toLowerCase().contains(searchQuery) ?? false);
    }).toList();
    return copyWith(items: filteredItems);
  }
}
