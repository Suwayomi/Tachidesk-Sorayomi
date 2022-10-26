import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tachidesk_sorayomi/src/features/browse/data/source_repository.dart';

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
  for (var e in sourceList) {
    sourceMap.update(
      e.lang ?? "other",
      (value) => [...value, e],
      ifAbsent: () => [e],
    );
  }
  return sourceMap;
});
