// Copyright (c) 2023 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../browse_center/domain/source/source_model.dart';
import '../../library/domain/category/category_model.dart';
import '../../manga_book/domain/chapter/chapter_model.dart';
import '../../manga_book/domain/manga/manga_model.dart';

part 'quick_search_result.freezed.dart';

@freezed
class QuickSearchResult with _$QuickSearchResult {
  const factory QuickSearchResult.helpText({
    required String prefill,
    String? pattern,
    required String hintText,
  }) = HelpTextQuickSearchResult;

  const factory QuickSearchResult.source({
    required Source source,
  }) = SourceQuickSearchResult;

  const factory QuickSearchResult.sourceSearch({
    required Source source,
    required String query,
  }) = SourceSearchQuickSearchResult;

  const factory QuickSearchResult.category({
    required Category category,
  }) = CategoryQuickSearchResult;

  const factory QuickSearchResult.categoryManga({
    required Category category,
    required Manga manga,
  }) = CategoryMangaQuickSearchResult;

  const factory QuickSearchResult.categoryMangaChapter({
    Category? category,
    required Manga manga,
    required Chapter chapter,
  }) = CategoryMangaChapterQuickSearchResult;

  const factory QuickSearchResult.manga({
    Source? source,
    required Manga manga,
  }) = MangaQuickSearchResult;

  const factory QuickSearchResult.chapter({
    Source? source,
    required Manga manga,
    required Chapter chapter,
  }) = ChapterQuickSearchResult;

  const factory QuickSearchResult.globalSearch() =
      GlobalSearchQuickSearchResult;
}
