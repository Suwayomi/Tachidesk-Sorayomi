// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/context_extensions.dart';

import '../../../constants/gen/assets.gen.dart';
import '../../../i18n/locale_keys.g.dart';
import '../../../routes/router_config.dart';
import '../data/manga_book_repository.dart';
import 'update_status_summary_sheet.dart';

class UpdateStatusNavRailLeading extends ConsumerWidget {
  const UpdateStatusNavRailLeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updateStatus = ref.watch(updatesSocketProvider);
    final shoeUpdateStatus =
        (updateStatus.valueOrNull?.showUpdateStatus ?? false);

    final icon = Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ImageIcon(
          AssetImage(Assets.icons.darkIcon.path),
          size: 48,
          color: shoeUpdateStatus ? Colors.grey : null,
        ),
        if (shoeUpdateStatus)
          Text(
            "${updateStatus.valueOrNull?.updateChecked}"
            "/${updateStatus.valueOrNull?.total}",
          )
      ],
    );

    onPressed() => shoeUpdateStatus
        ? showUpdateStatusSummaryBottomSheet(context)
        : context.push(Routes.about);

    if (context.isDesktop) {
      return TextButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: context.isDesktop
            ? Text(LocaleKeys.appTitle.tr())
            : const SizedBox.shrink(),
        style: TextButton.styleFrom(
          foregroundColor: context.textTheme.bodyLarge?.color,
        ),
      );
    } else {
      return IconButton(
        onPressed: onPressed,
        icon: icon,
      );
    }
  }
}
