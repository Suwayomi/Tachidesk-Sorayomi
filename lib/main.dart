import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tachidesk_sorayomi/src/constants/gen/assets.gen.dart';
import 'package:tachidesk_sorayomi/src/global_providers/package_info_provider.dart';
import 'package:tachidesk_sorayomi/src/i18n/codegen_loader.g.dart';
import 'package:tachidesk_sorayomi/src/sorayomi.dart';
import 'package:tachidesk_sorayomi/src/utils/network/sembast/sembast_client.dart';

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
