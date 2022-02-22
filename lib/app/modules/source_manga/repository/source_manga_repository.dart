import 'package:get/get.dart';

import '../../../data/enums/source_type.dart';
import '../../../data/providers/source_provider.dart';
import '../../../data/source_manga_list_model.dart';
import '../../../data/source_model.dart';

class SourceMangaRepository {
  final SourceProvider _sourceProvider = Get.put(SourceProvider());

  Future<SourceMangaList?> getSourceMangaList({
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
}
