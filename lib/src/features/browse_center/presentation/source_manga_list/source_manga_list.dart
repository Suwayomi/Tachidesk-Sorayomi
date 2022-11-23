// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// 🌎 Project imports:
import '../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/enum.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../routes/router_config.dart';
import '../../../../utils/extensions/custom_extensions/async_value_extensions.dart';
import '../../../../utils/extensions/custom_extensions/iterable_extensions.dart';
import '../../../../utils/hooks/paging_controller_hook.dart';
import '../../../manga_book/domain/manga/manga_model.dart';
import '../../data/source_repository/source_repository.dart';
import 'controller/source_manga_controller.dart';
import 'widgets/source_manga_display_icon_popup.dart';
import 'widgets/source_manga_display_view.dart';
import 'widgets/source_type_selectable_chip.dart';

class SourceMangaList extends HookConsumerWidget {
  const SourceMangaList({
    Key? key,
    required this.sourceId,
    required this.sourceType,
    this.query,
  }) : super(key: key);
  final String sourceId;
  final SourceType sourceType;
  final String? query;

  Future<void> _fetchPage(
    SourceRepository repository,
    PagingController<int, Manga> controller,
    int pageKey,
  ) async {
    AsyncValue.guard(
      () async => await repository.getMangaList(
        sourceId: sourceId,
        sourceType: sourceType,
        pageNum: pageKey,
      ),
    ).then(
      (value) => value.whenOrNull(
        data: (recentChaptersPage) {
          try {
            if (recentChaptersPage != null &&
                recentChaptersPage.mangaList.isNotBlank) {
              if (recentChaptersPage.hasNextPage ?? false) {
                controller.appendPage(
                  [...?recentChaptersPage.mangaList],
                  pageKey + 1,
                );
              } else {
                controller.appendLastPage([...?recentChaptersPage.mangaList]);
              }
            }
          } catch (e) {
            //
          }
        },
        error: (error, stackTrace) => controller.error = error,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final source = ref.watch(sourceProvider(sourceId));
    final controller = usePagingController<int, Manga>(firstPageKey: 1);
    final sourceRepository = ref.watch(sourceRepositoryProvider);
    useEffect(() {
      controller.addPageRequestListener(
        (pageKey) => _fetchPage(
          sourceRepository,
          controller,
          pageKey,
        ),
      );
      return;
    }, []);
    return source.showUiWhenData(
      data: (data) => Scaffold(
        appBar: AppBar(
          title: Text(data?.displayName ?? LocaleKeys.source.tr()),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_rounded),
            ),
            const SourceMangaDisplayIconPopup()
          ],
          bottom: PreferredSize(
            preferredSize: kTabSize,
            child: Column(
              children: [
                Row(
                  children: [
                    SourceTypeSelectableChip(
                      value: SourceType.popular,
                      groupValue: sourceType,
                      onSelected: (val) {
                        if (sourceType == SourceType.popular) return;
                        context.replace(
                          Routes.getSourceManga(sourceId, SourceType.popular),
                        );
                      },
                    ),
                    SourceTypeSelectableChip(
                      value: SourceType.latest,
                      groupValue: sourceType,
                      onSelected: (val) {
                        if (sourceType == SourceType.latest) return;
                        context.replace(
                          Routes.getSourceManga(sourceId, SourceType.latest),
                        );
                      },
                    ),
                    Builder(
                      builder: (context) => SourceTypeSelectableChip(
                        value: SourceType.filter,
                        groupValue: sourceType,
                        onSelected: (val) {
                          context.isTablet
                              ? Scaffold.of(context).openEndDrawer()
                              : showModalBottomSheet(
                                  context: context,
                                  builder: (context) =>
                                      const SizedBox(height: 500),
                                );
                        },
                      ),
                    ),
                  ],
                ),
                const Divider(height: 0)
              ],
            ),
          ),
        ),
        endDrawer: const Drawer(child: SizedBox()),
        body: RefreshIndicator(
            onRefresh: () async => controller.refresh(),
            child: SourceMangaDisplayView(
              controller: controller,
              source: data,
            )),
      ),
      refresh: () => ref.refresh(sourceProvider(sourceId)),
      wrapper: (body) => Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.source.tr()),
        ),
        body: body,
      ),
    );
  }
}
