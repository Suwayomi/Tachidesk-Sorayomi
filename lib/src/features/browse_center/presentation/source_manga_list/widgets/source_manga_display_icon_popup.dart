// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../constants/db_keys.dart';
import '../../../../../constants/enum.dart';
import '../../../../../widgets/enum_popup.dart';
import '../controller/source_manga_controller.dart';

class SourceMangaDisplayIconPopup extends ConsumerWidget {
  const SourceMangaDisplayIconPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayMode = ref.watch(sourceDisplayModeProvider) ??
        DBKeys.sourceDisplayMode.initial;
    return IconButton(
      icon: Icon(displayMode?.icon),
      onPressed: () => showDialog(
        context: context,
        builder: (context) => EnumPopup<DisplayMode>(
          enumList: DisplayMode.sourceDisplayList,
          value: displayMode,
          onChange: (enumValue) async {
            await ref
                .read(sourceDisplayModeProvider.notifier)
                .update(enumValue);
            if (context.mounted) context.pop();
          },
        ),
      ),
    );
  }
}
