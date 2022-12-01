// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/extensions/custom_extensions/context_extensions.dart';

class CustomCheckboxListTile<NotifierT extends AutoDisposeNotifier<bool?>>
    extends ConsumerWidget {
  const CustomCheckboxListTile({
    super.key,
    required this.title,
    required this.provider,
    required this.onChanged,
    this.tristate = true,
  });
  final String title;
  final AutoDisposeNotifierProvider<NotifierT, bool?> provider;
  final ValueChanged<bool?> onChanged;
  final bool tristate;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final val = ref.watch(provider);
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: context.theme.indicatorColor,
      value: tristate ? val : (val ?? true),
      title: Text(title),
      tristate: tristate,
      onChanged: onChanged,
    );
  }
}
