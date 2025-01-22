import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../utils/extensions/custom_extensions.dart';
import '../../../data/downloads/downloads_repository.dart';
import '../../../domain/downloads/downloads_model.dart';

part 'downloads_controller.g.dart';

@riverpod
Stream<DownloadUpdatesDto?> downloadUpdates(Ref ref) =>
    ref.watch(downloadsRepositoryProvider).downloadStatusSubscription();

@riverpod
Map<int, DownloadUpdateDto> downloadsMap(Ref ref) {
  final updates = ref.watch(downloadUpdatesProvider);
  return {
    for (final element in [...?updates.valueOrNull?.updates])
      element.download.chapter.id: element
  };
}

@riverpod
DownloadUpdateDto? downloadsFromId(Ref ref, int chapterId) =>
    ref.watch(downloadsMapProvider.select((map) => map[chapterId]));

@riverpod
List<int> downloadsChapterIds(Ref ref) {
  return ref.watch(downloadsMapProvider).keys.toList();
}

@riverpod
AsyncValue<DownloaderState?> downloadsStatus(Ref ref) {
  return ref.watch(downloadUpdatesProvider
      .select((value) => value.copyWithData((data) => data?.state)));
}

@riverpod
bool showDownloadsFAB(Ref ref) {
  final downloads = ref.watch(downloadUpdatesProvider);
  return (downloads.valueOrNull?.updates).isNotBlank &&
      downloads.valueOrNull!.updates.any(
        (element) =>
            element.download.state != DownloadState.ERROR ||
            element.download.tries != 3,
      );
}
