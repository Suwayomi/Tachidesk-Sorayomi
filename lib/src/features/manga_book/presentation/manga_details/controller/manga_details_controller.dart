// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 🌎 Project imports:
import '../../../../../constants/db_keys.dart';
import '../../../../../constants/enum.dart';
import '../../../../../utils/storage/local/shared_preferences_client.dart';
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
        .getChapterList(mangaId: mangaId, cancelToken: token, useCache: false);
    ref.keepAlive();
    ref.onDispose(token.cancel);
    return result;
  }

  Future<void> refresh([bool useCache = false]) async {
    final token = CancelToken();
    final result = await AsyncValue.guard(
      () => ref.read(mangaBookRepositoryProvider).getChapterList(
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

@riverpod
List<Chapter>? mangaChapterListWithFilter(
  MangaChapterListWithFilterRef ref, {
  required String mangaId,
}) {
  final chapterList = ref.watch(mangaChapterListProvider(mangaId: mangaId));
  final chapterFilterUnread = ref.watch(mangaChapterFilterUnreadProvider);
  final chapterFilterDownloaded =
      ref.watch(mangaChapterFilterDownloadedProvider);
  final chapterFilterBookmark = ref.watch(mangaChapterFilterBookmarkedProvider);
  final sortedBy = ref.watch(mangaChapterSortProvider);
  final sortedDirection = ref.watch(mangaChapterSortDirectionProvider) ?? true;

  bool applyChapterFilter(Chapter chapter) {
    if (chapterFilterUnread != null &&
        (chapterFilterUnread ^ !(chapter.read ?? false))) {
      return false;
    }

    if (chapterFilterDownloaded != null &&
        (chapterFilterDownloaded ^ (chapter.downloaded ?? false))) {
      return false;
    }

    if (chapterFilterBookmark != null &&
        (chapterFilterBookmark ^ (chapter.bookmarked ?? false))) {
      return false;
    }
    return true;
  }

  int applyChapterSort(Chapter m1, Chapter m2) {
    final sortDirToggle = (sortedDirection ? 1 : -1);
    switch (sortedBy) {
      case ChapterSort.fetchedDate:
        return (m1.fetchedAt ?? 0).compareTo(m2.fetchedAt ?? 0) * sortDirToggle;
      case ChapterSort.source:
        return (m1.index ?? 0).compareTo(m2.index ?? 0) * sortDirToggle;
      default:
        return 0;
    }
  }

  return chapterList.valueOrNull?.where(applyChapterFilter).toList()
    ?..sort(applyChapterSort);
}

@riverpod
class MangaChapterSort extends _$MangaChapterSort
    with SharedPreferenceEnumClient<ChapterSort> {
  @override
  ChapterSort? build() => initialize(
        client: ref.watch(sharedPreferencesProvider),
        key: DBKeys.chapterSort.name,
        initial: DBKeys.chapterSort.initial,
        enumList: ChapterSort.values,
      );
}

@riverpod
class MangaChapterSortDirection extends _$MangaChapterSortDirection
    with SharedPreferenceClient<bool> {
  @override
  bool? build() => initialize(
        client: ref.watch(sharedPreferencesProvider),
        key: DBKeys.chapterSortDirection.name,
        initial: DBKeys.chapterSortDirection.initial,
      );
}

@riverpod
class MangaChapterFilterDownloaded extends _$MangaChapterFilterDownloaded
    with SharedPreferenceClient<bool> {
  @override
  bool? build() => initialize(
        client: ref.watch(sharedPreferencesProvider),
        key: DBKeys.chapterFilterDownloaded.name,
        initial: DBKeys.chapterFilterDownloaded.initial,
      );
}

@riverpod
class MangaChapterFilterUnread extends _$MangaChapterFilterUnread
    with SharedPreferenceClient<bool> {
  @override
  bool? build() => initialize(
        client: ref.watch(sharedPreferencesProvider),
        key: DBKeys.chapterFilterUnread.name,
        initial: DBKeys.chapterFilterUnread.initial,
      );
}

@riverpod
class MangaChapterFilterBookmarked extends _$MangaChapterFilterBookmarked
    with SharedPreferenceClient<bool> {
  @override
  bool? build() => initialize(
        client: ref.watch(sharedPreferencesProvider),
        key: DBKeys.chapterFilterBookmarked.name,
        initial: DBKeys.chapterFilterBookmarked.initial,
      );
}
