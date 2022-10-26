import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tachidesk_sorayomi/src/features/about/domain/about/about_model.dart';

import '../../../data/about_repository.dart';

class AboutControllerNotifier extends StateNotifier<AsyncValue<About?>> {
  AboutControllerNotifier(this.aboutRepository) : super(const AsyncData(null));

  final AboutRepository aboutRepository;

  Future<void> updateAbout() async {
    if (state.asData?.value == null) state = const AsyncLoading();
    state = await AsyncValue.guard(() => aboutRepository.getAbout());
  }
}

final aboutControllerProvider =
    StateNotifierProvider<AboutControllerNotifier, AsyncValue<About?>>(
  (ref) => AboutControllerNotifier(ref.watch(aboutRepositoryProvider)),
);
