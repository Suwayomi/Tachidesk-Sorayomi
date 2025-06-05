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
import '../../../manga_book/domain/manga/manga_model.dart';
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

  final MangaDto sourceManga;
  final MangaDto targetManga;
  final SourceDto targetSource;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final migrationOptions = ref.watch(migrationOptionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.migrationPreview),
        elevation: 0,
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
                    l10n.migrationOptions,
                    style: context.theme.textTheme.titleMedium?.copyWith(
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
                    color: context.theme.colorScheme.errorContainer,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.warning_amber_rounded,
                                color: context.theme.colorScheme.error,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                l10n.importantNotice,
                                style: context.theme.textTheme.titleSmall?.copyWith(
                                  color: context.theme.colorScheme.error,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            l10n.migrationWarning,
                            style: context.theme.textTheme.bodyMedium?.copyWith(
                              color: context.theme.colorScheme.onErrorContainer,
                            ),
                          ),
                          if (migrationOptions.deleteSource) ...[
                            const SizedBox(height: 8),
                            Text(
                              l10n.deleteSourceWarning,
                              style: context.theme.textTheme.bodyMedium?.copyWith(
                                color: context.theme.colorScheme.error,
                                fontWeight: FontWeight.w600,
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
              color: context.theme.colorScheme.surface,
              border: Border(
                top: BorderSide(
                  color: context.theme.colorScheme.outline.withOpacity(0.2),
                ),
              ),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => context.pop(),
                      child: Text(l10n.cancel),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton(
                      onPressed: () => _showMigrationConfirmation(context, ref),
                      child: Text(l10n.startMigration),
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
        title: Text(l10n.confirmMigration),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.migrationConfirmationMessage,
              style: context.theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Text(
              '${l10n.from}: ${sourceManga.title}',
              style: context.theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text(
              '${l10n.to}: ${targetManga.title}',
              style: context.theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.cancel),
          ),
          const SizedBox(width: 8),
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
              _startMigration(context, ref);
            },
            child: Text(l10n.migrate),
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
      extra: MigrationProgressRouteData(
        sourceManga: sourceManga,
        targetManga: targetManga,
        targetSource: targetSource,
        options: migrationOptions,
      ),
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