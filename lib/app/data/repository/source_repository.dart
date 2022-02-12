import '../../core/enums/source_type.dart';
import '../providers/source_provider.dart';
import '../source_manga_list_model.dart';
import '../source_model.dart';

class SourceRepository {
  static final SourceProvider _sourceProvider = SourceProvider();

  static Future<List<Source>?> getSourceList() => _sourceProvider.getSourceList();

  static Future<SourceMangaList?> getSourceMangaList({
    required String sourceId,
    required int pageNum,
    required SourceType sourceType,
  }) =>
      _sourceProvider.getSourceMangaList(
        sourceId: sourceId,
        pageNum: pageNum,
        sourceType: sourceType,
      );

  static Future<SourceMangaList?> getSourceSearch({
    required String sourceId,
    required int pageNum,
    required String searchTerm,
  }) =>
      _sourceProvider.getSourceSearch(
        sourceId: sourceId,
        pageNum: pageNum,
        searchTerm: searchTerm,
      );

  static Future<Source?> getSource({required String sourceId}) =>
      _sourceProvider.getSource(sourceId: sourceId);
}
