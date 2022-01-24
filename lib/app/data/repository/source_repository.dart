import '../providers/source_provider.dart';
import '../source_model.dart';

class SourceRepository {
  final SourceProvider _sourceProvider = SourceProvider();

  Future<List<Source>?> getSourceList() => _sourceProvider.getSourceList();
}
