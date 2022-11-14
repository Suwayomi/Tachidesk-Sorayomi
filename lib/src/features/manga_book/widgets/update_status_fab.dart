// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../data/manga_book_repository.dart';
import 'update_status_summary_sheet.dart';

class UpdateStatusFab extends ConsumerWidget {
  const UpdateStatusFab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updateStatus = ref.watch(updatesSocketProvider);
    return (updateStatus.valueOrNull?.showUpdateStatus ?? false)
        ? FloatingActionButton(
            onPressed: () {
              showUpdateStatusSummaryBottomSheet(context);
            },
            child: Text("${updateStatus.valueOrNull?.updateChecked}"
                "/${updateStatus.valueOrNull?.total}"),
          )
        : const SizedBox.shrink();
  }
}
