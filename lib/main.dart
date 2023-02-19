// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/features/about/presentation/about/controllers/about_controller.dart';
import 'src/sorayomi.dart';
import 'src/utils/logger/provider_state_logger.dart';
import 'src/utils/storage/local/shared_preferences_client.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final packageInfo = await PackageInfo.fromPlatform();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      observers: const [if (kDebugMode) ProviderStateLogger()],
      overrides: [
        packageInfoProvider.overrideWithValue(packageInfo),
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const Sorayomi(),
    ),
  );
}
