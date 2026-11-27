// Copyright (c) 2026 Contributors to the Suwayomi project

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tachidesk_sorayomi/src/features/auth/data/auth_credentials_store.dart';
import 'package:tachidesk_sorayomi/src/features/auth/data/secure_credentials_provider.dart';

class _InMemorySecureStorage implements FlutterSecureStorage {
  _InMemorySecureStorage([Map<String, String>? seed])
      : _store = {...?seed};
  final Map<String, String> _store;

  @override
  Future<void> write({
    required String key,
    required String? value,
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    MacOsOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    if (value == null) {
      _store.remove(key);
    } else {
      _store[key] = value;
    }
  }

  @override
  Future<String?> read({
    required String key,
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    MacOsOptions? mOptions,
    WindowsOptions? wOptions,
  }) async =>
      _store[key];

  @override
  Future<void> delete({
    required String key,
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    MacOsOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    _store.remove(key);
  }

  @override
  noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} not stubbed');
}

ProviderContainer _container(_InMemorySecureStorage storage) =>
    ProviderContainer(overrides: [
      secureStorageProvider.overrideWithValue(storage),
    ]);

void main() {
  group('AuthCredentialsStore — build() (load from secure storage)', () {
    test('build loads existing values from secure storage into state',
        () async {
      final storage = _InMemorySecureStorage({
        'auth.ui.accessToken': 'A',
        'auth.ui.refreshToken': 'R',
        'auth.simple.cookie': 'JSESSIONID=abc',
        'auth.password': 'hunter2',
      });
      final c = _container(storage);
      addTearDown(c.dispose);

      final state = await c.read(authCredentialsStoreProvider.future);
      expect(state.uiAccessToken, 'A');
      expect(state.uiRefreshToken, 'R');
      expect(state.simpleLoginCookie, 'JSESSIONID=abc');
      expect(state.password, 'hunter2');
    });

    test('build returns empty state when nothing is stored', () async {
      final storage = _InMemorySecureStorage();
      final c = _container(storage);
      addTearDown(c.dispose);

      final state = await c.read(authCredentialsStoreProvider.future);
      expect(state.uiAccessToken, isNull);
      expect(state.simpleLoginCookie, isNull);
    });
  });

  group('AuthCredentialsStore — UI Login', () {
    test('saveUiLoginTokens persists AND updates state', () async {
      final storage = _InMemorySecureStorage();
      final c = _container(storage);
      addTearDown(c.dispose);

      // Force build so the notifier exists.
      await c.read(authCredentialsStoreProvider.future);

      final store = c.read(authCredentialsStoreProvider.notifier);
      await store.saveUiLoginTokens(
        accessToken: 'ACCESS123',
        refreshToken: 'REFRESH456',
      );

      // Backing store written.
      expect(await storage.read(key: 'auth.ui.accessToken'), 'ACCESS123');
      expect(await storage.read(key: 'auth.ui.refreshToken'), 'REFRESH456');
      // Riverpod state updated synchronously (no reload needed).
      final state = c.read(authCredentialsStoreProvider).requireValue;
      expect(state.uiAccessToken, 'ACCESS123');
      expect(state.uiRefreshToken, 'REFRESH456');
      // Convenience header projection.
      expect(state.uiAuthorizationHeader, {'Authorization': 'Bearer ACCESS123'});
    });

    test('clearUiLoginTokens removes both tokens from store AND state',
        () async {
      final storage = _InMemorySecureStorage({
        'auth.ui.accessToken': 'A',
        'auth.ui.refreshToken': 'R',
      });
      final c = _container(storage);
      addTearDown(c.dispose);
      await c.read(authCredentialsStoreProvider.future);

      final store = c.read(authCredentialsStoreProvider.notifier);
      await store.clearUiLoginTokens();

      expect(await storage.read(key: 'auth.ui.accessToken'), isNull);
      expect(await storage.read(key: 'auth.ui.refreshToken'), isNull);
      final state = c.read(authCredentialsStoreProvider).requireValue;
      expect(state.uiAccessToken, isNull);
      expect(state.uiAuthorizationHeader, isNull);
    });

    test('updateUiLoginAccessToken updates only the access token', () async {
      final storage = _InMemorySecureStorage({
        'auth.ui.accessToken': 'OLD',
        'auth.ui.refreshToken': 'REFRESH',
      });
      final c = _container(storage);
      addTearDown(c.dispose);
      await c.read(authCredentialsStoreProvider.future);

      final store = c.read(authCredentialsStoreProvider.notifier);
      await store.updateUiLoginAccessToken('NEW');

      final state = c.read(authCredentialsStoreProvider).requireValue;
      expect(state.uiAccessToken, 'NEW');
      expect(state.uiRefreshToken, 'REFRESH',
          reason: 'refresh token must not be touched on access rotation');
    });
  });

  group('AuthCredentialsStore — Simple Login', () {
    test('saveSimpleLoginCookie persists AND updates state', () async {
      final storage = _InMemorySecureStorage();
      final c = _container(storage);
      addTearDown(c.dispose);
      await c.read(authCredentialsStoreProvider.future);

      final store = c.read(authCredentialsStoreProvider.notifier);
      await store.saveSimpleLoginCookie('JSESSIONID=abc123');

      final state = c.read(authCredentialsStoreProvider).requireValue;
      expect(state.simpleLoginCookie, 'JSESSIONID=abc123');
      expect(state.simpleLoginCookieHeader, {'Cookie': 'JSESSIONID=abc123'});
    });

    test('clearSimpleLoginCookie removes the cookie from store + state',
        () async {
      final storage =
          _InMemorySecureStorage({'auth.simple.cookie': 'JSESSIONID=x'});
      final c = _container(storage);
      addTearDown(c.dispose);
      await c.read(authCredentialsStoreProvider.future);

      final store = c.read(authCredentialsStoreProvider.notifier);
      await store.clearSimpleLoginCookie();

      final state = c.read(authCredentialsStoreProvider).requireValue;
      expect(state.simpleLoginCookie, isNull);
      expect(state.simpleLoginCookieHeader, isNull);
    });
  });

  group('AuthCredentialsStore — password', () {
    test('savePassword persists AND updates state', () async {
      final storage = _InMemorySecureStorage();
      final c = _container(storage);
      addTearDown(c.dispose);
      await c.read(authCredentialsStoreProvider.future);

      final store = c.read(authCredentialsStoreProvider.notifier);
      await store.savePassword('hunter2');

      expect(await storage.read(key: 'auth.password'), 'hunter2');
      expect(c.read(authCredentialsStoreProvider).requireValue.password,
          'hunter2');
    });
  });

  group('AuthCredentialsStore — basic credentials (migrated)', () {
    test('clearBasicCredentials removes the secure-storage entry', () async {
      final storage = _InMemorySecureStorage({
        'auth.basic.credentials': 'Basic YWFyb246aHVudGVyMg==',
      });
      final c = _container(storage);
      addTearDown(c.dispose);
      await c.read(authCredentialsStoreProvider.future);

      final store = c.read(authCredentialsStoreProvider.notifier);
      await store.clearBasicCredentials();

      expect(await storage.read(key: 'auth.basic.credentials'), isNull);
    });
  });
}
