// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../constants/endpoints.dart';
import '../../../../constants/enum.dart';
import '../../../../global_providers/global_providers.dart';
import '../../../../utils/storage/dio/dio_client.dart';
import '../../domain/filter/filter_model.dart';
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
    String? query,
    List<Map<String, dynamic>>? filter,
    CancelToken? cancelToken,
  }) async {
    if (sourceType != SourceType.filter) {
      return (await dioClient.get<MangaPage, MangaPage?>(
        SourceUrl.getMangaList(sourceId, sourceType.name, pageNum),
        decoder: (e) =>
            e is Map<String, dynamic> ? MangaPage.fromJson(e) : null,
        cancelToken: cancelToken,
      ))
          .data;
    } else {
      return (await dioClient.post<MangaPage, MangaPage?>(
        SourceUrl.quickSearch(sourceId),
        queryParameters: {
          "pageNum": pageNum,
        },
        data: {
          "searchTerm": query ?? "",
          "filter": [...?filter],
        },
        decoder: (e) =>
            e is Map<String, dynamic> ? MangaPage.fromJson(e) : null,
        cancelToken: cancelToken,
      ))
          .data;
    }
  }

  Future<List<Filter>?> getFilterList({
    required String sourceId,
  }) async =>
      (await dioClient.get<List<Filter>, Filter>(
        SourceUrl.filters(sourceId),
        decoder: (e) =>
            e is Map<String, dynamic> ? Filter.fromJson(e) : Filter(),
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
