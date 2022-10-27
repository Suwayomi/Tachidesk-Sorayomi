// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

// 🌎 Project imports:
import 'src/constants/gen/assets.gen.dart';
import 'src/global_providers/global_providers.dart';
import 'src/i18n/codegen_loader.g.dart';
import 'src/sorayomi.dart';
import 'src/utils/network/sembast/sembast_client.dart';

// 🐦 Flutter imports:

// 📦 Package imports:

// 🌎 Project imports:

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final packageInfo = await PackageInfo.fromPlatform();
  final sembastDatabase = await SembastDatabase.makeDefault(packageInfo);

  final container = ProviderContainer(
    overrides: [
      sembastDatabaseProvider.overrideWithValue(sembastDatabase),
      packageInfoProvider.overrideWithValue(packageInfo),
    ],
  );
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: EasyLocalization(
        supportedLocales: const [Locale('en', 'US')],
        path: Assets.locales.enUS,
        fallbackLocale: const Locale('en', "US"),
        assetLoader: const CodegenLoader(),
        child: const Sorayomi(),
      ),
    ),
  );
}
