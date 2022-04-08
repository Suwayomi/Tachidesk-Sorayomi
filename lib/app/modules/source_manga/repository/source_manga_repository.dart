import 'package:get/get.dart';

import '../../../data/enums/source_type.dart';
import '../../../data/manga_list_model.dart';
import '../../../data/providers/source_provider.dart';
import '../../../data/source_model.dart';

class SourceMangaRepository {
  final SourceProvider _sourceProvider = Get.put(SourceProvider());

  Future<MangaListModel?> getSourceMangaList({
    required String sourceId,
    required int pageNum,
    required SourceType sourceType,
    bool isFilter = false,
  }) =>
      _sourceProvider.getSourceMangaList(
        sourceId: sourceId,
        pageNum: pageNum,
        sourceType: sourceType,
        isFilter: isFilter,
      );

  Future<Source?> getSource({required String sourceId}) =>
      _sourceProvider.getSource(sourceId: sourceId);

  Future<List<Map<String, dynamic>>> getSourceFilter(
          {required String sourceId, bool isReset = false}) =>
      _sourceProvider.getSourceFilter(sourceId: sourceId, isReset: isReset);

  Future<void> postSourceFilter({
    required String sourceId,
    required List<Map<String, dynamic>> filter,
  }) =>
      _sourceProvider.postSourceFilter(
        sourceId: sourceId,
        sourceFilter: filter,
      );
}
