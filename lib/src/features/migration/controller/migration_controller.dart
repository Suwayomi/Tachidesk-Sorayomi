// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../global_providers/global_providers.dart';
import '../../../utils/extensions/custom_extensions.dart';
import '../../browse_center/data/source_repository/source_repository.dart';
import '../../browse_center/domain/source/source_model.dart';
import '../../browse_center/presentation/source/controller/source_controller.dart';
import '../../manga_book/domain/manga/graphql/__generated__/fragment.graphql.dart';
import '../../manga_book/domain/manga/manga_model.dart';
import '../data/migration_repository.dart';
import '../domain/migration_models.dart';

part 'migration_controller.g.dart';

@riverpod
class MigrationSources extends _$MigrationSources {
  @override
  Future<List<MigrationSource>?> build({required int mangaId}) async {
    return ref.watch(migrationRepositoryProvider).getMigrationSources(mangaId);
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

@riverpod
class MigrationSearch extends _$MigrationSearch {
  @override
  Future<List<Fragment$MangaDto>?> build({
    required String sourceId,
    required String query,
  }) async {
    if (query.isEmpty) return [];
    
    return ref.watch(migrationRepositoryProvider).searchMangaInSource(sourceId, query);
  }

  Future<void> search(String sourceId, String query) async {
    state = const AsyncLoading();
    
    try {
      final results = await ref.read(migrationRepositoryProvider)
          .searchMangaInSource(sourceId, query);
      state = AsyncData(results);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  void clearResults() {
    state = const AsyncData([]);
  }
}

// Migration Quick Search Results similar to regular global search
typedef MigrationQuickSearchResults = ({
  SourceDto source,
  AsyncValue<List<MangaDto>> mangaList
});

@riverpod
Future<List<MangaDto>> migrationSourceQuickSearchMangaList(
  Ref ref,
  String sourceId, {
  String? query,
}) async {
  final rateLimiterQueue = ref.watch(rateLimitQueueProvider(query));
  final mangaPage = await rateLimiterQueue
      .add(() => ref.watch(sourceRepositoryProvider).fetchSourceManga(
            page: 1,
            sourceId: sourceId,
            sourceType: SourceType.SEARCH,
            query: query,
          ));
  return [...?(mangaPage?.mangas)];
}

@riverpod
AsyncValue<List<MigrationQuickSearchResults>> migrationGlobalSearchResults(Ref ref,
    {String? query}) {
  final sourceMapData = ref.watch(sourceMapFilteredProvider);

  final sourceMap = <String, List<SourceDto>>{...?sourceMapData.valueOrNull}..remove("lastUsed");
  final sourceList = sourceMap.values.fold(
    <SourceDto>[],
    (prev, cur) => [...prev, ...cur],
  );
  final List<MigrationQuickSearchResults> sourceMangaListPairList = [];
  for (SourceDto source in sourceList) {
    if (source.id.isNotBlank) {
      final mangaList = ref.watch(
        migrationSourceQuickSearchMangaListProvider(source.id, query: query),
      );
      sourceMangaListPairList.add((mangaList: mangaList, source: source));
    }
  }

  return sourceMapData.copyWithData((_) => sourceMangaListPairList);
}

@riverpod
class MigrationExecution extends _$MigrationExecution {
  @override
  MigrationProgress? build() => null;

  Future<MigrationResult?> executeMigration({
    required int fromMangaId,
    required int toMangaId,
    required MigrationOption options,
  }) async {
    try {
      // Set initial progress
      state = const MigrationProgress(
        currentStep: 'Preparing migration...',
        percentage: 0.0,
        status: MigrationStatus.preparing,
      );

      // Add a small delay to show the preparing state
      await Future.delayed(const Duration(milliseconds: 500));

      // Simulate progress updates during migration
      _updateProgress('Migrating chapters...', 25.0, MigrationStatus.migrating);
      await Future.delayed(const Duration(milliseconds: 500));
      
      _updateProgress('Migrating categories...', 50.0, MigrationStatus.migrating);
      await Future.delayed(const Duration(milliseconds: 500));
      
      _updateProgress('Finalizing migration...', 75.0, MigrationStatus.migrating);
      await Future.delayed(const Duration(milliseconds: 500));
      
      final result = await ref.read(migrationRepositoryProvider)
          .migrateManga(fromMangaId, toMangaId, options);

      if (result?.success == true) {
        _updateProgress('Migration completed', 100.0, MigrationStatus.completed);
      } else {
        _updateProgress(
          result?.error ?? 'Migration failed',
          0.0,
          MigrationStatus.error,
        );
      }

      return result;
    } catch (e) {
      state = MigrationProgress(
        currentStep: 'Migration failed',
        status: MigrationStatus.error,
        errorMessage: e.toString(),
      );
      return null;
    }
  }

  void _updateProgress(String step, double percentage, MigrationStatus status) {
    state = MigrationProgress(
      currentStep: step,
      percentage: percentage,
      status: status,
    );
  }

  Future<void> cancelMigration() async {
    try {
      await ref.read(migrationRepositoryProvider).cancelMigration();
      state = const MigrationProgress(
        currentStep: 'Migration cancelled',
        status: MigrationStatus.cancelled,
      );
    } catch (e) {
      // Handle cancellation error
    }
  }

  void reset() {
    state = null;
  }
}

@riverpod
class MigrationSearchQuery extends _$MigrationSearchQuery {
  @override
  String build() => '';

  void update(String query) {
    state = query;
  }

  void clear() {
    state = '';
  }
}

@riverpod
class SelectedMigrationSource extends _$SelectedMigrationSource {
  @override
  MigrationSource? build() => null;

  void select(MigrationSource source) {
    state = source;
  }

  void clear() {
    state = null;
  }
}

@riverpod
class SelectedTargetManga extends _$SelectedTargetManga {
  @override
  Fragment$MangaDto? build() => null;

  void select(Fragment$MangaDto manga) {
    state = manga;
  }

  void clear() {
    state = null;
  }
}

@riverpod
class MigrationOptions extends _$MigrationOptions {
  @override
  MigrationOption build() => const MigrationOption();

  void update(MigrationOption options) {
    state = options;
  }

  void updateChapters(bool value) {
    state = state.copyWith(migrateChapters: value);
  }

  void updateCategories(bool value) {
    state = state.copyWith(migrateCategories: value);
  }

  void updateDownloads(bool value) {
    state = state.copyWith(migrateDownloads: value);
  }

  void updateTracking(bool value) {
    state = state.copyWith(migrateTracking: value);
  }

  void updateDeleteSource(bool value) {
    state = state.copyWith(deleteSource: value);
  }

  void reset() {
    state = const MigrationOption();
  }
} 