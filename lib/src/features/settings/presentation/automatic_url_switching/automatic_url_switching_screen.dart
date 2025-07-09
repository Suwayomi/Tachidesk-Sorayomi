// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../global_providers/global_providers.dart';
import '../../../../utils/extensions/custom_extensions.dart';
import '../../../../widgets/section_title.dart';

class AutomaticUrlSwitchingScreen extends ConsumerWidget {
  const AutomaticUrlSwitchingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final automaticSwitching = ref.watch(automaticUrlSwitchingProvider);
    final activeUrl = ref.watch(activeServerUrlProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.automaticUrlSwitching),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(activeServerUrlProvider.notifier).refresh();
        },
        child: ListView(
          children: [
            // Main toggle
            SwitchListTile(
              title: Text(context.l10n.enableAutomaticUrlSwitching),
              subtitle: Text(
                automaticSwitching == true
                    ? context.l10n.automaticUrlSwitchingEnabled
                    : context.l10n.automaticUrlSwitchingDisabled,
              ),
              value: automaticSwitching ?? false,
              onChanged: (value) {
                ref.read(automaticUrlSwitchingProvider.notifier).update(value);
              },
            ),

            if (automaticSwitching == true) ...[
              const Divider(),

              // Current active URL status
              ListTile(
                leading: Icon(
                  activeUrl.when(
                    data: (url) =>
                        url != null ? Icons.check_circle : Icons.error,
                    loading: () => Icons.hourglass_empty,
                    error: (_, __) => Icons.error,
                  ),
                  color: activeUrl.when(
                    data: (url) => url != null ? Colors.green : Colors.red,
                    loading: () => Colors.orange,
                    error: (_, __) => Colors.red,
                  ),
                ),
                title: Text(context.l10n.currentActiveUrl),
                subtitle: activeUrl.when(
                  data: (url) => Text(url ?? context.l10n.noActiveUrlFound),
                  loading: () => Text(context.l10n.detectingNetwork),
                  error: (error, _) => Text('Error: ${error.toString()}'),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    ref.read(activeServerUrlProvider.notifier).refresh();
                  },
                ),
              ),

              const Divider(),

              // Local Network Section - Placeholder for now
              SectionTitle(title: context.l10n.localNetwork),
              ListTile(
                leading: const Icon(Icons.wifi),
                title: Text(context.l10n.localNetworkConfiguration),
                subtitle: Text(context.l10n.configureLocalWifiSettings),
              ),

              const Divider(),

              // External URLs Section - Placeholder for now
              SectionTitle(title: context.l10n.externalUrls),
              ListTile(
                leading: const Icon(Icons.cloud),
                title: Text(context.l10n.externalUrls),
                subtitle: Text(context.l10n.manageExternalServerUrls),
              ),

              if (!kIsWeb) ...[
                const Divider(),

                // Network info section
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: Text(context.l10n.networkInformation),
                  subtitle: Text(
                    context.l10n.networkInformationDescription,
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
