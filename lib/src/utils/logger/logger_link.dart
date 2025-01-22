import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';

class LoggerLink extends Link {
  @override
  Stream<Response> request(
    Request request, [
    NextLink? forward,
  ]) {
    Stream<Response> response = forward!(request).map((Response fetchResult) {
      if (kDebugMode) {
        debugPrint("Request: $request");
        debugPrint("Response: ${fetchResult.data ?? "null"}");
      }
      return fetchResult;
    }).handleError((error) {
      throw error;
    });

    return response;
  }

  LoggerLink();
}
