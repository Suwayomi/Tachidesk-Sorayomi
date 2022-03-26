import 'package:get/get.dart';

import '../../../data/enums/source_type.dart';
import '../../../data/providers/source_provider.dart';
import '../../../data/source_model.dart';

class SourceMangaRepository {
  final SourceProvider _sourceProvider = Get.put(SourceProvider());

  Future<Map<String, dynamic>?> getSourceMangaList({
    required String sourceId,
    required int pageNum,
    required SourceType sourceType,
  }) =>
      _sourceProvider.getSourceMangaList(
        sourceId: sourceId,
        pageNum: pageNum,
        sourceType: sourceType,
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
