import 'dart:async';

import 'package:http/http.dart' as http;

/// An [http.BaseClient] that applies a timeout to every request.
class TimeoutHttpClient extends http.BaseClient {
  TimeoutHttpClient(
    this.timeout, {
    this.retries = 0,
    this.retryDelay = const Duration(seconds: 1),
  });

  /// The timeout duration for each request.
  final Duration timeout;
  final int retries;
  final Duration retryDelay;

  final http.Client _inner = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    int attempt = 0;
    while (true) {
      try {
        return await _inner.send(request).timeout(timeout);
      } on TimeoutException {
        if (attempt >= retries) rethrow;
        attempt++;
        await Future.delayed(retryDelay);
      }
    }
  }

  @override
  void close() {
    _inner.close();
    super.close();
  }
}
