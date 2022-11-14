// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import 'controller/library_controller.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../widgets/custom_checkbox_list_tile.dart';

class LibraryFilter extends ConsumerWidget {
  const LibraryFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        const Divider(height: .5),
        CustomCheckboxListTile(
          title: LocaleKeys.unread.tr(),
          provider: filterUnreadProvider,
          onChanged: ref.read(filterUnreadProvider.notifier).update,
        ),
        CustomCheckboxListTile(
          title: LocaleKeys.completed.tr(),
          provider: filterCompletedProvider,
          onChanged: ref.read(filterCompletedProvider.notifier).update,
        ),
        CustomCheckboxListTile(
          title: LocaleKeys.downloaded.tr(),
          provider: filterDownloadedProvider,
          onChanged: ref.read(filterDownloadedProvider.notifier).update,
        ),
      ],
    );
  }
}
