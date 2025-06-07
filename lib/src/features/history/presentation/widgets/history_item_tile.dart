// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../routes/router_config.dart';
import '../../../../utils/extensions/custom_extensions.dart';
import '../../../../widgets/server_image.dart';
import '../../domain/history_item.dart';

class HistoryItemTile extends StatelessWidget {
  const HistoryItemTile({
    super.key,
    required this.item,
    this.onTap,
    required this.onRemove,
  });

  final HistoryItemDto item;
  final VoidCallback? onTap;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final readDate = item.readAt;
    final timeString = readDate != null ? DateFormat.Hm().format(readDate) : '';

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 2,
      ),
      child: InkWell(
        onTap: onTap ?? () => _navigateToReader(context),
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
                            Icons.bookmark,
                            size: 14,
                            color: context.theme.colorScheme.primary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${item.lastPageRead}/${item.pageCount}',
                            style: context.theme.textTheme.labelSmall?.copyWith(
                              color: context.theme.colorScheme.primary,
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
              PopupMenuButton<String>(
                icon: Icon(
                  Icons.more_vert,
                  color: context.theme.colorScheme.onSurfaceVariant,
                ),
                onSelected: (value) {
                  switch (value) {
                    case 'remove':
                      _showRemoveDialog(context);
                      break;
                    case 'manga':
                      _navigateToManga(context);
                      break;
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'manga',
                    child: Row(
                      children: [
                        const Icon(Icons.book),
                        const SizedBox(width: 8),
                        Text(context.l10n.viewManga),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'remove',
                    child: Row(
                      children: [
                        const Icon(Icons.delete_outline),
                        const SizedBox(width: 8),
                        Text(context.l10n.removeFromHistory),
                      ],
                    ),
                  ),
                ],
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

  void _navigateToReader(BuildContext context) {
    // Navigate to the reader, continuing from where the user left off
    ReaderRoute(
      mangaId: item.mangaId,
      chapterId: item.id,
    ).push(context);
  }

  void _navigateToManga(BuildContext context) {
    // Navigate to the manga details page
    MangaRoute(mangaId: item.mangaId).push(context);
  }
}
