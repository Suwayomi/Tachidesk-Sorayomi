// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../../constants/db_keys.dart';
import '../../../../constants/enum.dart';
import 'controller/library_controller.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../widgets/enum_popup.dart';
import '../../../../widgets/custom_checkbox_list_tile.dart';
import '../../../../widgets/manga_cover/widgets/badge/badge.dart';

class LibraryDisplay extends ConsumerWidget {
  const LibraryDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayMode = ref.watch(libraryDisplayModeProvider);
    return ListView(
      children: [
        const Divider(height: .5),
        ListTile(
          title: Text(
            LocaleKeys.displayMode.tr(),
            style: context.textTheme.labelLarge,
          ),
          dense: true,
        ),
        EnumRadio<DisplayMode>(
          enumList: DisplayMode.values,
          value: displayMode ?? DBKeys.displayMode.initial,
          onChange: (value) =>
              ref.read(libraryDisplayModeProvider.notifier).update(value),
        ),
        ListTile(
          title: Text(
            LocaleKeys.badges.tr(),
            style: context.textTheme.labelLarge,
          ),
          dense: true,
        ),
        CustomCheckboxListTile(
          title: LocaleKeys.downloaded.tr(),
          provider: downloadedBadgeProvider,
          onChanged: ref.read(downloadedBadgeProvider.notifier).update,
          tristate: false,
        ),
        CustomCheckboxListTile(
          title: LocaleKeys.unread.tr(),
          provider: unreadBadgeProvider,
          onChanged: ref.read(unreadBadgeProvider.notifier).update,
          tristate: false,
        ),
      ],
    );
  }
}
