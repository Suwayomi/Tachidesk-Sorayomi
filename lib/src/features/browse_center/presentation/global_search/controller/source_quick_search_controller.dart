// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../constants/enum.dart';
import '../../../../manga_book/domain/manga/manga_model.dart';
import '../../../data/source_repository/source_repository.dart';

part 'source_quick_search_controller.g.dart';

@riverpod
Future<List<Manga>> sourceQuickSearchMangaList(
  SourceQuickSearchMangaListRef ref,
  String sourceId, {
  String? query,
}) async {
  return [
    ...?((await ref.watch(sourceRepositoryProvider).getMangaList(
              pageNum: 0,
              sourceId: sourceId,
              sourceType: SourceType.filter,
              query: query,
            ))
        ?.mangaList)
  ];
}
