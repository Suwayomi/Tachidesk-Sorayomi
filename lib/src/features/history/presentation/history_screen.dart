// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/extensions/custom_extensions.dart';
import '../../../widgets/emoticons.dart';
import '../../../widgets/search_field.dart';
import 'history_controller.dart';
import 'widgets/history_group_widget.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final historyGroups = ref.watch(filteredHistoryGroupsProvider);
    final historyState = ref.watch(readingHistoryProvider);
    final searchQuery = ref.watch(historySearchQueryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.history),
        actions: [
          IconButton(
            onPressed: () =>
                ref.read(readingHistoryProvider.notifier).refresh(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8),
            child: SearchField(
              initialText: searchQuery,
              onChanged: (query) => ref
                  .read(historySearchQueryProvider.notifier)
                  .updateQuery(query ?? ''),
              onSubmitted: (query) => ref
                  .read(historySearchQueryProvider.notifier)
                  .updateQuery(query ?? ''),
              hintText: l10n.searchHistory,
              autofocus: false,
            ),
          ),
          // History content
          Expanded(
            child: historyState.when(
              data: (data) {
                if (data == null || data.isEmpty) {
                  return const HistoryEmptyState();
                }

                if (historyGroups.isEmpty && searchQuery.isNotBlank) {
                  return const HistoryNoSearchResults();
                }

                return RefreshIndicator(
                  onRefresh: () =>
                      ref.read(readingHistoryProvider.notifier).refresh(),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: historyGroups.length,
                    itemBuilder: (context, index) {
                      final group = historyGroups[index];
                      return HistoryGroupWidget(
                        group: group,
                        onRemoveItem: (chapterId) => ref
                            .read(readingHistoryProvider.notifier)
                            .removeFromHistory(chapterId),
                      );
                    },
                  ),
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stack) => HistoryErrorState(
                error: error,
                onRetry: () =>
                    ref.read(readingHistoryProvider.notifier).refresh(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryEmptyState extends StatelessWidget {
  const HistoryEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Emoticons(
              iconData: Icons.history,
            ),
            const SizedBox(height: 16),
            Text(
              l10n.noHistoryFound,
              style: context.theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.startReadingToSeeHistory,
              style: context.theme.textTheme.bodyMedium?.copyWith(
                color: context.theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryNoSearchResults extends StatelessWidget {
  const HistoryNoSearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Emoticons(
              iconData: Icons.search_off,
            ),
            const SizedBox(height: 16),
            Text(
              l10n.noSearchResults,
              style: context.theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.tryDifferentSearchTerm,
              style: context.theme.textTheme.bodyMedium?.copyWith(
                color: context.theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryErrorState extends StatelessWidget {
  const HistoryErrorState({
    super.key,
    required this.error,
    required this.onRetry,
  });

  final Object error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Emoticons(
              iconData: Icons.error_outline,
            ),
            const SizedBox(height: 16),
            Text(
              l10n.errorOccurred,
              style: context.theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              style: context.theme.textTheme.bodyMedium?.copyWith(
                color: context.theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRetry,
              child: Text(l10n.retry),
            ),
          ],
        ),
      ),
    );
  }
}
