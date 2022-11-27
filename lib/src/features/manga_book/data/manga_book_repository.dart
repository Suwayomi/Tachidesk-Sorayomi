// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🎯 Dart imports:

// 🐦 Flutter imports:

// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 🌎 Project imports:
import '../../../constants/endpoints.dart';
import '../../../global_providers/global_providers.dart';
import '../../../utils/storage/dio/dio_client.dart';
import '../../library/domain/category/category_model.dart';
import '../domain/chapter/chapter_model.dart';
import '../domain/chapter_batch/chapter_batch_model.dart';
import '../domain/manga/manga_model.dart';

part 'manga_book_repository.g.dart';

class MangaBookRepository {
  const MangaBookRepository(this.dioClient);

  final DioClient dioClient;
  Future<void> addMangaToLibrary(String mangaId) =>
      dioClient.get(MangaUrl.library(mangaId));
  Future<void> removeMangaFromLibrary(String mangaId) =>
      dioClient.delete(MangaUrl.library(mangaId));

  Future<void> modifyBulkChapters({ChapterBatch? batch}) =>
      dioClient.post(MangaUrl.chapterBatch, data: batch?.toJson());

  // Mangas
  Future<Manga?> getManga({
    required String mangaId,
    bool useCache = true,
    CancelToken? cancelToken,
  }) async =>
      (await dioClient.get<Manga, Manga?>(
        MangaUrl.fullWithId(mangaId, useCache: useCache),
        decoder: (e) => e is Map<String, dynamic> ? Manga.fromJson(e) : null,
        cancelToken: cancelToken,
      ))
          .data;

  // Chapters

  Future<Chapter?> getChapter({
    required int mangaId,
    required int chapterIndex,
    bool useCache = true,
    CancelToken? cancelToken,
  }) async =>
      (await dioClient.get<Chapter, Chapter?>(
        MangaUrl.chapterWithIndex(mangaId, chapterIndex, useCache: useCache),
        decoder: (e) => e is Map<String, dynamic> ? Chapter.fromJson(e) : null,
        cancelToken: cancelToken,
      ))
          .data;

  Future<List<Chapter>?> getChapterList({
    required String mangaId,
    bool useCache = true,
    CancelToken? cancelToken,
  }) async =>
      (await dioClient.get<List<Chapter>, Chapter>(
        MangaUrl.chapters(mangaId, useCache: useCache),
        decoder: (e) =>
            e is Map<String, dynamic> ? Chapter.fromJson(e) : Chapter(),
        cancelToken: cancelToken,
      ))
          .data;

  Future<List<Category>?> getMangaCategoryList({
    required String mangaId,
    CancelToken? cancelToken,
  }) async =>
      (await dioClient.get<List<Category>, Category>(
        MangaUrl.category(mangaId),
        decoder: (e) =>
            e is Map<String, dynamic> ? Category.fromJson(e) : Category(),
        cancelToken: cancelToken,
      ))
          .data;
  Future<void> addMangaToCategory(String mangaId, String categoryId) =>
      dioClient.get(MangaUrl.categoryId(mangaId, categoryId));
  Future<void> removeMangaFromCategory(String mangaId, String categoryId) =>
      dioClient.delete(MangaUrl.categoryId(mangaId, categoryId));
}

@riverpod
MangaBookRepository mangaBookRepository(MangaBookRepositoryRef ref) =>
    MangaBookRepository(ref.watch(dioClientKeyProvider));
