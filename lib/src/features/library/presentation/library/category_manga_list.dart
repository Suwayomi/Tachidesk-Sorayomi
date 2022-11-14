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
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../../constants/app_sizes.dart';
import '../../../../constants/enum.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../routes/router_config.dart';
import '../../../../utils/extensions/custom_extensions/iterable_extensions.dart';
import '../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../widgets/emoticons.dart';
import '../../../../widgets/manga_cover/grid/manga_cover_grid_tile.dart';
import '../../../../widgets/manga_cover/list/manga_cover_list_tile.dart';
import '../../../../widgets/manga_cover/list/manga_cover_with_description_tile.dart';
import 'controller/library_controller.dart';

class CategoryMangaList extends ConsumerWidget {
  const CategoryMangaList({super.key, required this.categoryId});
  final int categoryId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider =
        categoryMangaListWithQueryAndFilterProvider(categoryId: categoryId);
    final mangaList = ref.watch(provider);
    final displayMode = ref.watch(libraryDisplayModeProvider);
    refresh() => ref.read(provider.notifier).invalidate();
    return mangaList.when(
      data: (data) {
        if (data.isBlank) {
          return Emoticons(
            text: LocaleKeys.noCategoryMangaFound.tr(),
            button: TextButton(
              onPressed: refresh,
              child: Text(LocaleKeys.refresh.tr()),
            ),
          );
        }
        late final Widget mangaList;
        switch (displayMode) {
          case DisplayMode.grid:
            mangaList = GridView.builder(
              gridDelegate: gridSize,
              itemCount: data?.length ?? 0,
              itemBuilder: (context, index) => MangaCoverGridTile(
                manga: data![index],
                onPressed: () {
                  context.push(Routes.getManga(data[index].id));
                },
                needCountBadges: true,
              ),
            );
            break;
          case DisplayMode.list:
            mangaList = ListView.builder(
              itemCount: data?.length ?? 0,
              itemBuilder: (context, index) => MangaCoverListTile(
                manga: data![index],
                onPressed: () {
                  context.push(Routes.getManga(data[index].id));
                },
                needCountBadges: true,
              ),
            );
            break;
          case DisplayMode.listDescription:
            mangaList = ListView.builder(
              itemCount: data?.length ?? 0,
              itemBuilder: (context, index) => MangaCoverWithDescriptionTile(
                manga: data![index],
                onPressed: () {
                  context.push(Routes.getManga(data[index].id));
                },
                showCountBadges: true,
              ),
            );
            break;
          default:
        }
        return RefreshIndicator(
          onRefresh: () async => refresh(),
          child: mangaList,
        );
      },
      error: (e, s) => Emoticons(
        text: e.toString(),
        button: TextButton(
          onPressed: refresh,
          child: Text(LocaleKeys.refresh.tr()),
        ),
      ),
      loading: () => const CenterCircularProgressIndicator(),
    );
  }
}
