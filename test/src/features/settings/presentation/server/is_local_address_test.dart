import 'package:flutter_test/flutter_test.dart';
import 'package:tachidesk_sorayomi/src/features/settings/presentation/server/widget/credential_popup/login_credentials_popup.dart';

void main() {
  group('isLocalAddress', () {
    test('localhost', () {
      expect(isLocalAddress('http://localhost'), isTrue);
      expect(isLocalAddress('http://localhost:4567'), isTrue);
      expect(isLocalAddress('http://LOCALHOST:4567/api'), isTrue);
    });

    test('127.x.x.x loopback', () {
      expect(isLocalAddress('http://127.0.0.1'), isTrue);
      expect(isLocalAddress('http://127.0.0.1:8080/api/graphql'), isTrue);
      expect(isLocalAddress('http://127.255.255.255'), isTrue);
    });

    test('192.168.x.x', () {
      expect(isLocalAddress('http://192.168.2.4:4568'), isTrue);
      expect(isLocalAddress('http://192.168.0.1'), isTrue);
    });

    test('10.x.x.x', () {
      expect(isLocalAddress('http://10.0.0.1'), isTrue);
      expect(isLocalAddress('http://10.255.255.255'), isTrue);
    });

    test('172.16-31.x.x', () {
      expect(isLocalAddress('http://172.16.0.1'), isTrue);
      expect(isLocalAddress('http://172.20.50.50'), isTrue);
      expect(isLocalAddress('http://172.31.255.255'), isTrue);
      // 172.15 and 172.32 are NOT in the private range
      expect(isLocalAddress('http://172.15.0.1'), isFalse);
      expect(isLocalAddress('http://172.32.0.1'), isFalse);
    });

    test('public addresses are not local', () {
      expect(isLocalAddress('http://suwayomi.typhon.one'), isFalse);
      expect(isLocalAddress('https://example.com'), isFalse);
      expect(isLocalAddress('http://8.8.8.8'), isFalse);
      expect(isLocalAddress('http://1.1.1.1'), isFalse);
    });

    test('malformed inputs', () {
      expect(isLocalAddress(''), isFalse);
      expect(isLocalAddress('not a url'), isFalse);
      expect(isLocalAddress('http://'), isFalse);
      expect(isLocalAddress('http://999.999.999.999'), isFalse);
    });
  });
}
