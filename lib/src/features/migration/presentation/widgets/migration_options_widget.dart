// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import '../../domain/migration_models.dart';
import '../../../../utils/extensions/custom_extensions.dart';

class MigrationOptionsWidget extends StatelessWidget {
  const MigrationOptionsWidget({
    super.key,
    required this.options,
    required this.onChanged,
  });

  final MigrationOption options;
  final ValueChanged<MigrationOption> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quick presets
            Text(
              l10n?.quickPresets ?? 'Quick Presets',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            
            Wrap(
              spacing: 8,
              children: [
                _PresetChip(
                  label: l10n?.quickMigration ?? 'Recommended',
                  isSelected: _isRecommendedPreset(),
                  onTap: () => _applyRecommendedPreset(),
                ),
                _PresetChip(
                  label: l10n?.customMigration ?? 'Custom',
                  isSelected: _isCustomPreset(),
                  onTap: () {}, // Custom means user configures manually
                ),
              ],
            ),
            
            const SizedBox(height: 20),
            
            // Individual options
            Text(
              l10n?.migrationSettings ?? 'Migration Settings',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            
            // Migrate chapters
            _OptionTile(
              icon: Icons.menu_book_outlined,
              title: l10n?.migrateChapters ?? 'Migrate Chapters',
              subtitle: l10n?.migrateChaptersDescription ?? 'Copy chapter read status to new source',
              value: options.migrateChapters,
              onChanged: (value) => onChanged(options.copyWith(migrateChapters: value)),
            ),
            
            // Migrate categories
            _OptionTile(
              icon: Icons.label_outline,
              title: l10n?.migrateCategories ?? 'Migrate Categories',
              subtitle: l10n?.migrateCategoriesDescription ?? 'Copy manga categories to new source',
              value: options.migrateCategories,
              onChanged: (value) => onChanged(options.copyWith(migrateCategories: value)),
            ),
            
            // Delete source
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.errorContainer.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: theme.colorScheme.error.withOpacity(0.3),
                ),
              ),
              child: _OptionTile(
                icon: Icons.delete_outline,
                title: l10n?.deleteSourceManga ?? 'Delete Source Manga',
                subtitle: l10n?.deleteSourceMangaDescription ?? 'Remove the original manga from library after migration',
                value: options.deleteSource,
                onChanged: (value) => onChanged(options.copyWith(deleteSource: value)),
                isDestructive: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isRecommendedPreset() {
    return options.migrateChapters &&
           options.migrateCategories &&
           options.deleteSource;
  }

  bool _isCustomPreset() {
    return !_isRecommendedPreset();
  }

  void _applyRecommendedPreset() {
    onChanged(const MigrationOption(
      migrateChapters: true,
      migrateCategories: true,
      migrateDownloads: false,
      migrateTracking: false,
      deleteSource: true,
    ));
  }
}

class _PresetChip extends StatelessWidget {
  const _PresetChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onTap(),
      backgroundColor: theme.colorScheme.surface,
      selectedColor: theme.colorScheme.primaryContainer,
      checkmarkColor: theme.colorScheme.onPrimaryContainer,
      labelStyle: TextStyle(
        color: isSelected 
            ? theme.colorScheme.onPrimaryContainer
            : theme.colorScheme.onSurface,
        fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    this.isDestructive = false,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: isDestructive 
                ? theme.colorScheme.error
                : theme.colorScheme.onSurface,
          ),
          const SizedBox(width: 16),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: isDestructive 
                        ? theme.colorScheme.error
                        : theme.colorScheme.onSurface,
                  ),
                ),
                if (subtitle.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: isDestructive 
                          ? theme.colorScheme.error.withOpacity(0.7)
                          : theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
          ),
          
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: isDestructive 
                ? theme.colorScheme.error
                : theme.colorScheme.primary,
          ),
        ],
      ),
    );
  }
} 