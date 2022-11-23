// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 🌎 Project imports:
import '../../../../constants/endpoints.dart';
import '../../../../constants/enum.dart';
import '../../../../global_providers/global_providers.dart';
import '../../../../utils/storage/dio/dio_client.dart';
import '../../domain/manga_page/manga_page.dart';
import '../../domain/source/source_model.dart';

part 'source_repository.g.dart';

class SourceRepository {
  final DioClient dioClient;

  SourceRepository(this.dioClient);

  Future<List<Source>?> getSourceList({CancelToken? cancelToken}) async =>
      (await dioClient.get<List<Source>, Source>(
        SourceUrl.sourceList,
        decoder: (e) =>
            e is Map<String, dynamic> ? Source.fromJson(e) : Source(),
        cancelToken: cancelToken,
      ))
          .data;

  Future<MangaPage?> getMangaList({
    required String sourceId,
    required SourceType sourceType,
    required int pageNum,
    CancelToken? cancelToken,
  }) async =>
      (await dioClient.get<MangaPage, MangaPage?>(
        SourceUrl.getMangaList(sourceId, sourceType, pageNum),
        decoder: (e) =>
            e is Map<String, dynamic> ? MangaPage.fromJson(e) : null,
        cancelToken: cancelToken,
      ))
          .data;

  Future<Source?> getSource(
          {required String sourceId, CancelToken? cancelToken}) async =>
      (await dioClient.get<Source, Source>(
        SourceUrl.withId(sourceId),
        decoder: (e) =>
            e is Map<String, dynamic> ? Source.fromJson(e) : Source(),
        cancelToken: cancelToken,
      ))
          .data;
}

@riverpod
SourceRepository sourceRepository(ref) =>
    SourceRepository(ref.watch(dioClientKeyProvider));
