// Copyright (c) 2026 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'secure_credentials_provider.g.dart';

/// A platform-backed secure key/value store for credentials.
///
/// On Android this is backed by EncryptedSharedPreferences (Keystore-backed
/// AES key); on iOS by the Keychain; on desktop/web by best-available
/// platform stores. Always preferred over SharedPreferences for anything
/// bearer-equivalent (passwords, JWTs, session cookies).
@Riverpod(keepAlive: true)
FlutterSecureStorage secureStorage(Ref ref) => const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );
