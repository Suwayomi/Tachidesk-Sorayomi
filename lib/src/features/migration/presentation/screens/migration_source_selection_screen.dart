// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../manga_book/domain/manga/graphql/__generated__/fragment.graphql.dart';
import '../../controller/migration_controller.dart';
import '../../domain/migration_models.dart';
import '../widgets/migration_source_card.dart';
import '../../../../utils/extensions/custom_extensions.dart';

class MigrationSourceSelectionScreen extends HookConsumerWidget {
  const MigrationSourceSelectionScreen({
    super.key,
    required this.sourceManga,
  });

  final dynamic sourceManga;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final sourcesAsync = ref.watch(migrationSourcesProvider(mangaId: sourceManga.id));
    final selectedSource = ref.watch(selectedMigrationSourceProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n?.selectTargetSource ?? 'Select Target Source'),
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
                    l10n?.noSourcesAvailable ?? 'No sources available for migration',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n?.checkSourceConfiguration ?? 'Please check your source configuration',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                    l10n?.noAlternativeSources ?? 'No alternative sources available',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n?.installMoreSources ?? 'Install more sources to enable migration',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                l10n?.errorLoadingSources ?? 'Error loading sources',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                error.toString(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.refresh(migrationSourcesProvider(mangaId: sourceManga.id)),
                child: Text(l10n?.retry ?? 'Retry'),
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
  ) {
    // Select the source
    ref.read(selectedMigrationSourceProvider.notifier).select(source);
    
    // Navigate to manga search screen
    context.push(
      '/migration/search',
      extra: {
        'sourceManga': sourceManga,
        'targetSource': source,
      },
    );
  }
} 