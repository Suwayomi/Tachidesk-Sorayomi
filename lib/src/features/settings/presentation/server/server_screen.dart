// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../../constants/enum.dart';
import '../../../../global_providers/global_providers.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/string_extensions.dart';
import '../../../../utils/launch_url_in_web.dart';
import '../../../../utils/misc/toast/toast.dart';
import '../../widgets/server_url_tile.dart';
import 'auth_type_tile.dart';
import 'credentials_popup.dart';

class ServerScreen extends HookConsumerWidget {
  const ServerScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toast = ref.watch(toastProvider(context));
    final authType = ref.watch(authTypeKeyProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.server.tr()),
      ),
      body: ListView(
        children: [
          const ServerUrlTile(),
          const AuthTypeTile(),
          if (authType != null && authType != AuthType.none)
            ListTile(
              leading: const Icon(Icons.password_rounded),
              title: Text(LocaleKeys.credentials.tr()),
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
              title: Text(LocaleKeys.webUI.tr()),
              onTap: () {
                final url = ref.read(serverUrlProvider);
                if (url.isNotBlank) launchUrlInWeb(url!, toast);
              },
            )
        ],
      ),
    );
  }
}
