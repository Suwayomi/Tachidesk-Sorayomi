// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../browse_center/domain/source/source_model.dart';
import '../../../manga_book/domain/manga/graphql/__generated__/fragment.graphql.dart';
import '../../controller/migration_controller.dart';
import '../../domain/migration_models.dart';
import '../widgets/manga_comparison_widget.dart';
import '../widgets/migration_options_widget.dart';
import '../../../../utils/extensions/custom_extensions.dart';

class MigrationPreviewScreen extends ConsumerWidget {
  const MigrationPreviewScreen({
    super.key,
    required this.sourceManga,
    required this.targetManga,
    required this.targetSource,
  });

  final dynamic sourceManga;
  final dynamic targetManga;
  final SourceDto targetSource;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final migrationOptions = ref.watch(migrationOptionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n?.migrationPreview ?? 'Migration Preview'),
      ),
      body: Column(
        children: [
          // Manga comparison
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Manga comparison widget
                  MangaComparisonWidget(
                    sourceManga: sourceManga,
                    targetManga: targetManga,
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Migration options
                  Text(
                    l10n?.migrationOptions ?? 'Migration Options',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  MigrationOptionsWidget(
                    options: migrationOptions,
                    onChanged: (newOptions) {
                      ref.read(migrationOptionsProvider.notifier).update(newOptions);
                    },
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Warning card
                  Card(
                    color: Theme.of(context).colorScheme.errorContainer,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.warning_amber_rounded,
                                color: Theme.of(context).colorScheme.onErrorContainer,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                l10n?.importantNotice ?? 'Important Notice',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.onErrorContainer,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            l10n?.migrationWarning ?? 
                            'Migration will replace the current manga with the selected one. This action cannot be undone. Make sure you have selected the correct target manga.',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onErrorContainer,
                            ),
                          ),
                          if (migrationOptions.deleteSource) ...[
                            const SizedBox(height: 8),
                            Text(
                              l10n?.deleteSourceWarning ?? 
                              'The original manga will be removed from your library after migration.',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onErrorContainer,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          
          // Action buttons
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                ),
              ),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => context.pop(),
                      child: Text(l10n?.cancel ?? 'Cancel'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: FilledButton(
                      onPressed: () => _showMigrationConfirmation(context, ref),
                      child: Text(l10n?.startMigration ?? 'Start Migration'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showMigrationConfirmation(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n?.confirmMigration ?? 'Confirm Migration'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n?.migrationConfirmationMessage ?? 
              'Are you sure you want to migrate this manga? This action cannot be undone.',
            ),
            const SizedBox(height: 16),
            Text(
              '${l10n?.from ?? 'From'}: ${sourceManga.title}',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 4),
            Text(
              '${l10n?.to ?? 'To'}: ${targetManga.title}',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n?.cancel ?? 'Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
              _startMigration(context, ref);
            },
            child: Text(l10n?.migrate ?? 'Migrate'),
          ),
        ],
      ),
    );
  }

  void _startMigration(BuildContext context, WidgetRef ref) {
    final migrationOptions = ref.read(migrationOptionsProvider);
    
    // Navigate to migration progress screen
    context.pushReplacement(
      '/migration/progress',
      extra: {
        'sourceManga': sourceManga,
        'targetManga': targetManga,
        'targetSource': targetSource,
        'options': migrationOptions,
      },
    );
    
    // Add a small delay to ensure navigation completes, then start the migration process
    Future.delayed(const Duration(milliseconds: 100), () {
      ref.read(migrationExecutionProvider.notifier).executeMigration(
        fromMangaId: sourceManga.id,
        toMangaId: targetManga.id,
        options: migrationOptions,
      );
    });
  }
} 