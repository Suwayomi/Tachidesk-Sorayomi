// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../../global_providers/global_providers.dart';
import '../../../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../../../widgets/popup_widgets/pop_button.dart';

/// A dialog for editing global credentials
class GlobalCredentialsDialog extends HookConsumerWidget {
  const GlobalCredentialsDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final globalUsername = ref.watch(globalUsernameProvider);
    final globalPassword = ref.watch(globalPasswordProvider);

    final username = useTextEditingController(text: globalUsername ?? '');
    final password = useTextEditingController(text: globalPassword ?? '');
    final formKey = useMemoized(() => GlobalKey<FormState>(), []);

    return AlertDialog(
      title: Text(context.l10n.credentials),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: username,
              validator: (value) =>
                  value.isBlank ? (context.l10n.errorUserName) : null,
              decoration: InputDecoration(
                hintText: context.l10n.userName,
                border: const OutlineInputBorder(),
              ),
            ),
            const Gap(4),
            TextFormField(
              controller: password,
              validator: (value) =>
                  value.isBlank ? (context.l10n.errorPassword) : null,
              obscureText: true,
              decoration: InputDecoration(
                hintText: context.l10n.password,
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        const PopButton(),
        ElevatedButton(
          onPressed: () async {
            if ((formKey.currentState?.validate()).ifNull()) {
              // Update global credentials
              ref.read(globalUsernameProvider.notifier).update(username.text);
              ref.read(globalPasswordProvider.notifier).update(password.text);
              Navigator.pop(context);
            }
          },
          child: Text(context.l10n.save),
        ),
      ],
    );
  }

  /// Shows the global credentials dialog
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const GlobalCredentialsDialog(),
    );
  }
}
