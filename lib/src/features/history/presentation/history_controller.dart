// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/db_keys.dart';
import '../../../utils/extensions/custom_extensions.dart';
import '../../../utils/mixin/shared_preferences_client_mixin.dart';
import '../../manga_book/presentation/manga_details/controller/manga_details_controller.dart';
import '../data/history_repository.dart';
import '../domain/history_group.dart';
import '../domain/history_item.dart';

part 'history_controller.g.dart';

@riverpod
class ReadingHistory extends _$ReadingHistory {
  @override
  Future<List<HistoryItemDto>?> build() async {
    final result =
        await ref.watch(historyRepositoryProvider).getReadingHistory();
    ref.keepAlive();
    return result?.nodes;
  }

  Future<void> refresh() async {
    state = const AsyncLoading();

    final result = await AsyncValue.guard(
      () => ref.read(historyRepositoryProvider).getReadingHistory(),
    );

    ref.keepAlive();
    state = result.hasValue
        ? AsyncData(result.value?.nodes)
        : AsyncValue.error(result.error!, result.stackTrace!);
  }

  Future<void> loadMore() async {
    final currentItems = state.valueOrNull ?? [];
    final pageNo = (currentItems.length / 50).floor() + 1;

    final result = await AsyncValue.guard(
      () =>
          ref.read(historyRepositoryProvider).getReadingHistory(pageNo: pageNo),
    );

    if (result.hasValue && result.value?.nodes != null) {
      final newItems = result.value?.nodes ?? [];
      final updatedItems = [...currentItems, ...newItems];
      state = AsyncData(updatedItems);
    } else if (result.hasError) {
      state = AsyncValue.error(result.error!, result.stackTrace!);
    }
  }

  /// Remove a chapter from reading history
  Future<void> removeFromHistory(int chapterId) async {
    state = await AsyncValue.guard(() async {
      // First get the chapter to extract mangaId for cache invalidation
      final currentItems = state.valueOrNull ?? [];
      HistoryItemDto? chapterToRemove;

      try {
        chapterToRemove =
            currentItems.firstWhere((item) => item.id == chapterId);
      } catch (e) {
        // Chapter not found in current list, continue anyway
      }

      // Remove the chapter from history on the server
      await ref
          .read(historyRepositoryProvider)
          .removeChapterFromHistory(chapterId);

      // Invalidate all related caches to ensure fresh data
      if (chapterToRemove != null) {
        final mangaId = chapterToRemove.mangaId;
        // Invalidate the specific manga's chapter list so it shows as unread immediately
        ref.invalidate(mangaChapterListProvider(mangaId: mangaId));
        ref.invalidate(mangaWithIdProvider(mangaId: mangaId));
      }

      // Also invalidate the history provider itself to force a fresh query
      ref.invalidateSelf();

      // Refresh the history data from server to get updated state
      final result =
          await ref.read(historyRepositoryProvider).getReadingHistory();
      return result?.nodes;
    });
  }
}

@riverpod
class MangaReadingHistory extends _$MangaReadingHistory {
  @override
  Future<List<HistoryItemDto>?> build({required int mangaId}) async {
    return ref
        .watch(historyRepositoryProvider)
        .getMangaReadingHistory(mangaId: mangaId);
  }

  Future<void> refresh() async {
    final result = await AsyncValue.guard(
      () => ref
          .read(historyRepositoryProvider)
          .getMangaReadingHistory(mangaId: mangaId),
    );

    state = result;
  }
}

@riverpod
List<HistoryGroup> historyGroupedByDate(Ref ref) {
  final historyItems = ref.watch(readingHistoryProvider).valueOrNull ?? [];

  if (historyItems.isEmpty) return [];

  // Group items by their read date using a simple key
  final Map<String, List<HistoryItemDto>> groupedItems = {};

  for (final item in historyItems) {
    final groupKey = item.readDateGroupKey;
    groupedItems.putIfAbsent(groupKey, () => []).add(item);
  }

  // Convert to HistoryGroup objects and sort by most recent
  final groups = groupedItems.entries.map((entry) {
    return HistoryGroup(
      title: entry.key,
      items: entry.value,
    );
  }).toList();

  // Sort groups by most recent read date
  groups.sort((a, b) {
    final aDate = a.mostRecentReadDate;
    final bDate = b.mostRecentReadDate;

    if (aDate == null && bDate == null) return 0;
    if (aDate == null) return 1;
    if (bDate == null) return -1;

    return bDate.compareTo(aDate); // Most recent first
  });

  return groups;
}

@riverpod
List<HistoryGroup> filteredHistoryGroups(Ref ref) {
  final groups = ref.watch(historyGroupedByDateProvider);
  final searchQuery = ref.watch(historySearchQueryProvider);

  if (searchQuery.isBlank) return groups;

  // Filter each group and remove empty groups
  final filteredGroups = groups
      .map((group) => group.filterByQuery(searchQuery))
      .where((group) => group.isNotEmpty)
      .toList();

  return filteredGroups;
}

@riverpod
class HistorySearchQuery extends _$HistorySearchQuery {
  @override
  String build() => '';

  void updateQuery(String query) {
    state = query;
  }

  void clearQuery() {
    state = '';
  }
}

// History settings providers
@riverpod
class HistoryRetentionDays extends _$HistoryRetentionDays
    with SharedPreferenceClientMixin<int> {
  @override
  int? build() => initialize(DBKeys.historyRetentionDays);

  void updateRetentionDays(int days) {
    update(days);
  }
}

@riverpod
class HistoryEnabled extends _$HistoryEnabled
    with SharedPreferenceClientMixin<bool> {
  @override
  bool? build() => initialize(DBKeys.historyEnabled);

  void toggleHistory() {
    update(!(state ?? true));
  }
}
