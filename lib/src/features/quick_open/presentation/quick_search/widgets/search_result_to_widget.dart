// Copyright (c) 2023 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import '../../../../../utils/extensions/custom_extensions.dart';
import '../../../domain/quick_search_result.dart';
import 'category_query_list_tile.dart';
import 'source_query_list_tile.dart';

class SearchResultToWidget extends StatelessWidget {
  const SearchResultToWidget({
    super.key,
    required this.result,
    required this.afterClick,
    this.controller,
  });
  final QuickSearchResult result;
  final VoidCallback afterClick;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return result.when(
      // helpText: ,
      helpText: (prefill, pattern, hintText) => ListTile(
        leading: Text(prefill),
        title: Text(
          hintText,
          style: TextStyle(color: context.theme.hintColor),
        ),
        onTap: () => pattern.isNotBlank ? controller?.text = pattern! : null,
      ),
      source: (source) => SourceQueryListTile(
        source: source,
        afterClick: afterClick,
      ),
      sourceSearch: (source, query) => SourceQueryListTile(
        source: source,
        query: query,
        afterClick: afterClick,
      ),
      category: (category) => CategoryQueryListTile(
        category: category,
        afterClick: afterClick,
      ),
      categoryManga: (category, manga) => CategoryQueryListTile(
        category: category,
        manga: manga,
        afterClick: afterClick,
      ),
      categoryMangaChapter: (category, manga, chapter) => CategoryQueryListTile(
        category: category,
        manga: manga,
        chapter: chapter,
        afterClick: afterClick,
      ),
      manga: (source, manga) => const SizedBox.shrink(),
      chapter: (source, manga, chapter) => const SizedBox.shrink(),
      globalSearch: () => const SizedBox.shrink(),
    );
  }
}
