// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../constants/app_sizes.dart';
import '../../../../../constants/enum.dart';

import '../../../../../routes/router_config.dart';
import '../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../widgets/manga_cover/grid/manga_cover_grid_tile.dart';
import '../../source_manga_list/controller/source_manga_controller.dart';
import '../controller/source_quick_search_controller.dart';

class SourceQuickSearch extends ConsumerWidget {
  const SourceQuickSearch({
    super.key,
    required this.sourceId,
    this.query,
  });
  final String sourceId;
  final String? query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final source = ref.watch(sourceProvider(sourceId));
    final mangaList =
        ref.watch(sourceQuickSearchMangaListProvider(sourceId, query: query));
    return source.showUiWhenData(
      context,
      (data) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(data?.displayName ?? data?.name ?? ""),
            trailing: const Icon(Icons.arrow_forward_rounded),
            onTap: () => context.push(
              Routes.getSourceManga(
                sourceId,
                SourceType.filter,
                query: query,
              ),
            ),
          ),
          mangaList.showUiWhenData(
              context,
              (data) => data.isEmpty
                  ? Padding(
                      padding: KEdgeInsets.h16v4.size,
                      child: Text(context.l10n!.noResultFound),
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (final i in data)
                            SizedBox(
                              width: 144,
                              height: 192,
                              child: MangaCoverGridTile(
                                manga: i,
                                showDarkOverlay: i.inLibrary.ifNull(),
                                onPressed: i.id != null
                                    ? () => context.push(Routes.getManga(i.id!))
                                    : null,
                              ),
                            ),
                        ],
                      ),
                    )),
        ],
      ),
      wrapper: (child) => ListTile(
        title: Text(context.l10n!.source),
        subtitle: child,
      ),
    );
  }
}
