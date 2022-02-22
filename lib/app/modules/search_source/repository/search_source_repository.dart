import 'package:get/get.dart';

import '../../../data/providers/source_provider.dart';
import '../../../data/source_manga_list_model.dart';
import '../../../data/source_model.dart';

class SearchSourceRepository {
  final SourceProvider _sourceProvider = Get.put(SourceProvider());

  Future<SourceMangaList?> getSourceSearch({
    required String sourceId,
    required int pageNum,
    required String searchTerm,
  }) =>
      _sourceProvider.getSourceSearch(
        sourceId: sourceId,
        pageNum: pageNum,
        searchTerm: searchTerm,
      );

  Future<Source?> getSource({required String sourceId}) =>
      _sourceProvider.getSource(sourceId: sourceId);
}
