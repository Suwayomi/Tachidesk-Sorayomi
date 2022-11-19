// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../utils/extensions/custom_extensions/async_value_extensions.dart';
import '../../../i18n/locale_keys.g.dart';
import '../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../utils/extensions/custom_extensions/int_extensions.dart';
import '../../../utils/extensions/custom_extensions/iterable_extensions.dart';
import '../../../widgets/manga_cover/list/manga_cover_list_tile.dart';
import '../data/updates/updates_repository.dart';
import '../domain/manga/manga_model.dart';
import '../domain/update_status/update_status_model.dart';
import 'update_status_popup_menu.dart';

class UpdateStatusSummaryDialog extends ConsumerWidget {
  const UpdateStatusSummaryDialog({super.key});

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
      body: finalStatus.showUiWhenData(
        refresh: () => ref.invalidate(updateSummaryProvider),
        data: (data) => RefreshIndicator(
          onRefresh: () => ref.refresh(updateSummaryProvider.future),
          child: ListView(
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
        ),
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
