// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../constants/app_sizes.dart';
import '../../../../../routes/router_config.dart';
import '../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../../widgets/emoticons.dart';
import '../../../../../widgets/manga_cover/list/manga_cover_list_tile.dart';
import '../../../../manga_book/domain/manga/manga_model.dart';
import '../../../domain/source/source_model.dart';

class SourceMangaListView extends StatelessWidget {
  const SourceMangaListView({super.key, required this.controller, this.source});
  final PagingController<int, Manga> controller;
  final Source? source;
  @override
  Widget build(BuildContext context) {
    return PagedListView(
      pagingController: controller,
      builderDelegate: PagedChildBuilderDelegate<Manga>(
        firstPageProgressIndicatorBuilder: (context) =>
            const CenterSorayomiShimmerIndicator(),
        newPageProgressIndicatorBuilder: (context) => Row(
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: ClipRRect(
                borderRadius: KBorderRadius.r8.radius,
                child: const SorayomiShimmerIndicator(),
              ),
            ),
            Padding(
              padding: KEdgeInsets.h8.size,
              child: Shimmer.fromColors(
                baseColor: context.colorScheme.background,
                highlightColor: context.theme.indicatorColor,
                child: Container(
                  width: context.width * .3,
                  decoration: BoxDecoration(
                    borderRadius: KBorderRadius.r8.radius,
                    color: Colors.white,
                  ),
                  height: 12,
                ),
              ),
            ),
            const Spacer()
          ],
        ),
        firstPageErrorIndicatorBuilder: (context) => Emoticons(
          text: controller.error.toString(),
          button: TextButton(
            onPressed: () => controller.refresh(),
            child: Text(context.l10n!.retry),
          ),
        ),
        noItemsFoundIndicatorBuilder: (context) => Emoticons(
          text: context.l10n!.noMangaFound,
          button: TextButton(
            onPressed: () => controller.refresh(),
            child: Text(context.l10n!.refresh),
          ),
        ),
        itemBuilder: (context, item, index) => MangaCoverListTile(
          manga: item.copyWith(source: source),
          onPressed: () {
            if (item.id != null) {
              MangaRoute(mangaId: item.id!).push(context);
            }
          },
        ),
      ),
    );
  }
}
