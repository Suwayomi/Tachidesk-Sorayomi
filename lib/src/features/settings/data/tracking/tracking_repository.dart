// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../constants/endpoints.dart';
import '../../../../global_providers/global_providers.dart';
import '../../../../utils/storage/dio/dio_client.dart';
import '../../domain/tracking/tracking_model.dart';

part 'tracking_repository.g.dart';

class TrackingRepository {
  const TrackingRepository(this.dioClient);

  final DioClient dioClient;

  Future<List<Tracker>?> getTrackerList({
    CancelToken? cancelToken,
  }) async =>
      (await dioClient.get<List<Tracker>, Tracker>(
        TrackingUrl.list,
        cancelToken: cancelToken,
        decoder: (e) =>
            e is Map<String, dynamic> ? Tracker.fromJson(e) : Tracker(),
      ))
          .data;

  Future<void> login(int trackerId, String url) =>
      dioClient.post(TrackingUrl.login,
          data: jsonEncode({
            'trackerId': trackerId,
            'callbackUrl': url,
          }));

  Future<void> logout(int trackerId) => dioClient.post(TrackingUrl.logout,
      data: jsonEncode({
        'trackerId': trackerId,
      }));

  Future<List<TrackSearch>?> search(int trackerId, String title) async =>
      (await dioClient.post<List<TrackSearch>, TrackSearch>(
        TrackingUrl.search,
        data: jsonEncode({
          'trackerId': trackerId,
          'title': title,
        }),
        decoder: (e) =>
            e is Map<String, dynamic> ? TrackSearch.fromJson(e) : TrackSearch(),
      ))
          .data;

  Future<void> bind(int mangaId, TrackSearch trackSearch) => dioClient.post(
        TrackingUrl.bind,
        queryParameters: {
          "mangaId": mangaId,
        },
        data: jsonEncode(trackSearch.toJson()),
      );

  Future<void> update(TrackUpdate trackUpdate) => dioClient
      .post(TrackingUrl.update, data: jsonEncode(trackUpdate.toJson()));
}

@riverpod
TrackingRepository trackingRepository(TrackingRepositoryRef ref) =>
    TrackingRepository(ref.watch(dioClientKeyProvider));
