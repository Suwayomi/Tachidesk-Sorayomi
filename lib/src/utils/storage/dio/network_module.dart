// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';

// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 🌎 Project imports:
import 'package:tachidesk_sorayomi/src/constants/enum.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/string_extensions.dart';
import '../../../constants/endpoints.dart';

part 'network_module.g.dart';

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
        request: kDebugMode,
        responseHeader: kDebugMode,
        responseBody: kDebugMode,
        requestHeader: kDebugMode,
        requestBody: kDebugMode,
      ));

    return dio;
  }
}

@riverpod
DioNetworkModule networkModule(ref) => DioNetworkModule();
