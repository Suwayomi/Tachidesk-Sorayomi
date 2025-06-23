// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../../constants/db_keys.dart';
import '../../../../../../../global_providers/global_providers.dart';
import '../../../../../../../routes/router_config.dart';
import '../../../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../../../utils/mixin/shared_preferences_client_mixin.dart';

part 'server_url_tile.g.dart';

@riverpod
class ServerUrl extends _$ServerUrl with SharedPreferenceClientMixin<String> {
  @override
  String? build() => initialize(
        DBKeys.serverUrl,
        initial: kIsWeb ? Uri.base.origin : DBKeys.serverUrl.initial,
      );
}

class ServerUrlTile extends ConsumerWidget {
  const ServerUrlTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final automaticSwitching = ref.watch(automaticUrlSwitchingProvider);
    final manualServerUrl = ref.watch(serverUrlProvider);
    final activeServerUrlAsync = ref.watch(activeServerUrlProvider);

    // Show appropriate URL based on automatic switching state
    String? displayUrl;
    if (automaticSwitching == true) {
      displayUrl = activeServerUrlAsync.when(
        data: (url) => url,
        loading: () => null,
        error: (_, __) => null,
      );
    } else {
      displayUrl = manualServerUrl;
    }

    return ListTile(
      title: Text(context.l10n.serverUrl),
      subtitle: Text(displayUrl ?? context.l10n.serverUrlHintText),
      leading: const Icon(Icons.computer_rounded),
      onTap: automaticSwitching == true
          ? () => const ServerSettingsRoute().go(context)
          : () => _showServerUrlDialog(context, ref),
    );
  }

  void _showServerUrlDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => _ServerUrlDialog(
        currentUrl: ref.read(serverUrlProvider),
        onSave: (newUrl) {
          ref.read(serverUrlProvider.notifier).update(newUrl);
        },
      ),
    );
  }
}

class _ServerUrlDialog extends StatefulWidget {
  const _ServerUrlDialog({
    required this.currentUrl,
    required this.onSave,
  });

  final String? currentUrl;
  final void Function(String) onSave;

  @override
  State<_ServerUrlDialog> createState() => _ServerUrlDialogState();
}

class _ServerUrlDialogState extends State<_ServerUrlDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.currentUrl ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.serverUrl),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: InputDecoration(
          hintText: context.l10n.serverUrlHintText,
          border: const OutlineInputBorder(),
        ),
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            widget.onSave(value);
            Navigator.of(context).pop();
          }
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(context.l10n.cancel),
        ),
        TextButton(
          onPressed: () {
            if (_controller.text.isNotEmpty) {
              widget.onSave(_controller.text);
              Navigator.of(context).pop();
            }
          },
          child: Text(context.l10n.save),
        ),
      ],
    );
  }
}
