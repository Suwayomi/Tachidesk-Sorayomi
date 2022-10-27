// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';

// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import 'package:tachidesk_sorayomi/src/constants/enum.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/string_extensions.dart';
import '../../../constants/endpoints.dart';

class DioNetworkModule {
  /// A singleton dio provider.
  ///
  /// Calling it multiple times will return the same instance.
  Dio provideDio({
    required String baseUrl,
    required AuthType authType,
    String? credentials,
  }) {
    final dio = Dio();

    dio
      ..options.baseUrl = Endpoints.baseApi(baseUrl: baseUrl)
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            if (authType == AuthType.basic) {
              if (credentials.isNotBlank) {
                options.headers.putIfAbsent(
                  "Authorization",
                  () => credentials,
                );
              } else {
                if (kDebugMode) {
                  print('credential is null');
                }
              }
            }
            return handler.next(options);
          },
        ),
      )
      ..interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
      ));

    return dio;
  }
}

final networkModuleProvider =
    Provider<DioNetworkModule>((ref) => DioNetworkModule());
