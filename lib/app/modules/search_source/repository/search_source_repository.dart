import 'package:get/get.dart';

import '../../../data/providers/source_provider.dart';
import '../../../data/source_model.dart';

class SearchSourceRepository {
  final SourceProvider _sourceProvider = Get.put(SourceProvider());

  Future<Map<String, dynamic>?> getSourceMangaList({
    required String sourceId,
    required int pageNum,
    required String query,
  }) =>
      _sourceProvider.getSourceMangaList(
        sourceId: sourceId,
        pageNum: pageNum,
        query: query,
      );

  Future<Source?> getSource({required String sourceId}) =>
      _sourceProvider.getSource(sourceId: sourceId);
}
