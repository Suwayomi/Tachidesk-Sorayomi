// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../manga_book/domain/manga/graphql/__generated__/fragment.graphql.dart';

part 'migration_models.freezed.dart';
part 'migration_models.g.dart';

@freezed
class MigrationSource with _$MigrationSource {
  const factory MigrationSource({
    required String id,
    required String name,
    required String lang,
    @Default(false) bool isConfigured,
    @Default(0) int mangaCount,
    String? displayName,
    bool? supportsLatest,
  }) = _MigrationSource;

  factory MigrationSource.fromJson(Map<String, dynamic> json) =>
      _$MigrationSourceFromJson(json);
}

@freezed
class MigrationOption with _$MigrationOption {
  const factory MigrationOption({
    @Default(true) bool migrateChapters,
    @Default(true) bool migrateCategories,
    @Default(false) bool migrateDownloads,
    @Default(false) bool migrateTracking,
    @Default(true) bool deleteSource,
  }) = _MigrationOption;

  factory MigrationOption.fromJson(Map<String, dynamic> json) =>
      _$MigrationOptionFromJson(json);
}

@freezed
class MigrationResult with _$MigrationResult {
  const factory MigrationResult({
    required bool success,
    String? error,
    @Default(0) int migratedChapters,
    @Default(<String>[]) List<String> warnings,
    Fragment$MangaDto? newManga,
    @Default(0) int migratedCategories,
    @Default(0) int migratedDownloads,
  }) = _MigrationResult;

  factory MigrationResult.fromJson(Map<String, dynamic> json) =>
      _$MigrationResultFromJson(json);
}

enum MigrationStatus {
  idle,
  preparing,
  migrating,
  completed,
  error,
  cancelled,
}

@freezed
class MigrationProgress with _$MigrationProgress {
  const factory MigrationProgress({
    required String currentStep,
    @Default(0.0) double percentage,
    @Default(MigrationStatus.idle) MigrationStatus status,
    String? errorMessage,
    @Default(0) int processedItems,
    @Default(0) int totalItems,
  }) = _MigrationProgress;

  factory MigrationProgress.fromJson(Map<String, dynamic> json) =>
      _$MigrationProgressFromJson(json);
}

@freezed
class MangaSearchResult with _$MangaSearchResult {
  const factory MangaSearchResult({
    required Fragment$MangaDto manga,
    @Default(0.0) double similarity,
    String? matchReason,
  }) = _MangaSearchResult;

  factory MangaSearchResult.fromJson(Map<String, dynamic> json) =>
      _$MangaSearchResultFromJson(json);
} 