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
import '../../../../constants/endpoints.dart';
import '../../../../global_providers/global_providers.dart';
import '../../../../utils/classes/pair/pair_model.dart';
import '../../../../utils/misc/custom_typedef.dart';
import '../../../../utils/storage/dio/dio_client.dart';
import '../../domain/chapter_page/chapter_page_model.dart';
import '../../domain/update_status/update_status_model.dart';

part 'updates_repository.g.dart';

class UpdatesRepository {
  const UpdatesRepository(this.dioClient);

  final DioClient dioClient;
  // Downloads

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
              (s) => UpdateStatus.fromJson({...?json.decode(s)["statusMap"]}),
              event)),
      second: channel.sink.close,
    );
  }
}

@riverpod
UpdatesRepository updatesRepository(UpdatesRepositoryRef ref) =>
    UpdatesRepository(ref.watch(dioClientKeyProvider));

@riverpod
Future<UpdateStatus?> updateSummary(UpdateSummaryRef ref) async {
  final token = CancelToken();
  ref.onDispose(token.cancel);
  final result = await ref
      .watch(updatesRepositoryProvider)
      .summaryUpdates(cancelToken: token);
  return result;
}

//TODO SUPPORT FOR RIVERPOD STREAM GENERATOR https://github.com/rrousselGit/riverpod/issues/1663
final updatesSocketProvider = StreamProvider.autoDispose<UpdateStatus>((ref) {
  final pair = ref.watch(updatesRepositoryProvider).socketUpdates();
  ref.onDispose(pair.second);
  return pair.first;
});
