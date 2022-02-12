import 'package:get/get_connect.dart';

import '../providers/downloads_provider.dart';

class DownloadsRepository {
  static final DownloadsProvider _downloadsProvider = DownloadsProvider();

  static Future<int?> startDownloads() => _downloadsProvider.startDownloads();
  static Future<int?> stopDownloads() => _downloadsProvider.stopDownloads();
  static Future<int?> clearDownloads() => _downloadsProvider.clearDownloads();
  static GetSocket socketDownloads() => _downloadsProvider.socketDownloads();
}
