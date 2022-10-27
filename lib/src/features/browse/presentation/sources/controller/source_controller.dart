// 📦 Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../../../constants/db_keys.dart';
import '../../../../../utils/storage/local/shared_preferences_client.dart';
import '../../../data/source_repository.dart';
import '../../../domain/source/source_model.dart';

class SourceControllerNotifier
    extends StateNotifier<AsyncValue<List<Source>?>> {
  SourceControllerNotifier(this.sourceRepository)
      : super(const AsyncData(null));
  final SourceRepository sourceRepository;

  Future<void> loadSources() async {
    if (state.asData?.value == null) state = const AsyncLoading();
    state = await AsyncValue.guard(() => sourceRepository.getSourceList());
  }
}

final sourceControllerProvider =
    StateNotifierProvider<SourceControllerNotifier, AsyncValue<List<Source>?>>(
  (ref) => SourceControllerNotifier(ref.watch(sourceRepositoryProvider)),
);

final sourceMapProvider = Provider<Map<String, List<Source>>>((ref) {
  final sourceMap = <String, List<Source>>{};
  final sourceList =
      ref.watch(sourceControllerProvider).asData?.value ?? <Source>[];
  final sourceLastUsed = ref.watch(sourceLastUsedProvider);
  for (var e in sourceList) {
    sourceMap.update(
      e.lang?.code ?? "other",
      (value) => [...value, e],
      ifAbsent: () => [e],
    );
    if (e.id == sourceLastUsed) sourceMap["lastUsed"] = [e];
  }
  return sourceMap;
});

final sourceLanguageFilterProvider = StateNotifierProvider<
    SharedPreferenceNotifier<List<String>>, List<String>?>(
  (ref) {
    final client = ref.watch(sharedPreferencesProvider);
    final initial = client.getStringList(DBKeys.sourceLanguageFilter.name);
    return SharedPreferenceNotifier<List<String>>(
      client: client,
      key: DBKeys.sourceLanguageFilter.name,
      initial: initial ?? DBKeys.sourceLanguageFilter.initial,
    );
  },
);

final sourceMapFilteredProvider = Provider<Map<String, List<Source>>>((ref) {
  final sourceMapFiltered = <String, List<Source>>{};
  final sourceMap = ref.watch(sourceMapProvider);
  final enabledLangList = ref.watch(sourceLanguageFilterProvider) ?? [];
  for (var e in enabledLangList) {
    if (sourceMap.containsKey(e)) sourceMapFiltered[e] = sourceMap[e]!;
  }
  // print("sourceMapFiltered ${sourceMapFiltered}");
  return sourceMapFiltered;
});

final sourceLastUsedProvider =
    StateNotifierProvider<SharedPreferenceNotifier<String>, String?>(
  (ref) {
    final client = ref.watch(sharedPreferencesProvider);
    final initial = client.getString(DBKeys.sourceLastUsed.name);
    return SharedPreferenceNotifier<String>(
      client: client,
      key: DBKeys.sourceLastUsed.name,
      initial: initial ?? DBKeys.sourceLastUsed.initial,
    );
  },
);
