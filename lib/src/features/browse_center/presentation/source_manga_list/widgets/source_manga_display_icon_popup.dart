// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../../../constants/db_keys.dart';
import '../../../../../constants/enum.dart';
import '../../../../../utils/extensions/custom_extensions/context_extensions.dart';
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
          onChange: (enumValue) => ref
              .read(sourceDisplayModeProvider.notifier)
              .update(enumValue)
              .then((value) => context.navPop()),
        ),
      ),
    );
  }
}
