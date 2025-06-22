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
    final activeServerUrlAsync = ref.watch(activeServerUrlProvider);
    return ListTile(
      title: Text(context.l10n.serverUrl),
      subtitle: activeServerUrlAsync.when(
        data: (url) => Text(url ?? context.l10n.serverUrlHintText),
        loading: () => Text(context.l10n.serverUrlHintText),
        error: (_, __) => Text(context.l10n.serverUrlHintText),
      ),
      leading: const Icon(Icons.computer_rounded),
      onTap: () => const ServerSettingsRoute().go(context),
    );
  }
}
