// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../i18n/locale_keys.g.dart';
import '../../../routes/router_config.dart';
import '../../../utils/extensions/custom_extensions.dart';
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
        (statusUpdateStream.valueOrNull?.total.isGreaterThan(0)).ifNull()
            ? statusUpdateStream
            : statusUpdate;
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.updatesSummary.tr()),
        actions: const [UpdateStatusPopupMenu(showSummaryButton: false)],
      ),
      body: finalStatus.showUiWhenData(
        (data) => RefreshIndicator(
          onRefresh: () => ref.refresh(updateSummaryProvider.future),
          child: ListView(
            children: [
              if ((data?.running).isNotBlank)
                UpdateStatusExpansionTile(
                  mangas: data!.running!,
                  title: LocaleKeys.running.tr(),
                  initiallyExpanded: true,
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
                  initiallyExpanded: true,
                ),
            ],
          ),
        ),
        refresh: () => ref.invalidate(updateSummaryProvider),
      ),
    );
  }
}

void showUpdateStatusSummaryBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) => const UpdateStatusSummaryDialog(),
  );
}

class UpdateStatusExpansionTile extends StatelessWidget {
  const UpdateStatusExpansionTile({
    super.key,
    required this.mangas,
    required this.title,
    this.initiallyExpanded = false,
  });
  final List<Manga> mangas;
  final String title;
  final bool initiallyExpanded;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      initiallyExpanded: initiallyExpanded,
      textColor: context.theme.indicatorColor,
      iconColor: context.theme.indicatorColor,
      shape: const RoundedRectangleBorder(),
      children: mangas
          .map((e) => MangaCoverListTile(
                manga: e,
                showCountBadges: true,
                onPressed: () => context.push(
                  Routes.getManga(e.id!),
                ),
              ))
          .toList(),
    );
  }
}
