// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import '../../../manga_book/domain/manga/graphql/__generated__/fragment.graphql.dart';
import '../../../../widgets/server_image.dart';

class MangaComparisonWidget extends StatelessWidget {
  const MangaComparisonWidget({
    super.key,
    required this.sourceManga,
    required this.targetManga,
  });

  final dynamic sourceManga;
  final dynamic targetManga;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Manga Comparison',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            
            // Mobile layout (vertical comparison)
            if (MediaQuery.of(context).size.width < 600) ...[
              _buildMangaInfo(context, sourceManga, 'From (Current)', Icons.source),
              const SizedBox(height: 16),
              Center(
                child: Icon(
                  Icons.arrow_downward,
                  size: 32,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 16),
              _buildMangaInfo(context, targetManga, 'To (Target)', Icons.adjust),
            ]
            // Tablet/Desktop layout (horizontal comparison)
            else ...[
              Row(
                children: [
                  Expanded(
                    child: _buildMangaInfo(context, sourceManga, 'From (Current)', Icons.source),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 32,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  Expanded(
                    child: _buildMangaInfo(context, targetManga, 'To (Target)', Icons.adjust),
                  ),
                ],
              ),
            ],
            
            const SizedBox(height: 16),
            
            // Comparison summary
            _buildComparisonSummary(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMangaInfo(
    BuildContext context,
    Fragment$MangaDto manga,
    String label,
    IconData icon,
  ) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Row(
            children: [
              Icon(
                icon,
                size: 16,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 4),
              Text(
                label,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          
          // Manga info
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cover
              SizedBox(
                width: 60,
                height: 84,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: ServerImage(
                    imageUrl: manga.thumbnailUrl ?? '',
                  ),
                ),
              ),
              const SizedBox(width: 12),
              
              // Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      manga.title ?? 'Unknown Title',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    // Author
                    if (manga.author?.isNotEmpty == true) ...[
                      const SizedBox(height: 4),
                      Text(
                        'by ${manga.author}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    
                    // Status
                    if (manga.status?.name != null) ...[
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: _getStatusColor(manga.status!.name).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          manga.status!.name.toUpperCase(),
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: _getStatusColor(manga.status!.name),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                    
                    // Source
                    if (manga.source?.displayName?.isNotEmpty == true) ...[
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.source_outlined,
                            size: 12,
                            color: theme.colorScheme.outline,
                          ),
                          const SizedBox(width: 2),
                          Expanded(
                            child: Text(
                              manga.source!.displayName!,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.outline,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildComparisonSummary(BuildContext context) {
    final theme = Theme.of(context);
    
    // Calculate similarity indicators
    final titleMatch = _calculateTitleSimilarity(sourceManga.title, targetManga.title);
    final authorMatch = _calculateAuthorSimilarity(sourceManga.author, targetManga.author);
    
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colorScheme.primary.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.analytics_outlined,
                size: 16,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 4),
              Text(
                'Comparison Summary',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          
          // Match indicators
          Row(
            children: [
              _buildMatchIndicator(context, 'Title', titleMatch),
              const SizedBox(width: 16),
              _buildMatchIndicator(context, 'Author', authorMatch),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMatchIndicator(BuildContext context, String label, double score) {
    final theme = Theme.of(context);
    Color color;
    IconData icon;
    
    if (score >= 0.8) {
      color = Colors.green;
      icon = Icons.check_circle;
    } else if (score >= 0.5) {
      color = Colors.orange;
      icon = Icons.warning;
    } else {
      color = Colors.red;
      icon = Icons.error;
    }
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 16,
          color: color,
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'ongoing':
      case 'publishing':
        return Colors.green;
      case 'completed':
      case 'finished':
        return Colors.blue;
      case 'cancelled':
      case 'dropped':
        return Colors.red;
      case 'hiatus':
      case 'paused':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  double _calculateTitleSimilarity(String? title1, String? title2) {
    if (title1 == null || title2 == null) return 0.0;
    if (title1.isEmpty || title2.isEmpty) return 0.0;
    
    final t1 = title1.toLowerCase().trim();
    final t2 = title2.toLowerCase().trim();
    
    if (t1 == t2) return 1.0;
    
    // Simple similarity calculation (can be improved)
    final longerLength = t1.length > t2.length ? t1.length : t2.length;
    final distance = _levenshteinDistance(t1, t2);
    
    return (longerLength - distance) / longerLength;
  }

  double _calculateAuthorSimilarity(String? author1, String? author2) {
    if (author1 == null || author2 == null) return 0.0;
    if (author1.isEmpty || author2.isEmpty) return 0.0;
    
    final a1 = author1.toLowerCase().trim();
    final a2 = author2.toLowerCase().trim();
    
    if (a1 == a2) return 1.0;
    
    // Simple similarity calculation
    final longerLength = a1.length > a2.length ? a1.length : a2.length;
    final distance = _levenshteinDistance(a1, a2);
    
    return (longerLength - distance) / longerLength;
  }

  int _levenshteinDistance(String s1, String s2) {
    final len1 = s1.length;
    final len2 = s2.length;
    
    if (len1 == 0) return len2;
    if (len2 == 0) return len1;
    
    final matrix = List.generate(len1 + 1, (_) => List.filled(len2 + 1, 0));
    
    for (int i = 0; i <= len1; i++) {
      matrix[i][0] = i;
    }
    
    for (int j = 0; j <= len2; j++) {
      matrix[0][j] = j;
    }
    
    for (int i = 1; i <= len1; i++) {
      for (int j = 1; j <= len2; j++) {
        final cost = s1[i - 1] == s2[j - 1] ? 0 : 1;
        matrix[i][j] = [
          matrix[i - 1][j] + 1,     // deletion
          matrix[i][j - 1] + 1,     // insertion
          matrix[i - 1][j - 1] + cost, // substitution
        ].reduce((a, b) => a < b ? a : b);
      }
    }
    
    return matrix[len1][len2];
  }
} 