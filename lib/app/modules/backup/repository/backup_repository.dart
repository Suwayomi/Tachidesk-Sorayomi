import 'dart:io';

import 'package:get/get.dart';

import '../../../data/providers/restore_provider.dart';

class BackupRepository {
  final RestoreProvider _restoreProvider = Get.put(RestoreProvider());

  Future<Response<dynamic>> postRestore(File file) =>
      _restoreProvider.postRestore(file);
}
