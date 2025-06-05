// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:graphql/client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../global_providers/global_providers.dart';
import '../../../graphql/__generated__/schema.graphql.dart';
import '../../../utils/extensions/custom_extensions.dart';
import '../../browse_center/data/source_repository/graphql/__generated__/query.graphql.dart';
import '../../browse_center/domain/source/source_model.dart';
import '../../manga_book/domain/manga/graphql/__generated__/fragment.graphql.dart';
import '../domain/migration_models.dart';

part 'migration_repository.g.dart';

abstract class MigrationRepository {
  Future<List<MigrationSource>?> getMigrationSources(int mangaId);
  Future<List<Fragment$MangaDto>?> searchMangaInSource(String sourceId, String query);
  Future<MigrationResult?> migrateManga(int fromMangaId, int toMangaId, MigrationOption options);
  Future<void> cancelMigration();
}

class MigrationRepositoryImpl implements MigrationRepository {
  final GraphQLClient client;

  MigrationRepositoryImpl(this.client);

  @override
  Future<List<MigrationSource>?> getMigrationSources(int mangaId) async {
    try {
      // TODO: Replace with actual migration sources query when server API is available
      // For now, we'll get all available sources and filter them
      // This is a temporary implementation
      
      // Query to get available sources - this is a placeholder
      // We need to adapt this once the actual migration API is available
      final result = await client.query$SourceList();
      
      if (result.hasException) {
        throw result.exception!;
      }
      
      final sources = result.parsedData?.sources.nodes;
      if (sources == null) return null;
      
      // Convert SourceDto to MigrationSource
      return sources.map((source) => MigrationSource(
        id: source.id,
        name: source.displayName,
        lang: source.lang,
        isConfigured: true, // TODO: Get actual configuration status
        mangaCount: 0, // TODO: Get actual manga count from migration API
        displayName: source.displayName,
        supportsLatest: source.supportsLatest,
      )).toList();
    } catch (e) {
      throw Exception('Failed to get migration sources: $e');
    }
  }

  @override
  Future<List<Fragment$MangaDto>?> searchMangaInSource(String sourceId, String query) async {
    try {
      // TODO: Replace with actual migration search query when server API is available
      // For now, we'll use the regular source search
      
      // This is a placeholder implementation
      // We need to use the actual migration search API once available
      final result = await client.mutate$FetchSourceManga(
        Options$Mutation$FetchSourceManga(
          variables: Variables$Mutation$FetchSourceManga(
            input: Input$FetchSourceMangaInput(
              source: sourceId,
              query: query,
              page: 1,
              type: SourceType.SEARCH,
            ),
          ),
        ),
      );
      
      if (result.hasException) {
        throw result.exception!;
      }
      
      return result.parsedData?.fetchSourceManga?.mangas ?? [];
    } catch (e) {
      throw Exception('Failed to search manga in source: $e');
    }
  }

  @override
  Future<MigrationResult?> migrateManga(int fromMangaId, int toMangaId, MigrationOption options) async {
    try {
      // TODO: Implement actual migration API call when server endpoint is available
      // This is a placeholder that simulates a migration operation with realistic timing
      
      // Simulate migration process with proper delays to match controller progress updates
      await Future.delayed(const Duration(milliseconds: 800)); // Preparing
      await Future.delayed(const Duration(milliseconds: 1000)); // Migrating chapters
      await Future.delayed(const Duration(milliseconds: 600)); // Migrating categories  
      await Future.delayed(const Duration(milliseconds: 400)); // Finalizing
      
      return const MigrationResult(
        success: true,
        migratedChapters: 42, // TODO: Get actual migrated chapter count from API
        migratedCategories: 3, // TODO: Get actual migrated category count from API
        warnings: [
          'Some chapters may have different numbering in the new source',
          'Chapter titles might be slightly different',
        ], // TODO: Get actual warnings from migration API
      );
    } catch (e) {
      return MigrationResult(
        success: false,
        error: 'Migration failed: $e',
      );
    }
  }

  @override
  Future<void> cancelMigration() async {
    // TODO: Implement migration cancellation when server API is available
    throw UnimplementedError('Migration cancellation not yet implemented');
  }
}

@riverpod
MigrationRepository migrationRepository(ref) =>
    MigrationRepositoryImpl(ref.watch(graphQlClientProvider)); 