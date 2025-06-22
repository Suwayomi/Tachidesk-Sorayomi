// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'features/settings/domain/automatic_url_switching/app_lifecycle_manager.dart';
import 'features/settings/presentation/appearance/widgets/app_theme_selector/app_theme_selector.dart';
import 'features/settings/presentation/appearance/widgets/is_true_black/is_true_black_tile.dart';
import 'features/settings/widgets/app_theme_mode_tile/app_theme_mode_tile.dart';
import 'global_providers/global_providers.dart';
import 'l10n/generated/app_localizations.dart';
import 'routes/router_config.dart';
import 'utils/extensions/custom_extensions.dart';

class Sorayomi extends ConsumerStatefulWidget {
  const Sorayomi({super.key});

  @override
  ConsumerState<Sorayomi> createState() => _SorayomiState();
}

class _SorayomiState extends ConsumerState<Sorayomi> {
  AppLifecycleManager? _lifecycleManager;

  @override
  void initState() {
    super.initState();
    // Initialize lifecycle manager after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _lifecycleManager = AppLifecycleManager(ref);
      _lifecycleManager?.initialize();
    });
  }

  @override
  void dispose() {
    _lifecycleManager?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final routes = ref.watch(routerConfigProvider);
    final themeMode = ref.watch(appThemeModeProvider);
    final appLocale = ref.watch(l10nProvider);
    final appScheme = ref.watch(appSchemeProvider);
    final isTrueBlack = ref.watch(isTrueBlackProvider);
    final client = ref.watch(graphQlClientNotifierProvider);

    return GraphQLProvider(
      client: client,
      child: MaterialApp.router(
        builder: FToastBuilder(),
        onGenerateTitle: (context) => context.l10n.appTitle,
        debugShowCheckedModeBanner: false,
        theme: FlexThemeData.light(
          scheme: appScheme,
          useMaterial3: true,
          useMaterial3ErrorColors: true,
        ).copyWith(
          tabBarTheme: const TabBarThemeData(tabAlignment: TabAlignment.center),
        ),
        darkTheme: FlexThemeData.dark(
          scheme: appScheme,
          useMaterial3: true,
          useMaterial3ErrorColors: true,
          darkIsTrueBlack: isTrueBlack.ifNull(),
        ).copyWith(
          tabBarTheme: const TabBarThemeData(tabAlignment: TabAlignment.center),
        ),
        themeMode: themeMode ?? ThemeMode.system,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: appLocale,
        routerConfig: routes,
      ),
    );
  }
}
