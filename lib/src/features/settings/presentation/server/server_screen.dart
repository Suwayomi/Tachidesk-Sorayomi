// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/db_keys.dart';
import '../../../../constants/endpoints.dart';
import '../../../../global_providers/global_providers.dart';
import '../../../../utils/extensions/custom_extensions.dart';
import '../../../../utils/launch_url_in_web.dart';
import '../../../../utils/misc/toast/toast.dart';
import '../../controller/server_controller.dart';
import 'widget/authentication/authentication_section.dart';
import 'widget/automatic_url_switching/automatic_url_switching_section.dart';
import 'widget/client/client_section.dart';
import 'widget/client/server_port_tile/server_port_tile.dart';
import 'widget/client/server_url_tile/server_url_tile.dart';
import 'widget/cloud_flare/cloud_flare_section.dart';
import 'widget/misc_settings/misc_settings_section.dart';
import 'widget/server_binding/server_binding_section.dart';
import 'widget/socks_proxy/socks_proxy_section.dart';

class ServerScreen extends ConsumerWidget {
  const ServerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverSettings = ref.watch(settingsProvider);
    final automaticSwitching = ref.watch(automaticUrlSwitchingProvider);
    onRefresh() => ref.refresh(settingsProvider.future);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.server),
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: ListTileTheme(
          data: const ListTileThemeData(
            subtitleTextStyle: TextStyle(color: Colors.grey),
          ),
          child: ListView(
            children: [
              // Automatic URL Switching should be at the top
              const AutomaticUrlSwitchingSection(),
              const Divider(),

              // Only show manual client settings if automatic switching is disabled
              if (automaticSwitching != true) ...[
                const ClientSection(),
                const Divider(),
                const AuthenticationSection(),
              ],
              if (!kIsWeb)
                ListTile(
                  leading: const Icon(Icons.web_rounded),
                  title: Text(context.l10n.webUI),
                  onTap: () async {
                    // Store context references before async operations
                    final toast = ref.read(toastProvider);
                    
                    // Use active server URL (which includes automatic switching logic)
                    final activeUrl = await ref.read(activeServerUrlProvider.future);
                    final automaticSwitching = ref.read(automaticUrlSwitchingProvider);
                    
                    // When automatic switching is enabled but no URL is available, show error
                    if (automaticSwitching == true && activeUrl == null) {
                      if (context.mounted) {
                        toast?.showError('No server URL available from automatic switching. Please configure local networks or external URLs.');
                      }
                      return;
                    }
                    
                    final url = Endpoints.baseApi(
                      baseUrl: activeUrl ?? (automaticSwitching == true ? 'http://localhost:4567' : ref.read(serverUrlProvider) ?? DBKeys.serverUrl.initial),
                      port: automaticSwitching == true ? null : ref.read(serverPortProvider),
                      addPort: automaticSwitching == true ? false : ref.watch(serverPortToggleProvider).ifNull(),
                      appendApiToUrl: false,
                    );
                    if (url.isNotBlank && context.mounted) {
                      launchUrlInWeb(
                        context,
                        url,
                        toast,
                      );
                    }
                  },
                ),
              const Divider(),
              if (serverSettings.valueOrNull != null) ...[
                ServerBindingSection(serverBindingDto: serverSettings.value!),
                SocksProxySection(socksProxyDto: serverSettings.value!),
                CloudFlareSection(cloudFlareDto: serverSettings.value!),
                MiscSettingsSection(miscSettingsDto: serverSettings.value!),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
