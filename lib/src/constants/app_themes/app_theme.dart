// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

class ThemeColorSchema {
  final ColorScheme light;
  final ColorScheme dark;
  const ThemeColorSchema(this.light, this.dark);
}

class LightAndDarkThemeData {
  late final ThemeData light;
  final ThemeData dark;
  LightAndDarkThemeData(ThemeData light, this.dark) {
    this.light = light.copyWith(
      tabBarTheme: TabBarTheme(
        labelColor: light.colorScheme.primary,
        unselectedLabelColor: light.colorScheme.onBackground,
      ),
      indicatorColor: light.colorScheme.primary,
    );
  }
}
