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

/// A list tile widget for displaying and managing external URL configurations
class ExternalUrlConfigTile extends ConsumerWidget {
  const ExternalUrlConfigTile({
    super.key,
    required this.config,
    required this.index,
    required this.onEdit,
    required this.onTest,
  });

  final ExternalUrlConfig config;
  final int index;
  final VoidCallback onEdit;
  final VoidCallback onTest;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: const Icon(Icons.language),
      title: Text(config.url),
      subtitle: config.authType != AuthType.none
          ? Text(
              '${config.authType.toLocale(context)} - ${config.username ?? 'No username'}',
            )
          : null,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.network_check),
            onPressed: onTest,
            tooltip: context.l10n.testConnection,
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: onEdit,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              ref
                  .read(externalNetworkUrlConfigsProvider.notifier)
                  .removeExternalUrl(config.url);
            },
          ),
        ],
      ),
    );
  }
}
