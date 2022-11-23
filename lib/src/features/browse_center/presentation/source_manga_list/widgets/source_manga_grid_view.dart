// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// 🌎 Project imports:
import '../../../../../widgets/manga_cover/grid/manga_cover_grid_tile.dart';
import '../../../../../constants/app_sizes.dart';
import '../../../../../i18n/locale_keys.g.dart';
import '../../../../../routes/router_config.dart';
import '../../../../../widgets/emoticons.dart';
import '../../../../manga_book/domain/manga/manga_model.dart';
import '../../../domain/source/source_model.dart';

class SourceMangaGridView extends StatelessWidget {
  const SourceMangaGridView({Key? key, required this.controller, this.source})
      : super(key: key);
  final PagingController<int, Manga> controller;
  final Source? source;
  @override
  Widget build(BuildContext context) {
    return PagedGridView(
      pagingController: controller,
      builderDelegate: PagedChildBuilderDelegate<Manga>(
        firstPageErrorIndicatorBuilder: (context) => Emoticons(
          text: controller.error.toString(),
          button: TextButton(
            onPressed: () => controller.refresh(),
            child: Text(LocaleKeys.retry.tr()),
          ),
        ),
        noItemsFoundIndicatorBuilder: (context) => Emoticons(
          text: LocaleKeys.noUpdatesFound.tr(),
          button: TextButton(
            onPressed: () => controller.refresh(),
            child: Text(LocaleKeys.refresh.tr()),
          ),
        ),
        itemBuilder: (context, item, index) => MangaCoverGridTile(
          manga: item.copyWith(source: source),
          showDarkOverlay: item.inLibrary ?? false,
          onPressed: () {
            if (item.id != null) {
              context.push(Routes.getManga(item.id!));
            }
          },
        ),
      ),
      gridDelegate: mangaCoverGridDelegate,
    );
  }
}
