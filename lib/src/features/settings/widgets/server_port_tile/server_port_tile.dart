// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../constants/db_keys.dart';

import '../../../../utils/extensions/custom_extensions.dart';
import '../../../../utils/mixin/shared_preferences_client_mixin.dart';
import '../../../../widgets/pop_button.dart';

part 'server_port_tile.g.dart';

@riverpod
class ServerPort extends _$ServerPort with SharedPreferenceClientMixin<int> {
  @override
  int? build() => initialize(
        ref,
        key: DBKeys.serverPort.name,
        initial: DBKeys.serverPort.initial,
      );
}

@riverpod
class ServerPortToggle extends _$ServerPortToggle
    with SharedPreferenceClientMixin<bool> {
  @override
  bool? build() => initialize(
        ref,
        key: DBKeys.serverPortToggle.name,
        initial: DBKeys.serverPortToggle.initial,
      );
}

class ServerPortTile extends ConsumerWidget {
  const ServerPortTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverPort = ref.watch(serverPortProvider);
    final serverToggle = ref.watch(serverPortToggleProvider).ifNull();
    return ListTile(
      leading: const Icon(Icons.dns_rounded),
      title: Text(context.l10n!.serverPort),
      subtitle: serverToggle && serverPort != null
          ? Text(serverPort.toString())
          : null,
      trailing: Switch(
        value: serverToggle,
        onChanged: (value) {
          ref.read(serverPortToggleProvider.notifier).update(value);
        },
      ),
      onTap: serverToggle
          ? () => showDialog(
                context: context,
                builder: (context) => ServerPortField(initialPort: serverPort),
              )
          : null,
    );
  }
}

class ServerPortField extends HookConsumerWidget {
  const ServerPortField({
    this.initialPort,
    super.key,
  });
  final int? initialPort;

  void _update(int? port, WidgetRef ref) {
    ref.read(serverPortProvider.notifier).update(port);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(
      text: (initialPort ?? '').toString(),
    );
    return AlertDialog(
      title: Text(context.l10n!.serverPort),
      content: TextField(
        autofocus: true,
        controller: controller,
        onSubmitted: (value) {
          _update(int.tryParse(controller.text), ref);
          context.pop();
        },
        keyboardType: TextInputType.number,
        maxLength: 5,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          counter: const SizedBox.shrink(),
          border: const OutlineInputBorder(),
          hintText: (context.l10n!.serverPortHintText),
        ),
      ),
      actions: [
        const PopButton(),
        ElevatedButton(
          onPressed: () {
            _update(int.tryParse(controller.text), ref);
            context.pop();
          },
          child: Text(context.l10n!.save),
        ),
      ],
    );
  }
}
