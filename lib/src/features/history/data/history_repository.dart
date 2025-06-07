// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../global_providers/global_providers.dart';
import '../../../graphql/__generated__/schema.graphql.dart';
import '../../../utils/extensions/custom_extensions.dart';
import '../../manga_book/data/manga_book/manga_book_repository.dart';
import '../../manga_book/domain/chapter_batch/chapter_batch_model.dart';
import '../../manga_book/domain/chapter_page/chapter_page_model.dart';
import '../domain/history_item.dart';
import 'graphql/__generated__/query.graphql.dart';

part 'history_repository.g.dart';

class HistoryRepository {
  const HistoryRepository(this.client, this.mangaBookRepository);
  final GraphQLClient client;
  final MangaBookRepository mangaBookRepository;

  /// Fetch reading history with pagination and filtering
  Future<ChapterPageWithMangaDto?> getReadingHistory({
    int pageSize = 50,
    int pageNo = 0,
    String? searchQuery,
    DateTime? fromDate,
    DateTime? toDate,
  }) async {
    // Build filter for chapters with actual reading progress
    final filter = Input$ChapterFilterInput(
      // Only get chapters from library manga
      inLibrary: Input$BooleanFilterInput(equalTo: true),
      // Only get chapters that have been read (lastReadAt is not null/empty)
      lastReadAt: Input$LongFilterInput(
        isNull: false,
        greaterThan:
            "0", // Ensure lastReadAt is actually set to a real timestamp
      ),
      // Only show chapters that have actual reading progress:
      // Either fully read OR have made progress beyond the first page
      or: [
        // Fully completed chapters
        Input$ChapterFilterInput(
          isRead: Input$BooleanFilterInput(equalTo: true),
        ),
        // Chapters with meaningful reading progress (at least 1 page read)
        Input$ChapterFilterInput(
          lastPageRead: Input$IntFilterInput(greaterThan: 0),
        ),
      ],
      // Additional filters
      and: [
        // Add date range filtering if provided
        if (fromDate != null)
          Input$ChapterFilterInput(
            lastReadAt: Input$LongFilterInput(
              greaterThanOrEqualTo: fromDate.millisecondsSinceEpoch.toString(),
            ),
          ),
        if (toDate != null)
          Input$ChapterFilterInput(
            lastReadAt: Input$LongFilterInput(
              lessThanOrEqualTo: toDate.millisecondsSinceEpoch.toString(),
            ),
          ),
        // Add search filtering if provided
        if (searchQuery.isNotBlank)
          Input$ChapterFilterInput(
            or: [
              // Search in chapter name
              Input$ChapterFilterInput(
                name: Input$StringFilterInput(
                  includesInsensitive: searchQuery,
                ),
              ),
              // Note: We can't search manga title directly in chapter filter
              // This will be handled in the UI layer
            ],
          ),
      ],
    );

    // Order by lastReadAt descending (most recent first)
    final order = [
      Input$ChapterOrderInput(
        by: Enum$ChapterOrderBy.LAST_READ_AT,
        byType: Enum$SortOrder.DESC,
      ),
      // Secondary sort by source order for consistency
      Input$ChapterOrderInput(
        by: Enum$ChapterOrderBy.SOURCE_ORDER,
        byType: Enum$SortOrder.DESC,
      ),
    ];

    final result = await client
        .query$GetReadingHistory(
          Options$Query$GetReadingHistory(
            variables: Variables$Query$GetReadingHistory(
              first: pageSize * 10, // Get more results to filter duplicates
              offset: pageNo * pageSize,
              filter: filter,
              order: order,
            ),
          ),
        )
        .getData((data) => data.chapters);

    // Filter to only show the most recent chapter per manga
    if (result?.nodes != null) {
      // First, apply client-side filtering to ensure removed chapters are excluded
      final validChapters = result!.nodes.where((chapter) {
        // Only include chapters with actual reading progress:
        // 1. Fully read chapters (isRead: true), OR
        // 2. Chapters with meaningful progress (lastPageRead > 0)
        // This excludes chapters that were removed from history (isRead: false AND lastPageRead: 0)
        final isFullyRead = chapter.isRead;
        final hasProgress = chapter.lastPageRead > 0;

        return isFullyRead || hasProgress;
      }).toList();

      final Map<int, HistoryItemDto> latestChapterPerManga = {};

      for (final chapter in validChapters) {
        final mangaId = chapter.mangaId;

        // Only keep the first (most recent) chapter for each manga
        if (!latestChapterPerManga.containsKey(mangaId)) {
          latestChapterPerManga[mangaId] = chapter;
        }
      }

      // Take only the requested page size from the filtered results
      final filteredChapters = latestChapterPerManga.values.toList()
        ..sort((a, b) {
          final aTime = a.readAt?.millisecondsSinceEpoch ?? 0;
          final bTime = b.readAt?.millisecondsSinceEpoch ?? 0;
          return bTime.compareTo(aTime); // Most recent first
        });

      final startIndex = pageNo * pageSize;
      final endIndex =
          (startIndex + pageSize).clamp(0, filteredChapters.length);
      final pageChapters = startIndex < filteredChapters.length
          ? filteredChapters.sublist(startIndex, endIndex)
          : <HistoryItemDto>[];

      return ChapterPageWithMangaDto(
        nodes: pageChapters,
        pageInfo: result.pageInfo,
        totalCount: latestChapterPerManga.length,
      );
    }

    return result;
  }

  /// Get reading history for a specific manga
  Future<List<HistoryItemDto>?> getMangaReadingHistory({
    required int mangaId,
    int limit = 20,
  }) async {
    final filter = Input$ChapterFilterInput(
      mangaId: Input$IntFilterInput(equalTo: mangaId),
      lastReadAt: Input$LongFilterInput(isNull: false),
    );

    final order = [
      Input$ChapterOrderInput(
        by: Enum$ChapterOrderBy.LAST_READ_AT,
        byType: Enum$SortOrder.DESC,
      ),
    ];

    return client
        .query$GetReadingHistory(
          Options$Query$GetReadingHistory(
            variables: Variables$Query$GetReadingHistory(
              first: limit,
              filter: filter,
              order: order,
            ),
          ),
        )
        .getData((data) => data.chapters.nodes);
  }

  /// Clear reading history for a specific chapter
  Future<void> removeChapterFromHistory(int chapterId) async {
    // Mark the chapter as unread and reset progress
    // This should remove it from history queries since our filter requires:
    // either isRead: true OR lastPageRead > 0
    await mangaBookRepository.putChapter(
      chapterId: chapterId,
      patch: ChapterChange(
        isRead: false, // Set to false (not fully read)
        lastPageRead: 0, // Reset to 0 (no progress)
        // Note: lastReadAt cannot be cleared via this API
        // Some chapters may still appear until server is restarted
      ),
    );
  }

  /// Clear all reading history (mark all chapters as unread)
  /// This is a destructive operation and should be used with caution
  Future<void> clearAllHistory() async {
    // This would require a server-side bulk operation
    // For now, this is a placeholder that would need server support
    throw UnimplementedError(
      'Clearing all history requires server-side support. '
      'Please use individual chapter removal instead.',
    );
  }
}

@riverpod
HistoryRepository historyRepository(Ref ref) => HistoryRepository(
    ref.watch(graphQlClientProvider), ref.watch(mangaBookRepositoryProvider));
