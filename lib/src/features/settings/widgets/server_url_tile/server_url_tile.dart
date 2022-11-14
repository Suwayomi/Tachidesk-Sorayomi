// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 🌎 Project imports:
import '../../../../constants/db_keys.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../utils/extensions/custom_extensions/string_extensions.dart';
import '../../../../utils/storage/local/shared_preferences_client.dart';
import '../../../../widgets/pop_button.dart';

part 'server_url_tile.g.dart';

@riverpod
class ServerUrl extends _$ServerUrl with SharedPreferenceClient<String> {
  @override
  String? build() => initialize(
        client: ref.watch(sharedPreferencesProvider),
        key: DBKeys.serverUrl.name,
        initial: DBKeys.serverUrl.initial,
      );
}

class ServerUrlTile extends ConsumerWidget {
  const ServerUrlTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverUrl = ref.watch(serverUrlProvider);
    return ListTile(
      leading: const Icon(Icons.computer_rounded),
      title: Text(LocaleKeys.url.tr()),
      subtitle: serverUrl.isNotBlank ? Text(serverUrl!) : null,
      onTap: () => showDialog(
        context: context,
        builder: (context) => ServerUrlField(initialUrl: serverUrl),
      ),
    );
  }
}

class ServerUrlField extends HookConsumerWidget {
  const ServerUrlField({
    this.initialUrl,
    super.key,
  });
  final String? initialUrl;

  void _update(String url, WidgetRef ref) {
    final tempUrl = url.endsWith('/') ? url.substring(0, url.length - 1) : url;
    ref.read(serverUrlProvider.notifier).update(tempUrl);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: initialUrl);
    return AlertDialog(
      title: Text(LocaleKeys.url.tr()),
      content: TextField(
        autofocus: true,
        controller: controller,
        onSubmitted: (value) {
          _update(controller.text, ref);
          context.navPop();
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: (LocaleKeys.urlHintText.tr()),
        ),
      ),
      actions: [
        const PopButton(),
        ElevatedButton(
          onPressed: () {
            _update(controller.text, ref);
            context.navPop();
          },
          child: Text(LocaleKeys.save.tr()),
        ),
      ],
    );
  }
}
