// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../../constants/endpoints.dart';
import '../../../../global_providers/global_providers.dart';
import '../../../../utils/classes/pair/pair_model.dart';
import '../../../../utils/extensions/custom_extensions.dart';
import '../../../../utils/storage/dio/dio_client.dart';
import '../../domain/downloads/downloads_model.dart';
import '../../domain/downloads_queue/downloads_queue_model.dart';

part 'downloads_repository.g.dart';

class DownloadsRepository {
  const DownloadsRepository(this.dioClient);

  final DioClient dioClient;
  // Downloads
  Future<void> startDownloads() => dioClient.get(DownloaderUrl.start);
  Future<void> stopDownloads() => dioClient.get(DownloaderUrl.stop);
  Future<void> clearDownloads() => dioClient.get(DownloaderUrl.clear);
  Future<void> addChaptersBatchToDownloadQueue(List<int> chapterIds) =>
      dioClient.post(
        DownloaderUrl.batch,
        data: {"chapterIds": chapterIds},
      );
  Future<void> addChapterToDownloadQueue(int mangaId, int chapterIndex) =>
      dioClient.get(DownloaderUrl.chapter(mangaId, chapterIndex));

  Future<void> removeChapterFromDownloadQueue(int mangaId, int chapterIndex) =>
      dioClient.delete(DownloaderUrl.chapter(mangaId, chapterIndex));

  Future<void> reorderDownload(int mangaId, int chapterIndex, int to) =>
      dioClient.patch(
        DownloaderUrl.reorderDownload(mangaId, chapterIndex, to),
      );

  Pair<Stream<Downloads>, AsyncCallback> socketDownloads() {
    final url = (dioClient.dio.options.baseUrl.toWebSocket!);
    final channel =
        WebSocketChannel.connect(Uri.parse(url + DownloaderUrl.downloads));

    return Pair<Stream<Downloads>, AsyncCallback>(
      first: channel.stream.asyncMap<Downloads>(
        (event) => compute<String, Downloads>(
          (s) => Downloads.fromJson(json.decode(s)),
          event,
        ),
      ),
      second: channel.sink.close,
    );
  }
}

@riverpod
DownloadsRepository downloadsRepository(DownloadsRepositoryRef ref) =>
    DownloadsRepository(ref.watch(dioClientKeyProvider));

@riverpod
class DownloadsSocket extends _$DownloadsSocket {
  @override
  Stream<Downloads> build() {
    final pair = ref.watch(downloadsRepositoryProvider).socketDownloads();
    ref.onDispose(pair.second);
    return pair.first;
  }
}

@riverpod
Map<int, DownloadsQueue> downloadsMap(DownloadsMapRef ref) {
  final downloads = ref.watch(downloadsSocketProvider);
  return {
    for (DownloadsQueue element in [...?downloads.valueOrNull?.queue])
      element.chapter?.id ?? -1: element
  };
}

@riverpod
DownloadsQueue? downloadsFromId(DownloadsFromIdRef ref, int chapterId) =>
    ref.watch(downloadsMapProvider.select((value) => value[chapterId]));
