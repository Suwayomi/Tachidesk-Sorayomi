// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../utils/extensions/custom_extensions.dart';
import '../../../../widgets/server_image.dart';
import '../../../browse_center/domain/source/source_model.dart';
import '../../../manga_book/domain/manga/graphql/__generated__/fragment.graphql.dart';
import '../../../manga_book/domain/manga/manga_model.dart';
import '../../controller/migration_controller.dart';
import '../../domain/migration_models.dart';

class MigrationSearchScreen extends HookConsumerWidget {
  const MigrationSearchScreen({
    super.key,
    required this.sourceManga,
    required this.targetSource,
  });

  final MangaDto sourceManga;
  final SourceDto targetSource;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final searchController = useTextEditingController();
    final searchQuery = ref.watch(migrationSearchQueryProvider);
    
    // Auto-search with source manga title on screen load
    useEffect(() {
      final initialQuery = sourceManga.title ?? '';
      if (initialQuery.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          searchController.text = initialQuery;
          ref.read(migrationSearchQueryProvider.notifier).update(initialQuery);
          ref.read(migrationSearchProvider(
            sourceId: targetSource.id,
            query: initialQuery,
          ).future);
        });
      }
      return null;
    }, []);

    final searchResultsAsync = ref.watch(migrationSearchProvider(
      sourceId: targetSource.id,
      query: searchQuery,
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text('Search in ${targetSource.displayName ?? targetSource.name}'),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: SearchBar(
              controller: searchController,
              hintText: l10n.searchManga,
              leading: const Icon(Icons.search),
              trailing: [
                if (searchQuery.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      searchController.clear();
                      ref.read(migrationSearchQueryProvider.notifier).clear();
                    },
                  ),
              ],
              onChanged: (query) {
                ref.read(migrationSearchQueryProvider.notifier).update(query);
              },
              onSubmitted: (query) {
                if (query.trim().isNotEmpty) {
                  ref.read(migrationSearchProvider(
                    sourceId: targetSource.id,
                    query: query.trim(),
                  ).future);
                }
              },
            ),
          ),
          
          // Source info banner
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: context.theme.colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 16,
                  color: context.theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Searching in ${targetSource.displayName ?? targetSource.name} (${targetSource.lang.toUpperCase()})',
                    style: context.theme.textTheme.bodySmall?.copyWith(
                      color: context.theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Search results
          Expanded(
            child: searchResultsAsync.when(
              data: (results) {
                if (searchQuery.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          size: 64,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          l10n.searchForManga,
                          style: context.theme.textTheme.titleMedium?.copyWith(
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l10n.enterSearchTerm,
                          style: context.theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                if (results == null || results.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          l10n.noResultsFound,
                          style: context.theme.textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l10n.tryDifferentSearch,
                          style: context.theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final manga = results[index];
                    return _MangaSearchResultCard(
                      manga: manga,
                      onTap: () => _onMangaSelected(context, ref, manga),
                    );
                  },
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stackTrace) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red.shade400,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.searchError,
                      style: context.theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      error.toString(),
                      style: context.theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (searchQuery.isNotEmpty) {
                          ref.read(migrationSearchProvider(
                            sourceId: targetSource.id,
                            query: searchQuery,
                          ).future);
                        }
                      },
                      child: Text(l10n.retry),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onMangaSelected(
    BuildContext context,
    WidgetRef ref,
    Fragment$MangaDto targetManga,
  ) {
    // Select the target manga
    ref.read(selectedTargetMangaProvider.notifier).select(targetManga);
    
    // Navigate to migration preview screen with proper data class
    context.push(
      '/migration/preview',
      extra: MigrationPreviewRouteData(
        sourceManga: sourceManga,
        targetManga: targetManga,
        targetSource: targetSource,
      ),
    );
  }
}

class _MangaSearchResultCard extends StatelessWidget {
  const _MangaSearchResultCard({
    required this.manga,
    required this.onTap,
  });

  final Fragment$MangaDto manga;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Manga cover
            Expanded(
              flex: 3,
              child: ServerImage(
                imageUrl: manga.thumbnailUrl ?? '',
              ),
            ),
            
            // Manga info
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      manga.title ?? 'Unknown Title',
                      style: context.theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (manga.author?.isNotEmpty == true) ...[
                      const SizedBox(height: 2),
                      Text(
                        manga.author!,
                        style: context.theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 