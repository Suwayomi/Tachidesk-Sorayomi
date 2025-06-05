// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import '../../domain/migration_models.dart';

class MigrationSourceCard extends StatelessWidget {
  const MigrationSourceCard({
    super.key,
    required this.source,
    required this.onTap,
    this.isSelected = false,
  });

  final MigrationSource source;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      elevation: isSelected ? 4 : 1,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: isSelected
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: theme.colorScheme.primary,
                    width: 2,
                  ),
                )
              : null,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Source icon
                CircleAvatar(
                  backgroundColor: theme.colorScheme.primaryContainer,
                  child: Icon(
                    Icons.source_outlined,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(width: 16),
                
                // Source information
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Source name
                      Text(
                        source.displayName ?? source.name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      
                      // Language and manga count
                      Row(
                        children: [
                          // Language tag
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surfaceVariant,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              source.lang.toUpperCase(),
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          
                          // Manga count
                          if (source.mangaCount > 0) ...[
                            Icon(
                              Icons.library_books_outlined,
                              size: 16,
                              color: theme.colorScheme.outline,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${source.mangaCount} manga',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.outline,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
                
                // Status indicator and selection icon
                Column(
                  children: [
                    // Configuration status
                    if (source.isConfigured)
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 20,
                      )
                    else
                      Icon(
                        Icons.settings_outlined,
                        color: theme.colorScheme.outline,
                        size: 20,
                      ),
                    
                    const SizedBox(height: 8),
                    
                    // Selection indicator
                    if (isSelected)
                      Icon(
                        Icons.radio_button_checked,
                        color: theme.colorScheme.primary,
                      )
                    else
                      Icon(
                        Icons.radio_button_unchecked,
                        color: theme.colorScheme.outline,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 