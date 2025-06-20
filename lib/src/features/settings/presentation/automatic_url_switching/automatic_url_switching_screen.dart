// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../global_providers/global_providers.dart';
import '../../../../widgets/section_title.dart';

class AutomaticUrlSwitchingScreen extends ConsumerWidget {
  const AutomaticUrlSwitchingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final automaticSwitching = ref.watch(automaticUrlSwitchingProvider);
    final activeUrl = ref.watch(activeServerUrlProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Automatic URL Switching'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(activeServerUrlProvider.notifier).refresh();
        },
        child: ListView(
          children: [
            // Main toggle
            SwitchListTile(
              title: const Text('Enable Automatic URL Switching'),
              subtitle: Text(
                automaticSwitching == true
                    ? 'Automatically switch between local and external URLs'
                    : 'Use manual server URL setting',
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
                title: const Text('Current Active URL'),
                subtitle: activeUrl.when(
                  data: (url) => Text(url ?? 'No active URL found'),
                  loading: () => const Text('Detecting network...'),
                  error: (error, _) => Text('Error: $error'),
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
              const SectionTitle(title: "Local Network"),
              const ListTile(
                leading: Icon(Icons.wifi),
                title: Text('Local Network Configuration'),
                subtitle: Text('Configure local WiFi network settings'),
              ),

              const Divider(),

              // External URLs Section - Placeholder for now
              const SectionTitle(title: "External URLs"),
              const ListTile(
                leading: Icon(Icons.cloud),
                title: Text('External URLs'),
                subtitle: Text('Manage external server URLs'),
              ),

              if (!kIsWeb) ...[
                const Divider(),

                // Network info section
                const ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('Network Information'),
                  subtitle: Text(
                    'The app will automatically detect your WiFi network and switch to the appropriate server URL.',
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
