// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../constants/db_keys.dart';
import '../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../utils/mixin/shared_preferences_client_mixin.dart';
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
List<String> sourceFilterLangList(SourceFilterLangListRef ref) {
  return [
    ...?(ref.watch(sourceMapProvider).valueOrNull
          ?..remove("localsourcelang")
          ..remove("lastUsed"))
        ?.keys
  ]..sort();
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
List<Source>? sourceQuery(SourceQueryRef ref, {String? query}) {
  final sourceMap = {...?ref.watch(sourceMapFilteredProvider).valueOrNull}
    ..remove('lastUsed');
  if (query.isNotBlank) {
    return sourceMap.values
        .expand((list) => list.where(
              (element) => element.name.query(query),
            ))
        .toList();
  }
  return sourceMap.values.expand((list) => list).toList();
}

@riverpod
class SourceLanguageFilter extends _$SourceLanguageFilter
    with SharedPreferenceClientMixin<List<String>> {
  @override
  List<String>? build() => initialize(
        ref,
        key: DBKeys.sourceLanguageFilter.name,
        initial: DBKeys.sourceLanguageFilter.initial,
      );
}

@riverpod
class SourceLastUsed extends _$SourceLastUsed
    with SharedPreferenceClientMixin<String> {
  @override
  String? build() => initialize(
        ref,
        key: DBKeys.sourceLastUsed.name,
        initial: DBKeys.sourceLastUsed.initial,
      );
}
