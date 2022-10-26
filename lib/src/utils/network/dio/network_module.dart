import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tachidesk_sorayomi/src/constants/endpoints.dart';

class DioNetworkModule {
  /// A singleton dio provider.
  ///
  /// Calling it multiple times will return the same instance.
  Dio provideDio() {

    final dio = Dio();

    dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.headers = {
        'Content-Type': 'application/json; charset=utf-8',
      }
      ..interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
      ));

    return dio;
  }
}

final networkModuleProvider =
    Provider<DioNetworkModule>((ref) => DioNetworkModule());
