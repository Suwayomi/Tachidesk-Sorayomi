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
import '../../../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../../../utils/mixin/shared_preferences_client_mixin.dart';
import '../../../../../../../widgets/input_popup/domain/input_popup_type.dart';
import '../../../../../../../widgets/input_popup/input_popup.dart';
import 'server_search_button.dart';

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
    final serverUrl = ref.watch(serverUrlProvider);
    return InputPopup(
      title: context.l10n.serverUrl,
      subtitle: serverUrl,
      leading: const Icon(Icons.computer_rounded),
      trailing: !kIsWeb ? const ServerSearchButton() : null,
      type: InputPopupType.textField(hintText: context.l10n.serverUrlHintText),
      value: serverUrl,
      onChange: (value) {
        final tempUrl =
            value.endsWith('/') ? value.substring(0, value.length - 1) : value;
        ref.read(serverUrlProvider.notifier).update(tempUrl);
      },
    );
  }
}
