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
import '../../../../../utils/extensions/custom_extensions/string_extensions.dart';
import '../../../../../utils/storage/local/shared_preferences_client.dart';
import '../../../../settings/presentation/browse/widgets/show_nsfw_switch/show_nsfw_switch.dart';
import '../../../data/extension_repository/extension_repository.dart';
import '../../../domain/extension/extension_model.dart';
import '../../browse/controller/browse_controller.dart';

part 'extension_controller.g.dart';

@riverpod
Future<List<Extension>?> extensionController(ExtensionControllerRef ref) async {
  final token = CancelToken();
  ref.onDispose(token.cancel);
  final result = await ref
      .watch(extensionRepositoryProvider)
      .getExtensionList(cancelToken: token);
  ref.keepAlive();
  return result;
}

@riverpod
Map<String, List<Extension>> extensionMap(ExtensionMapRef ref) {
  final extensionMap = <String, List<Extension>>{};
  final extensionList =
      ref.watch(extensionControllerProvider).asData?.value ?? <Extension>[];
  final showNsfw = ref.watch(showNSFWProvider) ?? true;
  for (final e in extensionList) {
    if (!showNsfw && (e.isNsfw ?? false)) continue;
    if (e.installed ?? false) {
      if (e.hasUpdate ?? false) {
        extensionMap.update(
          "update",
          (value) => [...value, e],
          ifAbsent: () => [e],
        );
      } else {
        extensionMap.update(
          "installed",
          (value) => [...value, e],
          ifAbsent: () => [e],
        );
      }
    } else {
      extensionMap.update(
        e.lang?.code ?? "other",
        (value) => [...value, e],
        ifAbsent: () => [e],
      );
    }
  }
  return extensionMap;
}

@riverpod
class ExtensionLanguageFilter extends _$ExtensionLanguageFilter
    with SharedPreferenceClient<List<String>> {
  @override
  List<String>? build() => initialize(
        client: ref.watch(sharedPreferencesProvider),
        key: DBKeys.extensionLanguageFilter.name,
        initial: DBKeys.extensionLanguageFilter.initial,
      );
}

@riverpod
Map<String, List<Extension>> extensionMapFiltered(ExtensionMapFilteredRef ref) {
  final extensionMapFiltered = <String, List<Extension>>{};
  final extensionMap = ref.watch(extensionMapProvider);
  final enabledLangList = ref.watch(extensionLanguageFilterProvider) ?? [];
  for (final e in enabledLangList) {
    if (extensionMap.containsKey(e)) extensionMapFiltered[e] = extensionMap[e]!;
  }
  return extensionMapFiltered;
}

@riverpod
Map<String, List<Extension>> extensionMapFilteredAndQueried(
  ExtensionMapFilteredAndQueriedRef ref,
) {
  final extensionMap = ref.watch(extensionMapFilteredProvider);
  if (!ref.watch(browseScreenShowSearchProvider)) return extensionMap;
  final query = ref.watch(extensionQueryProvider);
  return extensionMap.map<String, List<Extension>>(
    (key, value) => MapEntry(
      key,
      value.where((element) => element.name.query(query)).toList(),
    ),
  );
}

@riverpod
class ExtensionQuery extends _$ExtensionQuery {
  @override
  String? build() => null;
}
