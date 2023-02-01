// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../constants/enum.dart';
import '../../../../../global_providers/global_providers.dart';
import '../../../../../i18n/locale_keys.g.dart';
import '../../../../../widgets/radio_list_popup.dart';

class AuthTypeTile extends ConsumerWidget {
  const AuthTypeTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authType = ref.watch(authTypeKeyProvider);
    return ListTile(
      leading: const Icon(Icons.security_rounded),
      subtitle: authType != null ? Text(authType.toString().tr()) : null,
      title: Text(LocaleKeys.baseAuthType.tr()),
      onTap: () => showDialog(
        context: context,
        builder: (context) => RadioListPopup<AuthType>(
          title: LocaleKeys.baseAuthType.tr(),
          optionList: AuthType.values,
          value: authType ?? AuthType.none,
          onChange: (enumValue) {
            ref.read(authTypeKeyProvider.notifier).update(enumValue);
            context.pop();
          },
        ),
      ),
    );
  }
}
