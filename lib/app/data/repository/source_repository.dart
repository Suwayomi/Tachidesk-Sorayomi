import 'package:tachidesk_flutter/app/data/providers/source_provider.dart';
import 'package:tachidesk_flutter/app/data/source_model.dart';

class SourceRepository {
  final SourceProvider _sourceProvider = SourceProvider();

  Future<List<Source>?> getSourceList() => _sourceProvider.getSourceList();
}
