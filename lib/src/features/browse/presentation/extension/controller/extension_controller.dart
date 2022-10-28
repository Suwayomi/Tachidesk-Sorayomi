// 📦 Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import 'package:tachidesk_sorayomi/src/features/settings/presentation/browse/show_nsfw_switch.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/string_extensions.dart';
import '../../../../../constants/db_keys.dart';
import '../../../../../utils/storage/local/shared_preferences_client.dart';
import '../../../data/extension_repository.dart';
import '../../../domain/extension/extension_model.dart';

class ExtensionControllerNotifier
    extends StateNotifier<AsyncValue<List<Extension>?>> {
  ExtensionControllerNotifier(this.extensionRepository)
      : super(const AsyncData(null));
  final ExtensionRepository extensionRepository;

  Future<void> loadExtensions() async {
    if (state.asData?.value == null) state = const AsyncLoading();
    state =
        await AsyncValue.guard(() => extensionRepository.getExtensionList());
  }
}

final extensionControllerProvider = StateNotifierProvider<
    ExtensionControllerNotifier, AsyncValue<List<Extension>?>>(
  (ref) => ExtensionControllerNotifier(ref.watch(extensionRepositoryProvider)),
);

final extensionMapProvider = Provider<Map<String, List<Extension>>>((ref) {
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
});

final extensionLanguageFilterProvider = StateNotifierProvider<
    SharedPreferenceNotifier<List<String>>, List<String>?>(
  (ref) {
    final client = ref.watch(sharedPreferencesProvider);
    final initial = client.getStringList(DBKeys.extensionLanguageFilter.name);
    return SharedPreferenceNotifier<List<String>>(
      client: client,
      key: DBKeys.extensionLanguageFilter.name,
      initial: initial ?? DBKeys.extensionLanguageFilter.initial,
    );
  },
);

final extensionMapFilteredProvider =
    Provider<Map<String, List<Extension>>>((ref) {
  final extensionMapFiltered = <String, List<Extension>>{};
  final extensionMap = ref.watch(extensionMapProvider);
  final enabledLangList = ref.watch(extensionLanguageFilterProvider) ?? [];
  for (final e in enabledLangList) {
    if (extensionMap.containsKey(e)) extensionMapFiltered[e] = extensionMap[e]!;
  }
  return extensionMapFiltered;
});

final extensionSearchProvider = StateProvider<String?>((ref) => null);

final extensionMapFilteredAndQueriedProvider =
    Provider<Map<String, List<Extension>>>((ref) {
  final extensionMap = ref.watch(extensionMapFilteredProvider);
  final query = ref.watch(extensionSearchProvider);
  return extensionMap.map<String, List<Extension>>(
    (key, value) => MapEntry(
      key,
      value.where((element) => element.name.query(query)).toList(),
    ),
  );
});
