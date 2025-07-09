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

/// A dialog widget for adding or editing local network configurations
class LocalNetworkDialog extends ConsumerStatefulWidget {
  const LocalNetworkDialog({
    super.key,
    this.index,
    this.currentConfig,
  });

  /// Index of the config to edit (null for add mode)
  final int? index;

  /// Current config to edit (null for add mode)
  final LocalNetworkConfig? currentConfig;

  /// Whether this dialog is in edit mode
  bool get isEditMode => currentConfig != null;

  @override
  ConsumerState<LocalNetworkDialog> createState() => _LocalNetworkDialogState();
}

class _LocalNetworkDialogState extends ConsumerState<LocalNetworkDialog> {
  late String wifiName;
  late String serverUrl;
  late AuthType authType;
  late String username;
  late String password;
  late TextEditingController wifiController;
  late TextEditingController urlController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();

    // Initialize values based on mode
    if (widget.isEditMode) {
      wifiName = widget.currentConfig!.wifiName;
      serverUrl = widget.currentConfig!.serverUrl;
      authType = widget.currentConfig!.authType;
      username = widget.currentConfig!.username ?? '';
      password = widget.currentConfig!.password ?? '';
    } else {
      wifiName = '';
      serverUrl = '';
      authType = AuthType.none;
      username = '';
      password = '';
    }

    // Initialize controllers
    wifiController = TextEditingController(text: wifiName);
    urlController = TextEditingController(text: serverUrl);
    usernameController = TextEditingController(text: username);
    passwordController = TextEditingController(text: password);
  }

  @override
  void dispose() {
    wifiController.dispose();
    urlController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final globalAuthEnabled =
        ref.watch(globalAuthenticationEnabledProvider) ?? false;

    return AlertDialog(
      title: Text(widget.isEditMode
          ? context.l10n.editLocalNetwork
          : context.l10n.addLocalNetwork),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: wifiController,
              decoration: InputDecoration(
                labelText: context.l10n.wifiNetworkName,
                hintText: context.l10n.wifiNetworkNameHint,
              ),
              onChanged: (value) => setState(() => wifiName = value),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: urlController,
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
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: context.l10n.username,
                  ),
                  onChanged: (value) => setState(() => username = value),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: passwordController,
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
          onPressed: () => _handleSave(),
          child: Text(widget.isEditMode ? context.l10n.save : context.l10n.add),
        ),
      ],
    );
  }

  void _handleSave() {
    if (wifiName.isEmpty || serverUrl.isEmpty) return;

    // Check if values have changed in edit mode
    if (widget.isEditMode && !_hasChanges()) {
      Navigator.of(context).pop();
      return;
    }

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

    if (widget.isEditMode) {
      ref
          .read(localNetworkConfigsProvider.notifier)
          .updateLocalNetwork(widget.index!, config);
    } else {
      ref.read(localNetworkConfigsProvider.notifier).addLocalNetwork(config);
    }

    Navigator.of(context).pop();
  }

  bool _hasChanges() {
    if (!widget.isEditMode) return true;

    final current = widget.currentConfig!;
    return wifiName != current.wifiName ||
        serverUrl != current.serverUrl ||
        authType != current.authType ||
        username != (current.username ?? '') ||
        password != (current.password ?? '');
  }

  bool get globalAuthEnabled =>
      ref.watch(globalAuthenticationEnabledProvider) ?? false;
}
