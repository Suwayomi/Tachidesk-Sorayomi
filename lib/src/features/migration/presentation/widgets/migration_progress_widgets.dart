// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import '../../../browse_center/domain/source/source_model.dart';
import '../../../manga_book/domain/manga/manga_model.dart';
import '../../domain/migration_models.dart';
import '../../../../utils/extensions/custom_extensions.dart';

/// Widget displaying migration information card
class MigrationInfoCard extends StatelessWidget {
  const MigrationInfoCard({
    super.key,
    required this.sourceManga,
    required this.targetManga,
    required this.targetSource,
  });

  final MangaDto sourceManga;
  final MangaDto targetManga;
  final SourceDto targetSource;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.migrationDetails,
              style: context.theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text('${l10n.from}: ${sourceManga.title}'),
            Text('${l10n.to}: ${targetManga.title}'),
            Text('${l10n.source}: ${targetSource.displayName ?? targetSource.name}'),
          ],
        ),
      ),
    );
  }
}

/// Widget managing different migration progress states
class MigrationProgressContent extends StatelessWidget {
  const MigrationProgressContent({
    super.key,
    required this.progress,
    required this.sourceManga,
    required this.targetManga,
    required this.targetSource,
  });

  final MigrationProgress? progress;
  final MangaDto sourceManga;
  final MangaDto targetManga;
  final SourceDto targetSource;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = context.theme;

    if (progress == null) {
      return MigrationPreparingWidget();
    }

    switch (progress!.status) {
      case MigrationStatus.preparing:
      case MigrationStatus.migrating:
        return MigrationActiveProgressWidget(progress: progress!);
        
      case MigrationStatus.completed:
        return MigrationCompletedWidget(
          sourceManga: sourceManga,
          targetManga: targetManga,
          targetSource: targetSource,
        );
        
      case MigrationStatus.error:
        return MigrationErrorWidget(progress: progress!);
        
      case MigrationStatus.cancelled:
        return MigrationCancelledWidget();
        
      default:
        return MigrationActiveProgressWidget(progress: progress!);
    }
  }
}

/// Widget showing preparing state
class MigrationPreparingWidget extends StatelessWidget {
  const MigrationPreparingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = context.theme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(
            l10n.preparingMigration,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget showing active migration progress
class MigrationActiveProgressWidget extends StatelessWidget {
  const MigrationActiveProgressWidget({
    super.key,
    required this.progress,
  });

  final MigrationProgress progress;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    
    return Column(
      children: [
        // Progress indicator
        MigrationProgressIndicator(progress: progress),
        
        const SizedBox(height: 32),
        
        // Current step
        MigrationCurrentStepCard(progress: progress),
        
        const Spacer(),
      ],
    );
  }
}

/// Circular progress indicator with percentage
class MigrationProgressIndicator extends StatelessWidget {
  const MigrationProgressIndicator({
    super.key,
    required this.progress,
  });

  final MigrationProgress progress;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    
    return SizedBox(
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
    );
  }
}

/// Current step information card
class MigrationCurrentStepCard extends StatelessWidget {
  const MigrationCurrentStepCard({
    super.key,
    required this.progress,
  });

  final MigrationProgress progress;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    
    return Card(
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
}

/// Widget showing completed migration state
class MigrationCompletedWidget extends StatelessWidget {
  const MigrationCompletedWidget({
    super.key,
    required this.sourceManga,
    required this.targetManga,
    required this.targetSource,
  });

  final MangaDto sourceManga;
  final MangaDto targetManga;
  final SourceDto targetSource;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = context.theme;
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MigrationStatusIcon(
          icon: Icons.check_circle,
          color: Colors.green,
          backgroundColor: Colors.green.withOpacity(0.1),
        ),
        const SizedBox(height: 24),
        Text(
          l10n.migrationCompleted,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          l10n.migrationSuccessMessage,
          style: theme.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        MigrationSummaryCard(
          sourceManga: sourceManga,
          targetManga: targetManga,
          targetSource: targetSource,
        ),
      ],
    );
  }
}

/// Widget showing error state
class MigrationErrorWidget extends StatelessWidget {
  const MigrationErrorWidget({
    super.key,
    required this.progress,
  });

  final MigrationProgress progress;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = context.theme;
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MigrationStatusIcon(
          icon: Icons.error,
          color: Colors.red,
          backgroundColor: Colors.red.withOpacity(0.1),
        ),
        const SizedBox(height: 24),
        Text(
          l10n.migrationFailed,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
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
}

/// Widget showing cancelled state
class MigrationCancelledWidget extends StatelessWidget {
  const MigrationCancelledWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = context.theme;
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MigrationStatusIcon(
          icon: Icons.cancel,
          color: Colors.orange,
          backgroundColor: Colors.orange.withOpacity(0.1),
        ),
        const SizedBox(height: 24),
        Text(
          l10n.migrationCancelled,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.orange,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          l10n.migrationCancelledMessage,
          style: theme.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

/// Reusable status icon widget
class MigrationStatusIcon extends StatelessWidget {
  const MigrationStatusIcon({
    super.key,
    required this.icon,
    required this.color,
    required this.backgroundColor,
  });

  final IconData icon;
  final Color color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: 80,
        color: color,
      ),
    );
  }
}

/// Migration summary card
class MigrationSummaryCard extends StatelessWidget {
  const MigrationSummaryCard({
    super.key,
    required this.sourceManga,
    required this.targetManga,
    required this.targetSource,
  });

  final MangaDto sourceManga;
  final MangaDto targetManga;
  final SourceDto targetSource;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    
    return Card(
      color: theme.colorScheme.surfaceVariant,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Migration Summary',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '• Migrated from: ${sourceManga.title}',
              style: theme.textTheme.bodySmall,
            ),
            Text(
              '• Migrated to: ${targetManga.title}',
              style: theme.textTheme.bodySmall,
            ),
            Text(
              '• Source: ${targetSource.displayName ?? targetSource.name}',
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

/// Action buttons for migration screen
class MigrationActionButtons extends StatelessWidget {
  const MigrationActionButtons({
    super.key,
    required this.progress,
    required this.onCancel,
    required this.onComplete,
  });

  final MigrationProgress? progress;
  final VoidCallback onCancel;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    
    if (progress == null ||
        progress!.status == MigrationStatus.preparing ||
        progress!.status == MigrationStatus.migrating) {
      // Cancel button during active migration
      return SafeArea(
        child: OutlinedButton(
          onPressed: onCancel,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.red,
            side: const BorderSide(color: Colors.red),
          ),
          child: Text(l10n.cancelMigration),
        ),
      );
    }
    
    // Done button after completion/error/cancellation
    return SafeArea(
      child: FilledButton(
        onPressed: onComplete,
        child: Text(l10n.done),
      ),
    );
  }
} 