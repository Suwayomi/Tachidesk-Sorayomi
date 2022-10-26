import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tachidesk_sorayomi/src/constants/enum.dart';
import 'package:tachidesk_sorayomi/src/features/settings/presentation/server/auth_type_tile.dart';
import 'package:tachidesk_sorayomi/src/features/settings/presentation/server/credentials_popup.dart';
import 'package:tachidesk_sorayomi/src/features/settings/widgets/server_url_tile.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/string_extensions.dart';

import 'package:tachidesk_sorayomi/src/utils/launch_url_in_web.dart';
import 'package:tachidesk_sorayomi/src/utils/misc/toast.dart';

import '../../../../global_providers/package_info_provider.dart';

class ServerScreen extends HookConsumerWidget {
  const ServerScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toast = ref.watch(toastProvider(context));
    final authType = ref.watch(authTypeStreamProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.settingsScreen_server.tr()),
      ),
      body: ListView(
        children: [
          const ServerUrlTile(),
          const AuthTypeTile(),
          if (authType.hasValue && authType.valueOrNull != AuthType.none)
            ListTile(
              leading: const Icon(Icons.password_rounded),
              title: Text(LocaleKeys.serverSettingsScreen_credentials.tr()),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const CredentialsPopup(),
                );
              },
            ),
          if (!kIsWeb)
            ListTile(
              leading: const Icon(Icons.web_rounded),
              title: Text(LocaleKeys.serverSettingsScreen_webUI.tr()),
              onTap: () async {
                final url = await ref.read(serverUrlProvider).get();
                if (url.isNotBlank) launchUrlInWeb(url!, toast);
              },
            )
        ],
      ),
    );
  }
}
