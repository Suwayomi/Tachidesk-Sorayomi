// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../data/manga_book_repository.dart';
import 'update_status_popup_menu.dart';
import '../../../i18n/locale_keys.g.dart';
import '../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../utils/extensions/custom_extensions/int_extensions.dart';
import '../../../utils/extensions/custom_extensions/iterable_extensions.dart';
import '../../../widgets/custom_circular_progress_indicator.dart';
import '../../../widgets/emoticons.dart';
import '../../../widgets/manga_cover/list/manga_cover_list_tile.dart';
import '../domain/manga/manga_model.dart';
import '../domain/update_status/update_status_model.dart';

class UpdateStatusSummaryDialog extends ConsumerWidget {
  const UpdateStatusSummaryDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusUpdate = ref.watch(updateSummaryProvider);
    final statusUpdateStream = ref.watch(updatesSocketProvider);
    final AsyncValue<UpdateStatus?> finalStatus =
        statusUpdateStream.valueOrNull?.total.isGreaterThan(0) ?? false
            ? statusUpdateStream
            : statusUpdate;

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.updatesSummary.tr()),
        actions: const [
          UpdateStatusPopupMenu(showSummaryButton: false),
        ],
      ),
      body: finalStatus.when(
        data: (data) => ListView(
          children: [
            if ((data?.running).isNotBlank)
              UpdateStatusExpansionTile(
                mangas: data!.running!,
                title: LocaleKeys.running.tr(),
              ),
            if ((data?.pending).isNotBlank)
              UpdateStatusExpansionTile(
                mangas: data!.pending!,
                title: LocaleKeys.pending.tr(),
              ),
            if ((data?.completed).isNotBlank)
              UpdateStatusExpansionTile(
                mangas: data!.completed!,
                title: LocaleKeys.completed.tr(),
              ),
            if ((data?.failed).isNotBlank)
              UpdateStatusExpansionTile(
                mangas: data!.failed!,
                title: LocaleKeys.failed.tr(),
              ),
          ],
        ),
        error: (error, stackTrace) => Emoticons(
          text: error.toString(),
          button: TextButton(
            child: Text(LocaleKeys.refresh.tr()),
            onPressed: () {
              ref.invalidate(updateSummaryProvider);
            },
          ),
        ),
        loading: () => const CenterCircularProgressIndicator(),
      ),
    );
  }
}

void showUpdateStatusSummaryBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => const UpdateStatusSummaryDialog(),
  );
}

class UpdateStatusExpansionTile extends StatelessWidget {
  const UpdateStatusExpansionTile({
    super.key,
    required this.mangas,
    required this.title,
  });
  final List<Manga> mangas;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      initiallyExpanded: true,
      textColor: context.theme.indicatorColor,
      iconColor: context.theme.indicatorColor,
      children: mangas
          .map((e) => MangaCoverListTile(
                manga: e,
                needCountBadges: true,
              ))
          .toList(),
    );
  }
}
