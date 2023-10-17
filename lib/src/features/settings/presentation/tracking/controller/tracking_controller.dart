// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../utils/mixin/state_provider_mixin.dart';
import '../../../data/tracking/tracking_repository.dart';
import '../../../domain/tracking/tracking_model.dart';

part 'tracking_controller.g.dart';

@riverpod
Future<List<Tracker>?> trackerList(TrackerListRef ref) async {
  final token = CancelToken();
  ref.onDispose(token.cancel);

  final result = await ref
      .watch(trackingRepositoryProvider)
      .getTrackerList(cancelToken: token);
  return result;
}

@riverpod
Future<List<TrackSearch>?> trackSearchWithId(
   TrackSearchWithIdRef ref, {
  required int trackerId,
}) async {
  final token = CancelToken();
  ref.onDispose(token.cancel);

  final title = ref.watch(trackSearchQueryProvider);
  final result =
      await ref.watch(trackingRepositoryProvider).search(trackerId, title);
  return result;
}

@riverpod
class TrackSearchQuery extends _$TrackSearchQuery with StateProviderMixin<String> {
  @override
  String build() => "";
}