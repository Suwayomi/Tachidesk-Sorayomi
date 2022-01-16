import 'package:get/get.dart';

import '../../../main.dart';
import '../../core/constants/api_url.dart';

class DownloadsProvider extends GetConnect {
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();

  Future<int?> startDownloads() async {
    final response =
        await get(_localStorageService.baseURL + downloadsURL + '/start');
    return response.statusCode;
  }

  Future<int?> stopDownloads() async {
    final response =
        await get(_localStorageService.baseURL + downloadsURL + '/stop');
    return response.statusCode;
  }

  Future<int?> clearDownloads() async {
    final response =
        await get(_localStorageService.baseURL + downloadsURL + '/clear');
    return response.statusCode;
  }

  GetSocket socketDownloads() {
    final _socket = GetSocket(
      (_localStorageService.baseURL + downloadsURL)
          .replaceFirst(RegExp("http"), "ws"),
      allowSelfSigned: false,
    );
    sockets.add(_socket);
    _socket.onOpen(() {});
    _socket.connect();
    return _socket;
  }
}
