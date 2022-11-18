// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🎯 Dart imports:
import 'dart:convert';

// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';

// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 🌎 Project imports:
import '../../../constants/endpoints.dart';
import '../../../constants/enum.dart';
import '../../extensions/custom_extensions/string_extensions.dart';

part 'network_module.g.dart';

// Must be top-level function
_parseAndDecode(String response) => jsonDecode(response);

parseJson(String text) => compute(_parseAndDecode, text);

class DioNetworkModule {
  Dio provideDio({
    required String baseUrl,
    required AuthType authType,
    String? credentials,
  }) {
    final dio = Dio();
    (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
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
      );
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
        logPrint: (e) => debugPrint(e.toString()),
      ));
    }

    return dio;
  }
}

@riverpod
DioNetworkModule networkModule(ref) => DioNetworkModule();
