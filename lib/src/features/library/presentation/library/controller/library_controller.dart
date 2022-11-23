// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 📦 Package imports:

// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 🌎 Project imports:
import '../../../../../constants/db_keys.dart';
import '../../../../../constants/enum.dart';
import '../../../../../utils/extensions/custom_extensions/int_extensions.dart';
import '../../../../../utils/extensions/custom_extensions/string_extensions.dart';
import '../../../../../utils/storage/local/shared_preferences_client.dart';
import '../../../../manga_book/domain/manga/manga_model.dart';
import '../../../data/category/category_repository.dart';

part 'library_controller.g.dart';

@riverpod
class LibraryScreenShowSearch extends _$LibraryScreenShowSearch {
  @override
  bool build() => false;
  void toggle() => state = !state;
}

@riverpod
Future<List<Manga>?> categoryMangaList(
    CategoryMangaListRef ref, int categoryId) async {
  final token = CancelToken();
  ref.onDispose(token.cancel);
  final result = await ref
      .watch(categoryRepositoryProvider)
      .getMangasFromCategory(categoryId: categoryId, cancelToken: token);
  ref.keepAlive();
  return result;
}

@riverpod
class CategoryMangaListWithQueryAndFilter
    extends _$CategoryMangaListWithQueryAndFilter {
  @override
  AsyncValue<List<Manga>?> build({required int categoryId}) {
    final mangaList = ref.watch(categoryMangaListProvider(categoryId));
    final searchFilter = ref.watch(libraryScreenShowSearchProvider);
    final query = ref.watch(libraryQueryProvider);
    final mangaFilterUnread = ref.watch(libraryMangaFilterUnreadProvider);
    final mangaFilterDownloaded =
        ref.watch(libraryMangaFilterDownloadedProvider);
    final mangaFilterCompleted = ref.watch(libraryMangaFilterCompletedProvider);
    final sortedBy = ref.watch(libraryMangaSortProvider);
    final sortedDirection =
        ref.watch(libraryMangaSortDirectionProvider) ?? true;

    bool applyMangaFilter(Manga manga) {
      if (mangaFilterUnread != null &&
          (mangaFilterUnread ^ manga.unreadCount.isGreaterThan(0))) {
        return false;
      }

      if (mangaFilterDownloaded != null &&
          (mangaFilterDownloaded ^ manga.downloadCount.isGreaterThan(0))) {
        return false;
      }

      if (mangaFilterCompleted != null &&
          (mangaFilterCompleted ^ (manga.status?.title == "COMPLETED"))) {
        return false;
      }
      if (searchFilter && !manga.title.query(query)) {
        return false;
      }

      return true;
    }

    int applyMangaSort(Manga m1, Manga m2) {
      final sortDirToggle = (sortedDirection ? 1 : -1);
      switch (sortedBy) {
        case MangaSort.alphabetical:
          return (m1.title ?? "").compareTo(m2.title ?? "") * sortDirToggle;
        case MangaSort.unread:
          return (m1.unreadCount ?? 0).compareTo(m2.unreadCount ?? 0) *
              sortDirToggle;
        case MangaSort.dateAdded:
          return (m1.inLibraryAt ?? 0).compareTo(m2.inLibraryAt ?? 0) *
              sortDirToggle;
        default:
          return 0;
      }
    }

    return mangaList.map<AsyncValue<List<Manga>?>>(
      data: (e) => AsyncData(e.valueOrNull?.where(applyMangaFilter).toList()
        ?..sort(applyMangaSort)),
      error: (e) => e,
      loading: (e) => e,
    );
  }

  void invalidate() => ref.invalidate(categoryMangaListProvider(categoryId));
}

@riverpod
class LibraryQuery extends _$LibraryQuery {
  @override
  String? build() => null;
}

@riverpod
class LibraryMangaFilterDownloaded extends _$LibraryMangaFilterDownloaded
    with SharedPreferenceClient<bool> {
  @override
  bool? build() => initialize(
        client: ref.watch(sharedPreferencesProvider),
        key: DBKeys.mangaFilterDownloaded.name,
        initial: DBKeys.mangaFilterDownloaded.initial,
      );
}

@riverpod
class LibraryMangaFilterUnread extends _$LibraryMangaFilterUnread
    with SharedPreferenceClient<bool> {
  @override
  bool? build() => initialize(
        client: ref.watch(sharedPreferencesProvider),
        key: DBKeys.mangaFilterUnread.name,
        initial: DBKeys.mangaFilterUnread.initial,
      );
}

@riverpod
class LibraryMangaFilterCompleted extends _$LibraryMangaFilterCompleted
    with SharedPreferenceClient<bool> {
  @override
  bool? build() => initialize(
        client: ref.watch(sharedPreferencesProvider),
        key: DBKeys.mangaFilterCompleted.name,
        initial: DBKeys.mangaFilterCompleted.initial,
      );
}

@riverpod
class LibraryMangaSort extends _$LibraryMangaSort
    with SharedPreferenceEnumClient<MangaSort> {
  @override
  MangaSort? build() => initialize(
        client: ref.watch(sharedPreferencesProvider),
        key: DBKeys.mangaSort.name,
        initial: DBKeys.mangaSort.initial,
        enumList: MangaSort.values,
      );
}

@riverpod
class LibraryMangaSortDirection extends _$LibraryMangaSortDirection
    with SharedPreferenceClient<bool> {
  @override
  bool? build() => initialize(
        client: ref.watch(sharedPreferencesProvider),
        key: DBKeys.mangaSortDirection.name,
        initial: DBKeys.mangaSortDirection.initial,
      );
}

@riverpod
class LibraryDisplayMode extends _$LibraryDisplayMode
    with SharedPreferenceEnumClient<DisplayMode> {
  @override
  DisplayMode? build() => initialize(
        client: ref.watch(sharedPreferencesProvider),
        key: DBKeys.libraryDisplayMode.name,
        initial: DBKeys.libraryDisplayMode.initial,
        enumList: DisplayMode.values,
      );
}
