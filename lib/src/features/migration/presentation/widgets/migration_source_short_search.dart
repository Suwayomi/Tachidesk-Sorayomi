// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../routes/router_config.dart';
import '../../../../utils/extensions/custom_extensions.dart';
import '../../../../widgets/manga_cover/grid/manga_cover_grid_tile.dart';
import '../../../browse_center/domain/source/source_model.dart';
import '../../../manga_book/domain/manga/manga_model.dart';
import '../../domain/migration_models.dart';

class MigrationSourceShortSearch extends StatelessWidget {
  const MigrationSourceShortSearch({
    super.key,
    required this.source,
    required this.mangaList,
    required this.sourceManga,
    this.query,
  });

  final SourceDto source;
  final AsyncValue<List<MangaDto>> mangaList;
  final MangaDto sourceManga;
  final String? query;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(source.displayName),
          trailing: const Icon(Icons.arrow_forward_rounded),
          onTap: () {
            // Navigate to source for detailed search
            // For now, we'll keep it simple and not navigate
          },
        ),
        mangaList.showUiWhenData(
          context,
          (data) => data.isEmpty
              ? Padding(
                  padding: KEdgeInsets.h16v4.size,
                  child: Text(context.l10n.noResultFound),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (final manga in data)
                        SizedBox(
                          width: 144,
                          height: 192,
                          child: MangaCoverGridTile(
                            manga: manga,
                            showDarkOverlay: manga.inLibrary.ifNull(),
                            onPressed: () => _onMangaSelected(context, manga),
                          ),
                        ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }

  void _onMangaSelected(BuildContext context, MangaDto targetManga) {
    // Navigate to migration preview screen with proper data class
    MigrationPreviewRoute(
      $extra: MigrationPreviewRouteData(
        sourceManga: sourceManga,
        targetManga: targetManga,
        targetSource: source,
      ),
    ).push(context);
  }
}
