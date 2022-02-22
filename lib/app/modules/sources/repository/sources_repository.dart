import 'package:get/get.dart';

import '../../../data/providers/source_provider.dart';
import '../../../data/source_model.dart';

class SourcesRepository {
  final SourceProvider _sourceProvider = Get.put(SourceProvider());

  Future<List<Source>?> getSourceList() => _sourceProvider.getSourceList();
}
