// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/features/about/presentation/about/controllers/about_controller.dart';
import 'src/features/auth/data/auth_credentials_store.dart';
import 'src/features/auth/data/basic_auth_migration.dart';
import 'src/features/auth/data/secure_credentials_provider.dart';
import 'src/features/settings/presentation/server/widget/credential_popup/credentials_popup.dart';
import 'src/global_providers/global_providers.dart';
import 'src/sorayomi.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final packageInfo = await PackageInfo.fromPlatform();
  final sharedPreferences = await SharedPreferences.getInstance();
  await initHiveForFlutter();

  SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  GoRouter.optionURLReflectsImperativeAPIs = true;

  // Build a ProviderContainer so we can run migration and preload auth
  // providers before the first frame. Using UncontrolledProviderScope below
  // ensures the widget tree uses this same container instance.
  final container = ProviderContainer(
    overrides: [
      packageInfoProvider.overrideWithValue(packageInfo),
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      hiveStoreProvider.overrideWithValue(HiveStore()),
    ],
  );

  final secure = container.read(secureStorageProvider);

  // 1) Migrate legacy SharedPreferences basic-auth → secure storage.
  try {
    await migrateBasicAuthCredentials(prefs: sharedPreferences, secure: secure);
  } catch (e, st) {
    debugPrint('basic_auth migration failed: $e\n$st');
    // Non-fatal: legacy creds stay in SharedPreferences for one more launch.
  }

  // 2) Preload both auth providers BEFORE the first frame so synchronous reads
  //    (image widgets, GraphQL links) get populated state instead of
  //    AsyncLoading — which would produce tokenless requests that get cached
  //    as 401 failures by cached_network_image.
  try {
    await Future.wait([
      container.read(authCredentialsStoreProvider.future),
      container.read(credentialsProvider.future),
    ]);
  } catch (e, st) {
    debugPrint('auth preload failed, falling back to empty state: $e\n$st');
    // Both notifiers will re-attempt on first widget read. App still launches.
  }

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const Sorayomi(),
    ),
  );
}
