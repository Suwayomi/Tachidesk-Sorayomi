// Copyright (c) 2026 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Secure-storage key under which basic-auth credentials now live.
const kBasicCredentialsSecureKey = 'auth.basic.credentials';

/// Legacy SharedPreferences key (DBKeys.basicCredentials.name).
const _kLegacyBasicCredentialsKey = 'basicCredentials';

/// One-time, idempotent migration of basic-auth credentials from the
/// plaintext-equivalent SharedPreferences store to platform secure storage.
///
/// If a credential exists in the legacy location:
///   - And nothing is in secure storage yet → move it.
///   - And something is already in secure storage → keep the secure-store
///     value (user may have re-entered credentials more recently); just
///     clear the legacy copy.
///
/// Either way, the legacy SharedPreferences entry is deleted at the end so
/// the plaintext copy doesn't linger.
Future<void> migrateBasicAuthCredentials({
  required SharedPreferences prefs,
  required FlutterSecureStorage secure,
}) async {
  final legacy = prefs.getString(_kLegacyBasicCredentialsKey);
  if (legacy == null) return;

  final existing = await secure.read(key: kBasicCredentialsSecureKey);
  if (existing == null) {
    await secure.write(key: kBasicCredentialsSecureKey, value: legacy);
  }
  await prefs.remove(_kLegacyBasicCredentialsKey);
}
