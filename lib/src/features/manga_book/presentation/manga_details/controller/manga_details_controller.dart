// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 🌎 Project imports:
import '../../../data/manga_book_repository.dart';
import '../../../domain/chapter/chapter_model.dart';
import '../../../domain/manga/manga_model.dart';

part 'manga_details_controller.g.dart';

@riverpod
class MangaWithId extends _$MangaWithId {
  @override
  Future<Manga?> build({required String mangaId}) async {
    final token = CancelToken();
    final result = await ref
        .watch(mangaBookRepositoryProvider)
        .getManga(mangaId: mangaId, cancelToken: token);
    ref.keepAlive();
    ref.onDispose(token.cancel);
    return result;
  }

  Future<void> refresh([bool useCache = false]) async {
    final token = CancelToken();
    final result = await AsyncValue.guard(() => ref
        .watch(mangaBookRepositoryProvider)
        .getManga(mangaId: mangaId, cancelToken: token, useCache: useCache));
    ref.keepAlive();
    ref.onDispose(token.cancel);
    state = result;
  }
}

@riverpod
class MangaChapterList extends _$MangaChapterList {
  @override
  Future<List<Chapter>?> build({required String mangaId}) async {
    final token = CancelToken();
    final result = await ref
        .watch(mangaBookRepositoryProvider)
        .getChapterList(mangaId: mangaId, cancelToken: token);
    ref.keepAlive();
    ref.onDispose(token.cancel);
    return result;
  }

  Future<void> refresh([bool useCache = false]) async {
    final token = CancelToken();
    final result = await AsyncValue.guard(
      () => ref.watch(mangaBookRepositoryProvider).getChapterList(
            mangaId: mangaId,
            cancelToken: token,
            useCache: useCache,
          ),
    );
    ref.keepAlive();
    ref.onDispose(token.cancel);
    state = result;
  }

  void updateChapter(int index, Chapter chapter) {
    try {
      final newList = [...?state.valueOrNull];
      newList[index] = chapter;
      state = AsyncData<List<Chapter>?>(newList).copyWithPrevious(state);
    } catch (e) {
      //
    }
  }
}
