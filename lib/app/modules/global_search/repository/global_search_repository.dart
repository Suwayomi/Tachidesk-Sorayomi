import 'package:get/get.dart';

import '../../../data/providers/source_provider.dart';
import '../../../data/source_model.dart';

class GlobalSearchRepository {
  final SourceProvider _sourceProvider = Get.put(SourceProvider());

  Future<List<Source>?> getSourceList() => _sourceProvider.getSourceList();

  Future<Map<String, dynamic>?> getSourceMangaList({
    required String sourceId,
    required String query,
  }) =>
      _sourceProvider.getSourceMangaList(
        sourceId: sourceId,
        pageNum: 1,
        query: query,
      );
}
