// Copyright (c) 2026 Contributors to the Suwayomi project

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tachidesk_sorayomi/src/features/auth/data/basic_auth_migration.dart';

class _InMemorySecureStorage implements FlutterSecureStorage {
  final Map<String, String> _store = {};
  @override
  Future<void> write({required String key, required String? value,
      IOSOptions? iOptions, AndroidOptions? aOptions, LinuxOptions? lOptions,
      WebOptions? webOptions, MacOsOptions? mOptions,
      WindowsOptions? wOptions}) async {
    if (value == null) _store.remove(key); else _store[key] = value;
  }
  @override
  Future<String?> read({required String key, IOSOptions? iOptions,
      AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions,
      MacOsOptions? mOptions, WindowsOptions? wOptions}) async => _store[key];
  @override
  Future<void> delete({required String key, IOSOptions? iOptions,
      AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions,
      MacOsOptions? mOptions, WindowsOptions? wOptions}) async => _store.remove(key);
  @override
  noSuchMethod(Invocation i) => throw UnimplementedError();
}

void main() {
  group('migrateBasicAuthCredentials', () {
    test('moves legacy SharedPreferences credential to secure storage',
        () async {
      SharedPreferences.setMockInitialValues({
        'basicCredentials': 'Basic YWFyb246aHVudGVyMg==',
      });
      final prefs = await SharedPreferences.getInstance();
      final secure = _InMemorySecureStorage();

      await migrateBasicAuthCredentials(prefs: prefs, secure: secure);

      expect(prefs.getString('basicCredentials'), isNull);
      expect(await secure.read(key: 'auth.basic.credentials'),
          'Basic YWFyb246aHVudGVyMg==');
    });

    test('is a no-op when no legacy credential exists', () async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      final secure = _InMemorySecureStorage();

      await migrateBasicAuthCredentials(prefs: prefs, secure: secure);

      expect(await secure.read(key: 'auth.basic.credentials'), isNull);
    });

    test('is a no-op when secure storage already has the value (idempotent)',
        () async {
      SharedPreferences.setMockInitialValues({
        'basicCredentials': 'Basic NEW_VALUE',
      });
      final prefs = await SharedPreferences.getInstance();
      final secure = _InMemorySecureStorage();
      await secure.write(
          key: 'auth.basic.credentials', value: 'Basic OLD_VALUE');

      await migrateBasicAuthCredentials(prefs: prefs, secure: secure);

      // Existing secure-store value wins; legacy plaintext is still cleared.
      expect(await secure.read(key: 'auth.basic.credentials'),
          'Basic OLD_VALUE');
      expect(prefs.getString('basicCredentials'), isNull);
    });
  });
}
