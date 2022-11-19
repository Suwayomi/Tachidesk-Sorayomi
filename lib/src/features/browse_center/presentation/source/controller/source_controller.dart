// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 🌎 Project imports:
import '../../../../../utils/extensions/custom_extensions/async_value_extensions.dart';
import '../../../../../constants/db_keys.dart';
import '../../../../../utils/storage/local/shared_preferences_client.dart';
import '../../../data/source_repository/source_repository.dart';
import '../../../domain/source/source_model.dart';

part 'source_controller.g.dart';

@riverpod
Future<List<Source>?> sourceList(SourceListRef ref) async {
  final token = CancelToken();
  ref.onDispose(token.cancel);
  final result = await ref
      .watch(sourceRepositoryProvider)
      .getSourceList(cancelToken: token);
  ref.keepAlive();
  return result;
}

@riverpod
AsyncValue<Map<String, List<Source>>> sourceMap(SourceMapRef ref) {
  final sourceMap = <String, List<Source>>{};
  final sourceListData = ref.watch(sourceListProvider);
  final sourceLastUsed = ref.watch(sourceLastUsedProvider);
  for (final e in [...?sourceListData.valueOrNull]) {
    sourceMap.update(
      e.lang?.code ?? "other",
      (value) => [...value, e],
      ifAbsent: () => [e],
    );
    if (e.id == sourceLastUsed) sourceMap["lastUsed"] = [e];
  }
  return sourceListData.copyWithData((e) => sourceMap);
}

@riverpod
AsyncValue<Map<String, List<Source>>?> sourceMapFiltered(
    SourceMapFilteredRef ref) {
  final sourceMapFiltered = <String, List<Source>>{};
  final sourceMapData = ref.watch(sourceMapProvider);
  final sourceMap = {...?sourceMapData.valueOrNull};
  final enabledLangList = [...?ref.watch(sourceLanguageFilterProvider)];
  for (final e in enabledLangList) {
    if (sourceMap.containsKey(e)) sourceMapFiltered[e] = sourceMap[e]!;
  }
  return sourceMapData.copyWithData((e) => sourceMapFiltered);
}

@riverpod
class SourceLanguageFilter extends _$SourceLanguageFilter
    with SharedPreferenceClient<List<String>> {
  @override
  List<String>? build() => initialize(
        client: ref.watch(sharedPreferencesProvider),
        key: DBKeys.sourceLanguageFilter.name,
        initial: DBKeys.sourceLanguageFilter.initial,
      );
}

@riverpod
class SourceLastUsed extends _$SourceLastUsed
    with SharedPreferenceClient<String> {
  @override
  String? build() => initialize(
        client: ref.watch(sharedPreferencesProvider),
        key: DBKeys.sourceLastUsed.name,
        initial: DBKeys.sourceLastUsed.initial,
      );
}
