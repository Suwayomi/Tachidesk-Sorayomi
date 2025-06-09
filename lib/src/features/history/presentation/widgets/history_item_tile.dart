// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../routes/router_config.dart';
import '../../../../utils/extensions/custom_extensions.dart';
import '../../../../widgets/server_image.dart';
import '../../../manga_book/presentation/manga_details/controller/manga_details_controller.dart';
import '../../domain/history_item.dart';
import '../../domain/history_menu_action.dart';

class HistoryItemTile extends ConsumerWidget {
  const HistoryItemTile({
    super.key,
    required this.item,
    this.onTap,
    required this.onRemove,
  });

  final HistoryItemDto item;
  final VoidCallback? onTap;
  final VoidCallback onRemove;

  bool _isChapterCompleted() {
    final isFullyRead = item.isRead == true;
    final hasFinishedChapter =
        item.pageCount > 0 && item.lastPageRead >= (item.pageCount - 1);
    return isFullyRead || hasFinishedChapter;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readDate = item.readAt;
    final timeString = readDate != null ? DateFormat.Hm().format(readDate) : '';

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 2,
      ),
      child: InkWell(
        onTap: onTap ?? () => _navigateToReader(context, ref),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Manga cover
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ServerImage(
                  imageUrl: item.manga.thumbnailUrl ?? "",
                  size: const Size(56, 80),
                ),
              ),
              const SizedBox(width: 12),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Manga title
                    Text(
                      item.manga.title,
                      style: context.theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    // Chapter name
                    Text(
                      item.name,
                      style: context.theme.textTheme.bodyMedium?.copyWith(
                        color: context.theme.colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    // Reading info
                    Row(
                      children: [
                        // Read time
                        if (timeString.isNotEmpty) ...[
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: context.theme.colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            timeString,
                            style: context.theme.textTheme.labelSmall?.copyWith(
                              color: context.theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                        // Progress indicator
                        if (item.lastPageRead > 0 && item.pageCount > 0) ...[
                          const SizedBox(width: 8),
                          Icon(
                            _isChapterCompleted()
                                ? Icons.check_circle
                                : Icons.bookmark,
                            size: 14,
                            color: _isChapterCompleted()
                                ? context.theme.colorScheme.secondary
                                : context.theme.colorScheme.primary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _isChapterCompleted()
                                ? 'Completed'
                                : '${item.lastPageRead}/${item.pageCount}',
                            style: context.theme.textTheme.labelSmall?.copyWith(
                              color: _isChapterCompleted()
                                  ? context.theme.colorScheme.secondary
                                  : context.theme.colorScheme.primary,
                            ),
                          ),
                        ],
                        // Scanlator
                        if (item.scanlator.isNotBlank) ...[
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              item.scanlator!,
                              style:
                                  context.theme.textTheme.labelSmall?.copyWith(
                                color:
                                    context.theme.colorScheme.onSurfaceVariant,
                                fontStyle: FontStyle.italic,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              // Actions
              PopupMenuButton<HistoryMenuAction>(
                icon: Icon(
                  Icons.more_vert,
                  color: context.theme.colorScheme.onSurfaceVariant,
                ),
                onSelected: (action) {
                  switch (action) {
                    case HistoryMenuAction.removeFromHistory:
                      _showRemoveDialog(context);
                      break;
                    case HistoryMenuAction.viewManga:
                      _navigateToManga(context);
                      break;
                  }
                },
                itemBuilder: (context) => HistoryMenuAction.values
                    .map(
                      (action) => PopupMenuItem(
                        value: action,
                        child: Row(
                          children: [
                            Icon(action.icon),
                            const SizedBox(width: 8),
                            Text(action.toLocale(context)),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showRemoveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.removeFromHistory),
        content: Text(context.l10n.removeFromHistoryConfirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(context.l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onRemove();
            },
            child: Text(context.l10n.remove),
          ),
        ],
      ),
    );
  }

  /// Ensures all preference providers required for chapter filtering/sorting are initialized
  void _ensurePreferenceProvidersInitialized(WidgetRef ref) {
    ref.read(mangaChapterSortProvider);
    ref.read(mangaChapterSortDirectionProvider);
    ref.read(mangaChapterFilterUnreadProvider);
    ref.read(mangaChapterFilterDownloadedProvider);
    ref.read(mangaChapterFilterBookmarkedProvider);
    ref.read(mangaChapterFilterScanlatorProvider(mangaId: item.mangaId));
  }

  void _navigateToReader(BuildContext context, WidgetRef ref) {
    // Check if chapter is fully read. If so, attempt to navigate to the next one.
    if (_isChapterCompleted()) {
      // Go straight to the loading logic.
      _navigateToNextChapterAfterLoading(context, ref);
    } else {
      // Chapter not fully read, continue from where the user left off.
      ReaderRoute(
        mangaId: item.mangaId,
        chapterId: item.id,
      ).push(context);
    }
  }

  Future<void> _navigateToNextChapterAfterLoading(
      BuildContext context, WidgetRef ref) async {
    // Use a completer to await the result from the listener.
    final completer = Completer<void>();
    ProviderSubscription? subscription;

    // This function will handle the actual navigation and cleanup.
    void navigateAndCleanup(int chapterId) {
      if (completer.isCompleted) return;

      // Ensure the widget is still mounted before navigating.
      if (context.mounted) {
        ReaderRoute(
          mangaId: item.mangaId,
          chapterId: chapterId,
        ).push(context);
      }
      // Cleanup: cancel subscription, complete future.
      subscription?.close();
      completer.complete();
    }

    // Manually set up the listener.
    subscription = ref.listenManual(
      mangaChapterListWithFilterProvider(mangaId: item.mangaId),
      (previous, next) {
        // We only care when the state becomes data.
        if (next is AsyncData<List<dynamic>?>) {
          // Now that the filtered list is ready, get the next chapter.
          final nextPrevChapterPair = ref.read(
            getNextAndPreviousChaptersProvider(
              mangaId: item.mangaId,
              chapterId: item.id,
            ),
          );
          // If a next chapter exists, use it. Otherwise, fall back to the current chapter.
          navigateAndCleanup(nextPrevChapterPair?.first?.id ?? item.id);
        } else if (next is AsyncError) {
          // On error, fall back to the current chapter.
          navigateAndCleanup(item.id);
        }
      },
    );

    // Trigger the process:
    // 1. Initialize preferences.
    _ensurePreferenceProvidersInitialized(ref);
    // 2. Refresh the base list, which will eventually trigger our listener.
    await ref
        .read(mangaChapterListProvider(mangaId: item.mangaId).notifier)
        .refresh();

    // Set a timeout to prevent getting stuck indefinitely.
    Future.any([
      completer.future,
      Future.delayed(const Duration(seconds: 10)).then((_) {
        // If timeout occurs, fall back to the current chapter.
        if (!completer.isCompleted) {
          navigateAndCleanup(item.id);
        }
      })
    ]);
  }

  void _navigateToManga(BuildContext context) {
    // Navigate to the manga details page
    MangaRoute(mangaId: item.mangaId).push(context);
  }
}
