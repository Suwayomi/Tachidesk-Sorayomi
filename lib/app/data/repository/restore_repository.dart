import 'dart:io';

import 'package:get/get_connect.dart';

import '../providers/restore_provider.dart';

class RestoreRepository {
  static final RestoreProvider _restoreProvider = RestoreProvider();

  Future<Response<dynamic>> postRestore(File file) {
    final res = _restoreProvider.postRestore(file);
    return res;
  }
}
