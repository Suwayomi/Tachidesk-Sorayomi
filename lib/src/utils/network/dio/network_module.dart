// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../constants/endpoints.dart';

class DioNetworkModule {
  /// A singleton dio provider.
  ///
  /// Calling it multiple times will return the same instance.
  Dio provideDio() {
    final dio = Dio();

    dio
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
      ));

    return dio;
  }
}

final networkModuleProvider =
    Provider<DioNetworkModule>((ref) => DioNetworkModule());
