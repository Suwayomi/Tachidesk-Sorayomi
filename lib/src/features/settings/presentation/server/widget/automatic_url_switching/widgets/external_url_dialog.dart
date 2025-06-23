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
import '../../../../../domain/automatic_url_switching/external_url_config.dart';

/// A dialog widget for adding or editing external URL configurations
class ExternalUrlDialog extends ConsumerStatefulWidget {
  const ExternalUrlDialog({
    super.key,
    this.index,
    this.currentConfig,
  });

  /// Index of the config to edit (null for add mode)
  final int? index;

  /// Current config to edit (null for add mode)
  final ExternalUrlConfig? currentConfig;

  /// Whether this dialog is in edit mode
  bool get isEditMode => currentConfig != null;

  @override
  ConsumerState<ExternalUrlDialog> createState() => _ExternalUrlDialogState();
}

class _ExternalUrlDialogState extends ConsumerState<ExternalUrlDialog> {
  late String newUrl;
  late AuthType authType;
  late String username;
  late String password;
  late TextEditingController urlController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();

    // Initialize values based on mode
    if (widget.isEditMode) {
      newUrl = widget.currentConfig!.url;
      authType = widget.currentConfig!.authType;
      username = widget.currentConfig!.username ?? '';
      password = widget.currentConfig!.password ?? '';
    } else {
      newUrl = '';
      authType = AuthType.none;
      username = '';
      password = '';
    }

    // Initialize controllers
    urlController = TextEditingController(text: newUrl);
    usernameController = TextEditingController(text: username);
    passwordController = TextEditingController(text: password);
  }

  @override
  void dispose() {
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
          ? context.l10n.editExternalUrl
          : context.l10n.addExternalUrl),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: urlController,
              decoration: InputDecoration(
                labelText: context.l10n.externalUrls,
                hintText: context.l10n.externalUrlHint,
              ),
              onChanged: (value) => setState(() => newUrl = value),
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
    if (newUrl.isEmpty) return;

    // Check if values have changed in edit mode
    if (widget.isEditMode && !_hasChanges()) {
      Navigator.of(context).pop();
      return;
    }

    final config = ExternalUrlConfig(
      url: newUrl,
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
          .read(externalNetworkUrlConfigsProvider.notifier)
          .updateExternalUrl(widget.index!, config);
    } else {
      ref
          .read(externalNetworkUrlConfigsProvider.notifier)
          .addExternalUrl(config);
    }

    Navigator.of(context).pop();
  }

  bool _hasChanges() {
    if (!widget.isEditMode) return true;

    final current = widget.currentConfig!;
    return newUrl != current.url ||
        authType != current.authType ||
        username != (current.username ?? '') ||
        password != (current.password ?? '');
  }

  bool get globalAuthEnabled =>
      ref.watch(globalAuthenticationEnabledProvider) ?? false;
}
