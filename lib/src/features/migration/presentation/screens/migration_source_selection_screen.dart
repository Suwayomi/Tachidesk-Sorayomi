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
import '../../../browse_center/data/source_repository/source_repository.dart';
import '../../../browse_center/domain/source/source_model.dart';
import '../../../manga_book/domain/manga/graphql/__generated__/fragment.graphql.dart';
import '../../../manga_book/domain/manga/manga_model.dart';
import '../../controller/migration_controller.dart';
import '../../domain/migration_models.dart';
import '../widgets/migration_source_card.dart';

class MigrationSourceSelectionScreen extends HookConsumerWidget {
  const MigrationSourceSelectionScreen({
    super.key,
    required this.sourceManga,
  });

  final MangaDto sourceManga;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final sourcesAsync = ref.watch(migrationSourcesProvider(mangaId: sourceManga.id));
    final selectedSource = ref.watch(selectedMigrationSourceProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.selectTargetSource),
      ),
      body: sourcesAsync.when(
        data: (sources) {
          if (sources == null || sources.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.source_outlined,
                    size: 64,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l10n.noSourcesAvailable,
                    style: context.theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.checkSourceConfiguration,
                    style: context.theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }

          // Filter out the current source
          final availableSources = sources
              .where((source) => source.id != sourceManga.source?.id)
              .toList();

          if (availableSources.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.swap_horiz_outlined,
                    size: 64,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l10n.noAlternativeSources,
                    style: context.theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.installMoreSources,
                    style: context.theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: availableSources.length,
            itemBuilder: (context, index) {
              final source = availableSources[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: MigrationSourceCard(
                  source: source,
                  isSelected: selectedSource?.id == source.id,
                  onTap: () => _onSourceSelected(context, ref, source),
                ),
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
              const Icon(
                Icons.error_outline,
                size: 64,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              Text(
                l10n.errorLoadingSources,
                style: context.theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                error.toString(),
                style: context.theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.refresh(migrationSourcesProvider(mangaId: sourceManga.id)),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSourceSelected(
    BuildContext context,
    WidgetRef ref,
    MigrationSource source,
  ) async {
    // Select the source
    ref.read(selectedMigrationSourceProvider.notifier).select(source);
    
    // Fetch the actual SourceDto from the source repository
    try {
      final sourceRepository = ref.read(sourceRepositoryProvider);
      final targetSourceDto = await sourceRepository.getSource(source.id);
      
      if (targetSourceDto != null) {
        // Navigate to manga search screen with proper data class
        context.push(
          '/migration/search',
          extra: MigrationSearchRouteData(
            sourceManga: sourceManga,
            targetSource: targetSourceDto,
          ),
        );
      } else {
        // Fallback: Show error message
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: Could not load source details'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      // Fallback: Show error message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error loading source: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
} 