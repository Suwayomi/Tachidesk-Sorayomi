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

/// A dialog widget for editing local network configurations
class EditLocalNetworkDialog extends ConsumerStatefulWidget {
  const EditLocalNetworkDialog({
    super.key,
    required this.index,
    required this.currentConfig,
  });

  final int index;
  final LocalNetworkConfig currentConfig;

  @override
  ConsumerState<EditLocalNetworkDialog> createState() => _EditLocalNetworkDialogState();
}

class _EditLocalNetworkDialogState extends ConsumerState<EditLocalNetworkDialog> {
  late String wifiName;
  late String serverUrl;
  late AuthType authType;
  late String username;
  late String password;

  @override
  void initState() {
    super.initState();
    wifiName = widget.currentConfig.wifiName;
    serverUrl = widget.currentConfig.serverUrl;
    authType = widget.currentConfig.authType;
    username = widget.currentConfig.username ?? '';
    password = widget.currentConfig.password ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final globalAuthEnabled = ref.watch(globalAuthenticationEnabledProvider) ?? false;

    return AlertDialog(
      title: Text(context.l10n.editLocalNetwork),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: context.l10n.wifiNetworkName,
                hintText: context.l10n.wifiNetworkNameHint,
              ),
              controller: TextEditingController(text: widget.currentConfig.wifiName),
              onChanged: (value) => setState(() => wifiName = value),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: context.l10n.serverUrl,
                hintText: context.l10n.serverUrlHint,
              ),
              controller: TextEditingController(text: widget.currentConfig.serverUrl),
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
                  controller: TextEditingController(text: username),
                  onChanged: (value) => setState(() => username = value),
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    labelText: context.l10n.password,
                  ),
                  controller: TextEditingController(text: password),
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
                  .updateLocalNetwork(widget.index, config);
              Navigator.of(context).pop();
            }
          },
          child: Text(context.l10n.save),
        ),
      ],
    );
  }

  /// Shows the edit local network dialog
  static Future<void> show(BuildContext context, int index, LocalNetworkConfig currentConfig) async {
    await showDialog(
      context: context,
      builder: (context) => EditLocalNetworkDialog(
        index: index,
        currentConfig: currentConfig,
      ),
    );
  }
}
