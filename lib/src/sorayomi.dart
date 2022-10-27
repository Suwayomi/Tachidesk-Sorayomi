// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import 'features/settings/widgets/theme_mode_tile.dart';
import 'i18n/locale_keys.g.dart';
import 'routes/router_config.dart';

// 🐦 Flutter imports:

// 📦 Package imports:

// 🌎 Project imports:

class Sorayomi extends HookConsumerWidget {
  const Sorayomi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routes = ref.watch(routerConfigProvider);
    final themeMode = ref.watch(themeModeStreamProvider);
    return MaterialApp.router(
      title: LocaleKeys.appTitle.tr(),
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: themeMode.valueOrNull ?? ThemeMode.system,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routeInformationProvider: routes.routeInformationProvider,
      routeInformationParser: routes.routeInformationParser,
      routerDelegate: routes.routerDelegate,
    );
  }
}
