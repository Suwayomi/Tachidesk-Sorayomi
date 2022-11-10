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

part 'chapter_repository.g.dart';

class ChapterRepository {
  const ChapterRepository(this.dioClient);

  final DioClient dioClient;

  Future<void> startDownloads() => dioClient.get(DownloaderUrl.start);
  Future<void> stopDownloads() => dioClient.get(DownloaderUrl.stop);
  Future<void> clearDownloads() => dioClient.get(DownloaderUrl.clear);

  Future<void> addChapterToDownloadQueue(int mangaId, int chapterIndex) =>
      dioClient.get(DownloaderUrl.chapter(mangaId, chapterIndex));

  Future<void> removeChapterFromDownloadQueue(int mangaId, int chapterIndex) =>
      dioClient.delete(DownloaderUrl.chapter(mangaId, chapterIndex));

  Pair<Stream<Downloads>, AsyncVoidCallBack> socketDownloads() {
    final url = (dioClient.dio.options.baseUrl
        .replaceFirst(RegExp('http', caseSensitive: false), 'ws'));
    final channel = WebSocketChannel.connect(Uri.parse(
        url + DownloaderUrl.downloads.substring(url.endsWith('/') ? 1 : 0)));

    return Pair<Stream<Downloads>, AsyncVoidCallBack>(
      first: channel.stream.asyncMap<Downloads>((event) =>
          compute<String, Downloads>(
              (s) => Downloads.fromJson(json.decode(s)), event)),
      second: channel.sink.close,
    );
  }

  Future<Chapter?> getChapter({
    required int mangaId,
    required int chapterIndex,
    CancelToken? cancelToken,
  }) async =>
      (await dioClient.get<Chapter, Chapter>(
        MangaUrl.getChapterWithIndex(mangaId, chapterIndex),
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
        MangaUrl.getChapterWithIndex(mangaId, chapterIndex),
        cancelToken: cancelToken,
      ));

  Future<ChapterPage?> getRecentChaptersPage({
    int pageNo = 0,
    CancelToken? cancelToken,
  }) async =>
      (await dioClient.get<ChapterPage, ChapterPage>(
        UpdateUrl.recentChapters(pageNo),
        decoder: (e) =>
            e is Map<String, dynamic> ? ChapterPage.fromJson(e) : ChapterPage(),
        cancelToken: cancelToken,
      ))
          .data;
}

@riverpod
ChapterRepository chapterRepository(ChapterRepositoryRef ref) =>
    ChapterRepository(ref.watch(dioClientKeyProvider));

//TODO SUPPORT FOR RIVERPOD STREAM GENERATOR https://github.com/rrousselGit/riverpod/issues/1663
final downloadsSocketProvider = StreamProvider.autoDispose<Downloads>((ref) {
  final pair = ref.watch(chapterRepositoryProvider).socketDownloads();
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
