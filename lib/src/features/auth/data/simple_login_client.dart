// Copyright (c) 2026 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:http/http.dart' as http;

/// Thrown when `POST /login.html` returns HTTP 200 (Suwayomi's way of
/// signalling invalid credentials — it re-renders the login HTML).
class SimpleLoginAuthFailure implements Exception {
  const SimpleLoginAuthFailure();
  @override
  String toString() => 'SimpleLoginAuthFailure: invalid username/password';
}

/// Thrown when the response shape is neither the 303-redirect-with-cookie
/// success path nor the 200-with-html failure path.
class SimpleLoginShapeFailure implements Exception {
  const SimpleLoginShapeFailure(this.message);
  final String message;
  @override
  String toString() => 'SimpleLoginShapeFailure: $message';
}

/// Talks to Suwayomi-Server's `simple_login` auth mode.
class SimpleLoginClient {
  SimpleLoginClient({http.Client? httpClient})
      : _http = httpClient ?? http.Client();

  final http.Client _http;

  /// POSTs username + password to `<serverBaseUrl>/login.html` and returns
  /// the value of the `Set-Cookie` header (typically
  /// `"JSESSIONID=<sessionId>"`) for the client to send on subsequent
  /// requests.
  ///
  /// Throws [SimpleLoginAuthFailure] on credential rejection, or
  /// [SimpleLoginShapeFailure] on any other server response.
  Future<String> login({
    required String serverBaseUrl,
    required String username,
    required String password,
  }) async {
    final uri = Uri.parse('$serverBaseUrl/login.html');
    final response = await _http.post(
      uri,
      headers: {
        'Content-Type':
            'application/x-www-form-urlencoded; charset=utf-8',
      },
      body: {'user': username, 'pass': password},
    );

    if (response.statusCode == 200) {
      // Server re-rendered the login page → bad credentials.
      throw const SimpleLoginAuthFailure();
    }
    if (response.statusCode != 303) {
      throw SimpleLoginShapeFailure(
          'unexpected status ${response.statusCode}');
    }
    final setCookie = response.headers['set-cookie'];
    if (setCookie == null || setCookie.isEmpty) {
      throw const SimpleLoginShapeFailure(
          '303 response had no Set-Cookie header');
    }
    // `Set-Cookie: JSESSIONID=abc; Path=/; HttpOnly` → keep just
    // "JSESSIONID=abc" for the outgoing Cookie header on later requests.
    return setCookie.split(';').first.trim();
  }
}
