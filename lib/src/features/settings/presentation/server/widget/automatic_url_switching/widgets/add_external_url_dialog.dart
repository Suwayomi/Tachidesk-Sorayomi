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

/// A dialog widget for adding external URL configurations
class AddExternalUrlDialog extends ConsumerStatefulWidget {
  const AddExternalUrlDialog({super.key});

  @override
  ConsumerState<AddExternalUrlDialog> createState() => _AddExternalUrlDialogState();
}

class _AddExternalUrlDialogState extends ConsumerState<AddExternalUrlDialog> {
  String newUrl = '';
  AuthType authType = AuthType.none;
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final globalAuthEnabled = ref.watch(globalAuthenticationEnabledProvider) ?? false;

    return AlertDialog(
      title: Text(context.l10n.addExternalUrl),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
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
          onPressed: () async {
            if (newUrl.isNotEmpty) {
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
              ref
                  .read(externalNetworkUrlConfigsProvider.notifier)
                  .addExternalUrl(config);
              Navigator.of(context).pop();
            }
          },
          child: Text(context.l10n.add),
        ),
      ],
    );
  }

  /// Shows the add external URL dialog
  static Future<void> show(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => const AddExternalUrlDialog(),
    );
  }
}
