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
import '../../../../utils/extensions/custom_extensions.dart';
import '../widgets/migration_progress_widgets.dart';

class MigrationProgressScreen extends ConsumerWidget {
  const MigrationProgressScreen({
    super.key,
    required this.sourceManga,
    required this.targetManga,
    required this.targetSource,
    required this.options,
  });

  final MangaDto sourceManga;
  final MangaDto targetManga;
  final SourceDto targetSource;
  final MigrationOption options;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final migrationProgress = ref.watch(migrationExecutionProvider);

    return PopScope(
      canPop: migrationProgress?.status == MigrationStatus.completed ||
              migrationProgress?.status == MigrationStatus.error ||
              migrationProgress?.status == MigrationStatus.cancelled,
      onPopInvokedWithResult: (didPop, _) async {
        if (!didPop && migrationProgress != null) {
          await _showCancelConfirmation(context, ref);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.migrationInProgress),
          automaticallyImplyLeading: migrationProgress?.status == MigrationStatus.completed ||
                                     migrationProgress?.status == MigrationStatus.error ||
                                     migrationProgress?.status == MigrationStatus.cancelled,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Migration info card
              MigrationInfoCard(
                sourceManga: sourceManga,
                targetManga: targetManga,
                targetSource: targetSource,
              ),
              
              const SizedBox(height: 24),
              
              // Progress section
              Expanded(
                child: MigrationProgressContent(
                  progress: migrationProgress,
                  sourceManga: sourceManga,
                  targetManga: targetManga,
                  targetSource: targetSource,
                ),
              ),
              
              // Action buttons
              MigrationActionButtons(
                progress: migrationProgress,
                onCancel: () => _showCancelConfirmation(context, ref),
                onComplete: () => _completeMigration(context, ref),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showCancelConfirmation(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.cancelMigration),
        content: Text(
          l10n.cancelMigrationConfirmation,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.no),
          ),
          const SizedBox(width: 8),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text(l10n.yes),
          ),
        ],
      ),
    );
    
    if (confirmed == true) {
      await ref.read(migrationExecutionProvider.notifier).cancelMigration();
    }
  }

  void _completeMigration(BuildContext context, WidgetRef ref) {
    final migrationProgress = ref.read(migrationExecutionProvider);
    
    // Reset migration state
    ref.read(migrationExecutionProvider.notifier).reset();
    ref.read(selectedMigrationSourceProvider.notifier).clear();
    ref.read(selectedTargetMangaProvider.notifier).clear();
    ref.read(migrationOptionsProvider.notifier).reset();
    ref.read(migrationSearchQueryProvider.notifier).clear();
    
    // Navigate based on migration result
    if (migrationProgress?.status == MigrationStatus.completed) {
      // If migration was successful, go back to the library so user can see the migrated manga
      context.go('/library/0');
    } else {
      // If migration failed or was cancelled, go back to source manga
      context.go('/manga/${sourceManga.id}');
    }
  }
} 