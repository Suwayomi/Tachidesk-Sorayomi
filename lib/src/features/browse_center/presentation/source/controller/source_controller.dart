// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 🌎 Project imports:
import '../../../../../constants/db_keys.dart';
import '../../../../../utils/storage/local/shared_preferences_client.dart';
import '../../../data/source_repository/source_repository.dart';
import '../../../domain/source/source_model.dart';

part 'source_controller.g.dart';

@riverpod
Future<List<Source>?> sourceController(SourceControllerRef ref) async {
  final token = CancelToken();
  final result = await ref
      .watch(sourceRepositoryProvider)
      .getSourceList(cancelToken: token);
  ref.keepAlive();
  ref.onDispose(token.cancel);
  return result;
}

@riverpod
Map<String, List<Source>> sourceMap(SourceMapRef ref) {
  final sourceMap = <String, List<Source>>{};
  final sourceList =
      ref.watch(sourceControllerProvider).asData?.value ?? <Source>[];
  final sourceLastUsed = ref.watch(sourceLastUsedProvider);
  for (final e in sourceList) {
    sourceMap.update(
      e.lang?.code ?? "other",
      (value) => [...value, e],
      ifAbsent: () => [e],
    );
    if (e.id == sourceLastUsed) sourceMap["lastUsed"] = [e];
  }
  return sourceMap;
}

@riverpod
Map<String, List<Source>> sourceMapFiltered(SourceMapFilteredRef ref) {
  final sourceMapFiltered = <String, List<Source>>{};
  final sourceMap = ref.watch(sourceMapProvider);
  final enabledLangList = ref.watch(sourceLanguageFilterProvider) ?? [];
  for (final e in enabledLangList) {
    if (sourceMap.containsKey(e)) sourceMapFiltered[e] = sourceMap[e]!;
  }
  return sourceMapFiltered;
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
