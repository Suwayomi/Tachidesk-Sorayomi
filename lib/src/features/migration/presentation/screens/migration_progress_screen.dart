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
import '../../../../utils/extensions/custom_extensions.dart';

class MigrationProgressScreen extends ConsumerWidget {
  const MigrationProgressScreen({
    super.key,
    required this.sourceManga,
    required this.targetManga,
    required this.targetSource,
    required this.options,
  });

  final dynamic sourceManga;
  final dynamic targetManga;
  final SourceDto targetSource;
  final dynamic options;

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
          title: Text(l10n?.migrationInProgress ?? 'Migration in Progress'),
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
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n?.migrationDetails ?? 'Migration Details',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('${l10n?.from ?? 'From'}: ${sourceManga.title}'),
                      Text('${l10n?.to ?? 'To'}: ${targetManga.title}'),
                      Text('${l10n?.source ?? 'Source'}: ${targetSource.displayName ?? targetSource.name}'),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Progress section
              Expanded(
                child: _buildProgressContent(context, migrationProgress),
              ),
              
              // Action buttons
              _buildActionButtons(context, ref, migrationProgress),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressContent(BuildContext context, MigrationProgress? progress) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    if (progress == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(
              l10n?.preparingMigration ?? 'Preparing migration...',
              style: theme.textTheme.titleMedium,
            ),
          ],
        ),
      );
    }

    switch (progress.status) {
      case MigrationStatus.preparing:
      case MigrationStatus.migrating:
        return _buildActiveProgress(context, progress);
        
      case MigrationStatus.completed:
        return _buildCompletedState(context);
        
      case MigrationStatus.error:
        return _buildErrorState(context, progress);
        
      case MigrationStatus.cancelled:
        return _buildCancelledState(context);
        
      default:
        return _buildActiveProgress(context, progress);
    }
  }

  Widget _buildActiveProgress(BuildContext context, MigrationProgress progress) {
    final theme = Theme.of(context);
    
    return Column(
      children: [
        // Progress indicator
        SizedBox(
          width: 200,
          height: 200,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: CircularProgressIndicator(
                  value: progress.percentage / 100,
                  strokeWidth: 8,
                  backgroundColor: theme.colorScheme.surfaceVariant,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${progress.percentage.toInt()}%',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  if (progress.totalItems > 0) ...[
                    const SizedBox(height: 4),
                    Text(
                      '${progress.processedItems}/${progress.totalItems}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 32),
        
        // Current step
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  _getStepIcon(progress.status),
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    progress.currentStep,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        
        const Spacer(),
      ],
    );
  }

  Widget _buildCompletedState(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check_circle,
            size: 80,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          l10n?.migrationCompleted ?? 'Migration Completed!',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          l10n?.migrationSuccessMessage ?? 
          'Your manga has been successfully migrated to the new source.',
          style: theme.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildErrorState(BuildContext context, MigrationProgress progress) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.error,
            size: 80,
            color: Colors.red,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          l10n?.migrationFailed ?? 'Migration Failed',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        const SizedBox(height: 8),
        if (progress.errorMessage?.isNotEmpty == true) ...[
          Card(
            color: theme.colorScheme.errorContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                progress.errorMessage!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onErrorContainer,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildCancelledState(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.cancel,
            size: 80,
            color: Colors.orange,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          l10n?.migrationCancelled ?? 'Migration Cancelled',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          l10n?.migrationCancelledMessage ?? 
          'The migration process has been cancelled. No changes were made.',
          style: theme.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    WidgetRef ref,
    MigrationProgress? progress,
  ) {
    final l10n = context.l10n;
    
    if (progress == null ||
        progress.status == MigrationStatus.preparing ||
        progress.status == MigrationStatus.migrating) {
      // Cancel button during active migration
      return SafeArea(
        child: OutlinedButton(
          onPressed: () => _showCancelConfirmation(context, ref),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.red,
            side: const BorderSide(color: Colors.red),
          ),
          child: Text(l10n?.cancelMigration ?? 'Cancel Migration'),
        ),
      );
    }
    
    // Done button after completion/error/cancellation
    return SafeArea(
      child: FilledButton(
        onPressed: () => _completeMigration(context, ref),
        child: Text(l10n?.done ?? 'Done'),
      ),
    );
  }

  IconData _getStepIcon(MigrationStatus status) {
    switch (status) {
      case MigrationStatus.preparing:
        return Icons.settings;
      case MigrationStatus.migrating:
        return Icons.sync;
      case MigrationStatus.completed:
        return Icons.check_circle;
      case MigrationStatus.error:
        return Icons.error;
      case MigrationStatus.cancelled:
        return Icons.cancel;
      default:
        return Icons.info;
    }
  }

  Future<void> _showCancelConfirmation(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n?.cancelMigration ?? 'Cancel Migration'),
        content: Text(
          l10n?.cancelMigrationConfirmation ?? 
          'Are you sure you want to cancel the migration? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n?.no ?? 'No'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text(l10n?.yes ?? 'Yes'),
          ),
        ],
      ),
    );
    
    if (confirmed == true) {
      await ref.read(migrationExecutionProvider.notifier).cancelMigration();
    }
  }

  void _completeMigration(BuildContext context, WidgetRef ref) {
    // Reset migration state
    ref.read(migrationExecutionProvider.notifier).reset();
    ref.read(selectedMigrationSourceProvider.notifier).clear();
    ref.read(selectedTargetMangaProvider.notifier).clear();
    ref.read(migrationOptionsProvider.notifier).reset();
    ref.read(migrationSearchQueryProvider.notifier).clear();
    
    // Navigate back to manga details
    context.go('/manga/${sourceManga.id}');
  }
} 