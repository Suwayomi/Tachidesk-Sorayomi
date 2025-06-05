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
import '../../manga_book/data/manga_book/__generated__/query.graphql.dart';
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
        isConfigured: true,
        mangaCount: 0,
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
      
      // Get source manga information
      final sourceMangaResult = await client.query$GetManga(
        Options$Query$GetManga(
          variables: Variables$Query$GetManga(id: fromMangaId),
        ),
      );
      
      if (sourceMangaResult.hasException) {
        throw Exception('Failed to fetch source manga: ${sourceMangaResult.exception}');
      }
      
      final sourceManga = sourceMangaResult.parsedData?.manga;
      if (sourceManga == null) {
        throw Exception('Source manga not found');
      }
      
      // Get target manga information
      final targetMangaResult = await client.query$GetManga(
        Options$Query$GetManga(
          variables: Variables$Query$GetManga(id: toMangaId),
        ),
      );
      
      if (targetMangaResult.hasException) {
        throw Exception('Failed to fetch target manga: ${targetMangaResult.exception}');
      }
      
      final targetManga = targetMangaResult.parsedData?.manga;
      if (targetManga == null) {
        throw Exception('Target manga not found');
      }
      
      List<String> warnings = [];
      int migratedChapters = 0;
      int migratedCategories = 0;
      
      // Step 1: Add target manga to library if source manga is in library
      if (sourceManga.inLibrary) {
        final updateLibraryResult = await client.mutate$UpdateManga(
          Options$Mutation$UpdateManga(
            variables: Variables$Mutation$UpdateManga(
              input: Input$UpdateMangaInput(
                id: toMangaId,
                patch: Input$UpdateMangaPatchInput(inLibrary: true),
              ),
            ),
          ),
        );
        
        if (updateLibraryResult.hasException) {
          warnings.add('Failed to add target manga to library: ${updateLibraryResult.exception}');
        }
      }
      
      // Step 2: Migrate categories if enabled
      if (options.migrateCategories && sourceManga.inLibrary) {
        try {
          // Get source manga categories
          final sourceCategoriesResult = await client.query$GetMangaCategories(
            Options$Query$GetMangaCategories(
              variables: Variables$Query$GetMangaCategories(id: fromMangaId),
            ),
          );
          
          if (!sourceCategoriesResult.hasException && sourceCategoriesResult.parsedData != null) {
            final categories = sourceCategoriesResult.parsedData!.manga?.categories?.nodes ?? [];
            
            if (categories.isNotEmpty) {
              List<int> categoryIds = categories.map((cat) => cat.id).toList();
              
              // Apply the same categories to target manga
              final updateCategoriesResult = await client.mutate$UpdateMangaCategories(
                Options$Mutation$UpdateMangaCategories(
                  variables: Variables$Mutation$UpdateMangaCategories(
                    updateCategoryInput: Input$UpdateMangaCategoriesInput(
                      id: toMangaId,
                      patch: Input$UpdateMangaCategoriesPatchInput(
                        addToCategories: categoryIds,
                      ),
                    ),
                  ),
                ),
              );
              
              if (updateCategoriesResult.hasException) {
                warnings.add('Failed to migrate categories: ${updateCategoriesResult.exception}');
              } else {
                migratedCategories = categoryIds.length;
              }
            }
          }
        } catch (e) {
          warnings.add('Category migration failed: $e');
        }
      }
      
      // Step 3: Migrate reading progress if enabled
      if (options.migrateChapters) {
        try {
          // Get source manga chapters
          final sourceChaptersResult = await client.query$GetChapterPage(
            Options$Query$GetChapterPage(
              variables: Variables$Query$GetChapterPage(
                condition: Input$ChapterConditionInput(mangaId: fromMangaId),
              ),
            ),
          );
          
          // Get target manga chapters
          final targetChaptersResult = await client.query$GetChapterPage(
            Options$Query$GetChapterPage(
              variables: Variables$Query$GetChapterPage(
                condition: Input$ChapterConditionInput(mangaId: toMangaId),
              ),
            ),
          );
          
          if (!sourceChaptersResult.hasException && !targetChaptersResult.hasException &&
              sourceChaptersResult.parsedData != null && targetChaptersResult.parsedData != null) {
            
            final sourceChapters = sourceChaptersResult.parsedData!.chapters.nodes;
            final targetChapters = targetChaptersResult.parsedData!.chapters.nodes;
            
            // Try to match chapters by chapter number and migrate read status
            for (final sourceChapter in sourceChapters) {
              if (sourceChapter.isRead) {
                // Find matching chapter in target manga by chapter number
                final matchingChapter = targetChapters.where(
                  (chapter) => (chapter.chapterNumber - sourceChapter.chapterNumber).abs() < 0.01,
                ).firstOrNull;
                
                if (matchingChapter != null && !matchingChapter.isRead) {
                  // Mark target chapter as read
                  final updateChapterResult = await client.mutate$UpdateChapter(
                    Options$Mutation$UpdateChapter(
                      variables: Variables$Mutation$UpdateChapter(
                        input: Input$UpdateChapterInput(
                          id: matchingChapter.id,
                          patch: Input$UpdateChapterPatchInput(
                            isRead: true,
                            lastPageRead: sourceChapter.lastPageRead,
                          ),
                        ),
                      ),
                    ),
                  );
                  
                  if (!updateChapterResult.hasException) {
                    migratedChapters++;
                  }
                }
              }
            }
          }
        } catch (e) {
          warnings.add('Chapter migration failed: $e');
        }
      }
      
      // Step 4: Remove source manga from library if deleteSource is enabled
      if (options.deleteSource && sourceManga.inLibrary) {
        final removeFromLibraryResult = await client.mutate$UpdateManga(
          Options$Mutation$UpdateManga(
            variables: Variables$Mutation$UpdateManga(
              input: Input$UpdateMangaInput(
                id: fromMangaId,
                patch: Input$UpdateMangaPatchInput(inLibrary: false),
              ),
            ),
          ),
        );
        
        if (removeFromLibraryResult.hasException) {
          warnings.add('Failed to remove source manga from library: ${removeFromLibraryResult.exception}');
        }
      }
      
      // Add completion message
      warnings.add('Migration completed successfully! ✅');
      warnings.add('• Target manga: ${targetManga.title}');
      warnings.add('• Source: ${targetManga.sourceId}');
      if (migratedChapters > 0) {
        warnings.add('• Chapters migrated: $migratedChapters');
      }
      if (migratedCategories > 0) {
        warnings.add('• Categories migrated: $migratedCategories');
      }
      
      return MigrationResult(
        success: true,
        migratedChapters: migratedChapters,
        migratedCategories: migratedCategories,
        warnings: warnings,
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
    throw UnimplementedError('Migration cancellation not yet implemented');
  }
}

@riverpod
MigrationRepository migrationRepository(ref) =>
    MigrationRepositoryImpl(ref.watch(graphQlClientProvider)); 