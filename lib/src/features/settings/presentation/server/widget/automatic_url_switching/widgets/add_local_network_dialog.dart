// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../constants/enum.dart';
import '../../../../../../../global_providers/global_providers.dart';
import '../../../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../domain/automatic_url_switching/local_network_config.dart';

/// A dialog widget for adding local network configurations
class AddLocalNetworkDialog extends ConsumerStatefulWidget {
  const AddLocalNetworkDialog({super.key});

  @override
  ConsumerState<AddLocalNetworkDialog> createState() => _AddLocalNetworkDialogState();
}

class _AddLocalNetworkDialogState extends ConsumerState<AddLocalNetworkDialog> {
  String wifiName = '';
  String serverUrl = '';
  AuthType authType = AuthType.none;
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final globalAuthEnabled = ref.watch(globalAuthenticationEnabledProvider) ?? false;

    return AlertDialog(
      title: Text(context.l10n.addLocalNetwork),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: context.l10n.wifiNetworkName,
                hintText: context.l10n.wifiNetworkNameHint,
              ),
              onChanged: (value) => setState(() => wifiName = value),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: context.l10n.serverUrl,
                hintText: context.l10n.serverUrlHint,
              ),
              onChanged: (value) => setState(() => serverUrl = value),
            ),
            if (!globalAuthEnabled) ...[
              const SizedBox(height: 16),
              DropdownButtonFormField<AuthType>(
                decoration: InputDecoration(
                  labelText: context.l10n.authenticationType,
                ),
                value: authType,
                items: AuthType.values.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type.toLocale(context)),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    authType = value ?? AuthType.none;
                  });
                },
              ),
              if (authType == AuthType.basic) ...[
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: context.l10n.username,
                  ),
                  onChanged: (value) => setState(() => username = value),
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    labelText: context.l10n.password,
                  ),
                  obscureText: true,
                  onChanged: (value) => setState(() => password = value),
                ),
              ],
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(context.l10n.cancel),
        ),
        TextButton(
          onPressed: () {
            if (wifiName.isNotEmpty && serverUrl.isNotEmpty) {
              final config = LocalNetworkConfig(
                wifiName: wifiName,
                serverUrl: serverUrl,
                authType: globalAuthEnabled ? AuthType.none : authType,
                username: globalAuthEnabled
                    ? null
                    : (authType == AuthType.basic ? username : null),
                password: globalAuthEnabled
                    ? null
                    : (authType == AuthType.basic ? password : null),
              );
              ref
                  .read(localNetworkConfigsProvider.notifier)
                  .addLocalNetwork(config);
              Navigator.of(context).pop();
            }
          },
          child: Text(context.l10n.add),
        ),
      ],
    );
  }

  /// Shows the add local network dialog
  static Future<void> show(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => const AddLocalNetworkDialog(),
    );
  }
}
