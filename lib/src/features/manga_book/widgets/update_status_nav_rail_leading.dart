// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/gen/assets.gen.dart';

import '../../../routes/router_config.dart';
import '../../../utils/extensions/custom_extensions.dart';
import '../data/updates/updates_repository.dart';
import 'update_status_summary_sheet.dart';

class UpdateStatusNavRailLeading extends ConsumerWidget {
  const UpdateStatusNavRailLeading({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updateStatus = ref.watch(updatesSocketProvider);
    final shoeUpdateStatus =
        (updateStatus.valueOrNull?.showUpdateStatus).ifNull();

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
            ? Text(context.l10n!.appTitle)
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
