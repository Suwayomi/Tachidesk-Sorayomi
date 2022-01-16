import 'package:get/get_connect.dart';

import '../providers/downloads_provider.dart';

class DownloadsRepository {
  static final DownloadsProvider _downloadsProvider = DownloadsProvider();

  Future<int?> startDownloads() => _downloadsProvider.startDownloads();
  Future<int?> stopDownloads() => _downloadsProvider.stopDownloads();
  Future<int?> clearDownloads() => _downloadsProvider.clearDownloads();
  GetSocket socketDownloads() => _downloadsProvider.socketDownloads();
}
