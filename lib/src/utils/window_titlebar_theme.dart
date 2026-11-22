// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class WindowTitlebarTheme {
  static const MethodChannel _channel =
      MethodChannel('dev.suwayomi.sorayomi/theme');

  /// Updates the Windows titlebar theme to match the app's theme
  static Future<void> setDarkMode(bool isDark) async {
    if (!kIsWeb && Platform.isWindows) {
      try {
        await _channel.invokeMethod('setDarkMode', {'isDark': isDark});
      } catch (e) {
        debugPrint('Failed to update Windows titlebar theme: $e');
      }
    }
  }
}
