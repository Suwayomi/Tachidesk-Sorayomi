// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'constants/app_themes/color_schemas/default_theme.dart';
import 'features/settings/widgets/theme_mode_tile/theme_mode_tile.dart';
import 'global_providers/global_providers.dart';
import 'routes/router_config.dart';
import 'utils/extensions/custom_extensions.dart';

class Sorayomi extends ConsumerWidget {
  const Sorayomi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routes = ref.watch(routerConfigProvider);
    final themeMode = ref.watch(themeModeKeyProvider);
    final appLocale = ref.watch(l10nProvider);
    return MaterialApp.router(
      onGenerateTitle: (context) => context.l10n!.appTitle,
      debugShowCheckedModeBanner: false,
      theme: defaultTheme.light,
      darkTheme: defaultTheme.dark,
      themeMode: themeMode ?? ThemeMode.system,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: appLocale,
      routerConfig: routes,
    );
  }
}
