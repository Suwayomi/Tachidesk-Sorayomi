import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../../core/values/api_url.dart';
import '../services/local_storage_service.dart';

class DownloadsProvider extends GetConnect {
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();

  @override
  void onInit() {
    httpClient.baseUrl = _localStorageService.baseURL + downloadsURL;
    httpClient.timeout = Duration(minutes: 5);
    httpClient.addAuthenticator((Request request) async {
      final token = _localStorageService.basicAuth;
      // Set the header
      request.headers['Authorization'] = token;
      return request;
    });
  }

  Future<Response> startDownloads() async {
    final response = await get('/start');
    return response;
  }

  Future<Response> stopDownloads() async {
    final response = await get('/stop');
    return response;
  }

  Future<Response> clearDownloads() async {
    final response = await get('/clear');
    return response;
  }

  GetSocket socketDownloads() {
    final _socket = GetSocket(
      httpClient.baseUrl!.replaceFirst(RegExp("http"), "ws"),
      allowSelfSigned: false,
    );
    sockets.add(_socket);
    _socket.onOpen(() {});
    _socket.connect();
    return _socket;
  }
}
