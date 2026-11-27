// Copyright (c) 2026 Contributors to the Suwayomi project

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:tachidesk_sorayomi/src/features/auth/data/simple_login_client.dart';

void main() {
  group('SimpleLoginClient', () {
    test('login returns cookie value on 303', () async {
      final mock = MockClient((request) async {
        expect(request.url.toString(), 'https://server.test/login.html');
        expect(request.headers['Content-Type'],
            'application/x-www-form-urlencoded; charset=utf-8');
        expect(request.bodyFields, {'user': 'aaron', 'pass': 'hunter2'});
        return http.Response(
          '',
          303,
          headers: {
            'location': '/',
            'set-cookie':
                'JSESSIONID=abc.123; Path=/; HttpOnly',
          },
        );
      });

      final client = SimpleLoginClient(httpClient: mock);
      final cookie = await client.login(
        serverBaseUrl: 'https://server.test',
        username: 'aaron',
        password: 'hunter2',
      );
      expect(cookie, 'JSESSIONID=abc.123');
    });

    test('login throws SimpleLoginAuthFailure on 200 (re-rendered form)',
        () async {
      final mock = MockClient((request) async => http.Response(
            '<html>Invalid username or password</html>',
            200,
          ));
      final client = SimpleLoginClient(httpClient: mock);

      expect(
        () => client.login(
          serverBaseUrl: 'https://server.test',
          username: 'aaron',
          password: 'wrong',
        ),
        throwsA(isA<SimpleLoginAuthFailure>()),
      );
    });

    test('login throws SimpleLoginShapeFailure on unexpected status',
        () async {
      final mock = MockClient((request) async => http.Response('', 500));
      final client = SimpleLoginClient(httpClient: mock);

      expect(
        () => client.login(
          serverBaseUrl: 'https://server.test',
          username: 'aaron',
          password: 'hunter2',
        ),
        throwsA(isA<SimpleLoginShapeFailure>()),
      );
    });

    test('login throws SimpleLoginShapeFailure when 303 has no Set-Cookie',
        () async {
      final mock = MockClient((request) async => http.Response(
            '',
            303,
            headers: {'location': '/'},
          ));
      final client = SimpleLoginClient(httpClient: mock);

      expect(
        () => client.login(
          serverBaseUrl: 'https://server.test',
          username: 'aaron',
          password: 'hunter2',
        ),
        throwsA(isA<SimpleLoginShapeFailure>()),
      );
    });
  });
}
