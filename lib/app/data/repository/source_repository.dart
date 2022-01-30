import '../../core/enums/source_type.dart';
import '../providers/source_provider.dart';
import '../source_manga_list_model.dart';
import '../source_model.dart';

class SourceRepository {
  final SourceProvider _sourceProvider = SourceProvider();

  Future<List<Source>?> getSourceList() => _sourceProvider.getSourceList();

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
