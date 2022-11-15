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
import '../data/updates/updates_repository.dart';
import 'update_status_summary_sheet.dart';

class UpdateStatusFab extends ConsumerWidget {
  const UpdateStatusFab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updateStatus = ref.watch(updatesSocketProvider);
    return (updateStatus.valueOrNull?.showUpdateStatus ?? false)
        ? FloatingActionButton(
            onPressed: () => showUpdateStatusSummaryBottomSheet(context),
            child: Text("${updateStatus.valueOrNull?.updateChecked}"
                "/${updateStatus.valueOrNull?.total}"),
          )
        : const SizedBox.shrink();
  }
}
