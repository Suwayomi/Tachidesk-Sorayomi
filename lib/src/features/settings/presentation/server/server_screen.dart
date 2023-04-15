// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/endpoints.dart';
import '../../../../constants/enum.dart';
import '../../../../global_providers/global_providers.dart';

import '../../../../utils/extensions/custom_extensions.dart';
import '../../../../utils/launch_url_in_web.dart';
import '../../../../utils/misc/toast/toast.dart';
import '../../widgets/server_port_tile/server_port_tile.dart';
import '../../widgets/server_url_tile/server_url_tile.dart';
import 'widget/auth_type_tile.dart';
import 'widget/credential_popup/credentials_popup.dart';

class ServerScreen extends ConsumerWidget {
  const ServerScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authType = ref.watch(authTypeKeyProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n!.server),
      ),
      body: ListView(
        children: [
          const ServerUrlTile(),
          const ServerPortTile(),
          const AuthTypeTile(),
          if (authType != null && authType != AuthType.none)
            ListTile(
              leading: const Icon(Icons.password_rounded),
              title: Text(context.l10n!.credentials),
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
              title: Text(context.l10n!.webUI),
              onTap: () {
                final url = Endpoints.baseApi(
                  baseUrl: ref.read(serverUrlProvider),
                  port: ref.read(serverPortProvider),
                  addPort: ref.watch(serverPortToggleProvider).ifNull(),
                );
                if (url.isNotBlank) {
                  launchUrlInWeb(
                    context,
                    url,
                    ref.read(toastProvider(context)),
                  );
                }
              },
            )
        ],
      ),
    );
  }
}
