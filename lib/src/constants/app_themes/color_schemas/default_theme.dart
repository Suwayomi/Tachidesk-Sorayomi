// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import '../app_theme.dart';

final LightAndDarkThemeData defaultTheme = LightAndDarkThemeData(
  ThemeData(
    useMaterial3: true,
    colorScheme: _lightColorScheme,
  ),
  ThemeData(
    useMaterial3: true,
    colorScheme: _darkColorScheme,
  ),
);

const _lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF335CA8),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFD8E2FF),
  onPrimaryContainer: Color(0xFF001A42),
  secondary: Color(0xFF335CA8),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFD8E2FF),
  onSecondaryContainer: Color(0xFF001A42),
  tertiary: Color(0xFF006E1B),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFF95F990),
  onTertiaryContainer: Color(0xFF002203),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFEFBFF),
  onBackground: Color(0xFF1B1B1F),
  surface: Color(0xFFFEFBFF),
  onSurface: Color(0xFF1B1B1F),
  surfaceVariant: Color(0xFFE1E2EC),
  onSurfaceVariant: Color(0xFF44474F),
  outline: Color(0xFF757780),
  onInverseSurface: Color(0xFFF2F0F4),
  inverseSurface: Color(0xFF303034),
  inversePrimary: Color(0xFFAEC6FF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF335CA8),
  outlineVariant: Color(0xFFC5C6D0),
  scrim: Color(0xFF000000),
);

const _darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFAEC6FF),
  onPrimary: Color(0xFF002E6B),
  primaryContainer: Color(0xFF13448F),
  onPrimaryContainer: Color(0xFFD8E2FF),
  secondary: Color(0xFFAEC6FF),
  onSecondary: Color(0xFF002E6B),
  secondaryContainer: Color(0xFF13448F),
  onSecondaryContainer: Color(0xFFD8E2FF),
  tertiary: Color(0xFF7ADC77),
  onTertiary: Color(0xFF003909),
  tertiaryContainer: Color(0xFF005312),
  onTertiaryContainer: Color(0xFF95F990),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1B1B1F),
  onBackground: Color(0xFFE3E2E6),
  surface: Color(0xFF1B1B1F),
  onSurface: Color(0xFFE3E2E6),
  surfaceVariant: Color(0xFF44474F),
  onSurfaceVariant: Color(0xFFC5C6D0),
  outline: Color(0xFF8E9099),
  onInverseSurface: Color(0xFF1B1B1F),
  inverseSurface: Color(0xFFE3E2E6),
  inversePrimary: Color(0xFF335CA8),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFAEC6FF),
  outlineVariant: Color(0xFF44474F),
  scrim: Color(0xFF000000),
);
