// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:
import 'src/global_providers/global_providers.dart';
import 'src/i18n/codegen_loader.g.dart';
import 'src/sorayomi.dart';
import 'src/utils/storage/local/shared_preferences_client.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final packageInfo = await PackageInfo.fromPlatform();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [
        packageInfoProvider.overrideWithValue(packageInfo),
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale('en', 'US')],
        path: "assets/locales/",
        fallbackLocale: const Locale('en', "US"),
        assetLoader: const CodegenLoader(),
        child: const Sorayomi(),
      ),
    ),
  );
}
