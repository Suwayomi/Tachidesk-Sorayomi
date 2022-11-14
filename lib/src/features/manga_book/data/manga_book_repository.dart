// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';

// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

// 🌎 Project imports:
import '../../../constants/endpoints.dart';
import '../../../global_providers/global_providers.dart';
import '../../../utils/classes/pair/pair_model.dart';
import '../../../utils/misc/custom_typedef.dart';
import '../../../utils/storage/dio/dio_client.dart';
import '../domain/chapter/chapter_model.dart';
import '../domain/chapter_page/chapter_page_model.dart';
import '../domain/downloads/downloads_model.dart';
import '../domain/downloads_queue/downloads_queue_model.dart';
import '../domain/manga/manga_model.dart';
import '../domain/update_status/update_status_model.dart';

part 'manga_book_repository.g.dart';

class MangaBookRepository {
  const MangaBookRepository(this.dioClient);

  final DioClient dioClient;
  // Downloads
  Future<void> startDownloads() => dioClient.get(DownloaderUrl.start);
  Future<void> stopDownloads() => dioClient.get(DownloaderUrl.stop);
  Future<void> clearDownloads() => dioClient.get(DownloaderUrl.clear);
  Future<void> addMangaToLibrary(String mangaId) =>
      dioClient.get(MangaUrl.library(mangaId));
  Future<void> removeMangaFromLibrary(String mangaId) =>
      dioClient.delete(MangaUrl.library(mangaId));

  Future<void> addChaptersBatchToDownloadQueue(List<int> chapterIds) =>
      dioClient.post(
        DownloaderUrl.batch,
        data: {"chapterIds": chapterIds},
      );
  Future<void> addChapterToDownloadQueue(int mangaId, int chapterIndex) =>
      dioClient.get(DownloaderUrl.chapter(mangaId, chapterIndex));

  Future<void> removeChapterFromDownloadQueue(int mangaId, int chapterIndex) =>
      dioClient.delete(DownloaderUrl.chapter(mangaId, chapterIndex));

  Pair<Stream<Downloads>, AsyncVoidCallBack> socketDownloads() {
    final url = (dioClient.dio.options.baseUrl
        .replaceFirst(RegExp('http', caseSensitive: false), 'ws'));
    final channel =
        WebSocketChannel.connect(Uri.parse(url + DownloaderUrl.downloads));

    return Pair<Stream<Downloads>, AsyncVoidCallBack>(
      first: channel.stream.asyncMap<Downloads>((event) =>
          compute<String, Downloads>(
              (s) => Downloads.fromJson(json.decode(s)), event)),
      second: channel.sink.close,
    );
  }

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

  Future<void> deleteChapter({
    required int mangaId,
    required int chapterIndex,
    CancelToken? cancelToken,
  }) async =>
      (await dioClient.delete(
        MangaUrl.chapterWithIndex(mangaId, chapterIndex),
        cancelToken: cancelToken,
      ));

  // Updates
  Future<ChapterPage?> getRecentChaptersPage({
    int pageNo = 0,
    CancelToken? cancelToken,
  }) async =>
      (await dioClient.get<ChapterPage, ChapterPage?>(
        UpdateUrl.recentChapters(pageNo),
        decoder: (e) =>
            e is Map<String, dynamic> ? ChapterPage.fromJson(e) : null,
        cancelToken: cancelToken,
      ))
          .data;

  Future<void> fetchUpdates({
    int? categoryId,
    CancelToken? cancelToken,
  }) =>
      dioClient.post(
        UpdateUrl.fetch,
        cancelToken: cancelToken,
        data: FormData.fromMap({
          if (categoryId != null && categoryId != 0) "categoryId": categoryId,
        }),
      );

  Future<void> resetUpdates({
    CancelToken? cancelToken,
  }) =>
      dioClient.post(UpdateUrl.reset, cancelToken: cancelToken);

  Future<UpdateStatus?> summaryUpdates({
    CancelToken? cancelToken,
  }) async =>
      (await dioClient.get<UpdateStatus, UpdateStatus?>(
        UpdateUrl.summary,
        cancelToken: cancelToken,
        decoder: (e) => e is Map<String, dynamic>
            ? UpdateStatus.fromJson(e["statusMap"])
            : null,
      ))
          .data;

  Pair<Stream<UpdateStatus>, AsyncVoidCallBack> socketUpdates() {
    final url = (dioClient.dio.options.baseUrl
        .replaceFirst(RegExp('http', caseSensitive: false), 'ws'));
    final channel = WebSocketChannel.connect(Uri.parse(url + UpdateUrl.update));
    return Pair<Stream<UpdateStatus>, AsyncVoidCallBack>(
      first: channel.stream.asyncMap<UpdateStatus>((event) =>
          compute<String, UpdateStatus>(
              (s) => UpdateStatus.fromJson(json.decode(s)["statusMap"] ?? {}),
              event)),
      second: channel.sink.close,
    );
  }
}

@riverpod
MangaBookRepository mangaBookRepository(MangaBookRepositoryRef ref) =>
    MangaBookRepository(ref.watch(dioClientKeyProvider));

@riverpod
Future<UpdateStatus?> updateSummary(UpdateSummaryRef ref) async {
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);
  final result = await ref
      .watch(mangaBookRepositoryProvider)
      .summaryUpdates(cancelToken: cancelToken);
  return result;
}

//TODO SUPPORT FOR RIVERPOD STREAM GENERATOR https://github.com/rrousselGit/riverpod/issues/1663
final downloadsSocketProvider = StreamProvider.autoDispose<Downloads>((ref) {
  final pair = ref.watch(mangaBookRepositoryProvider).socketDownloads();
  ref.onDispose(pair.second);
  return pair.first;
});

//TODO SUPPORT FOR RIVERPOD STREAM GENERATOR https://github.com/rrousselGit/riverpod/issues/1663
final updatesSocketProvider = StreamProvider.autoDispose<UpdateStatus>((ref) {
  final pair = ref.watch(mangaBookRepositoryProvider).socketUpdates();
  ref.onDispose(pair.second);
  return pair.first;
});

@riverpod
Map<String, DownloadsQueue> downloadsMap(DownloadsMapRef ref) {
  final downloads = ref.watch(downloadsSocketProvider);
  return {
    for (var element in downloads.valueOrNull?.queue ?? [])
      (element is DownloadsQueue)
          ? getKeyFromDownloadsQueue(element.mangaId, element.chapterIndex)
          : '-1': element
  };
}

String getKeyFromDownloadsQueue(int? mangaId, int? chapterIndex) =>
    "$mangaId^$chapterIndex";

@riverpod
DownloadsQueue? downloadsFromId(DownloadsFromIdRef ref, String key) =>
    ref.watch(downloadsMapProvider.select((value) => value[key]));
