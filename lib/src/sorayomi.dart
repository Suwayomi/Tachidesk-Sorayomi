// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'constants/app_themes/color_schemas/default_theme.dart';
import 'features/settings/widgets/theme_mode_tile/theme_mode_tile.dart';
import 'i18n/locale_keys.g.dart';
import 'routes/router_config.dart';

class Sorayomi extends ConsumerWidget {
  const Sorayomi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routes = ref.watch(routerConfigProvider);
    final themeMode = ref.watch(themeModeKeyProvider);
    return MaterialApp.router(
      title: "Tachidesk Sorayomi",
      debugShowCheckedModeBanner: false,
      theme: defaultTheme.light,
      darkTheme: defaultTheme.dark,
      themeMode: themeMode ?? ThemeMode.system,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routeInformationProvider: routes.routeInformationProvider,
      routeInformationParser: routes.routeInformationParser,
      routerDelegate: routes.routerDelegate,
    );
  }
}
