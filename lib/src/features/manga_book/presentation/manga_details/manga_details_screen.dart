// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../routes/router_config.dart';
import '../../../../utils/extensions/custom_extensions.dart';
import '../../../../utils/misc/toast/toast.dart';
import '../../../../widgets/emoticons.dart';
import '../../domain/chapter/chapter_model.dart';
import '../../widgets/chapter_actions/multi_chapters_actions_bottom_app_bar.dart';
import 'controller/manga_details_controller.dart';
import 'widgets/big_screen_manga_details.dart';
import 'widgets/edit_manga_category_dialog.dart';
import 'widgets/manga_chapter_organizer.dart';
import 'widgets/small_screen_manga_details.dart';

class MangaDetailsScreen extends HookConsumerWidget {
  const MangaDetailsScreen({super.key, required this.mangaId});
  final String mangaId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = mangaWithIdProvider(mangaId: mangaId);
    final chapterListProvider = mangaChapterListProvider(mangaId: mangaId);
    final manga = ref.watch(provider);
    final chapterList = ref.watch(chapterListProvider);
    final selectedChapters = useState<Map<int, Chapter>>({});
    refresh([onlineFetch = false]) async {
      if (context.mounted && onlineFetch) {
        ref.read(toastProvider(context)).show(
              LocaleKeys.updating.tr(),
              withMicrotask: true,
            );
      }
      await ref.read(chapterListProvider.notifier).refresh(onlineFetch);
      await ref.read(provider.notifier).refresh(onlineFetch);
      if (context.mounted && onlineFetch) {
        ref.read(toastProvider(context)).show(
              LocaleKeys.updateCompleted.tr(),
              withMicrotask: true,
            );
      }
    }

    useEffect(() {
      if (!chapterList.isLoading && !manga.isLoading) refresh();
      return;
    }, []);

    return manga.showUiWhenData(
      (data) => Scaffold(
        appBar: selectedChapters.value.isNotEmpty
            ? AppBar(
                leading: IconButton(
                  onPressed: () => selectedChapters.value = <int, Chapter>{},
                  icon: const Icon(Icons.close_rounded),
                ),
                title: Text(
                  LocaleKeys.numSelected.tr(
                    namedArgs: {"num": "${selectedChapters.value.length}"},
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      selectedChapters.value = {
                        for (Chapter i in [
                          ...?ref.read(mangaChapterListWithFilterProvider(
                              mangaId: mangaId))
                        ])
                          i.id ?? -1: i
                      };
                    },
                    icon: const Icon(Icons.select_all_rounded),
                  ),
                  IconButton(
                    onPressed: () {
                      final newMap = {
                        for (Chapter i in [
                          ...?ref.read(mangaChapterListWithFilterProvider(
                              mangaId: mangaId))
                        ])
                          i.id ?? -1: i
                      }..removeWhere((key, value) =>
                          selectedChapters.value.containsKey(key));
                      selectedChapters.value = newMap;
                    },
                    icon: const Icon(Icons.flip_to_back_rounded),
                  ),
                ],
              )
            : AppBar(
                title: Text(data?.title ?? LocaleKeys.manga.tr()),
                actions: [
                  if (context.isTablet)
                    IconButton(
                      onPressed: () => refresh(true),
                      icon: const Icon(Icons.refresh_rounded),
                    ),
                  Builder(
                    builder: (context) => IconButton(
                      onPressed: () {
                        if (context.isTablet) {
                          Scaffold.of(context).openEndDrawer();
                        } else {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: KBorderRadius.rT16.radius,
                            ),
                            clipBehavior: Clip.hardEdge,
                            builder: (_) => const MangaChapterOrganizer(),
                          );
                        }
                      },
                      icon: const Icon(Icons.filter_list_rounded),
                    ),
                  ),
                  PopupMenuButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: KBorderRadius.r16.radius,
                    ),
                    icon: const Icon(Icons.more_vert_rounded),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        onTap: () => Future.microtask(
                          () => showDialog(
                            context: context,
                            builder: (context) =>
                                EditMangaCategoryDialog(mangaId: mangaId),
                          ),
                        ),
                        child: Text(LocaleKeys.editCategory.tr()),
                      ),
                      if (!context.isTablet)
                        PopupMenuItem(
                          onTap: () => refresh(true),
                          child: Text(LocaleKeys.refresh.tr()),
                        ),
                    ],
                  )
                ],
              ),
        endDrawer: const Drawer(
          width: kDrawerWidth,
          child: MangaChapterOrganizer(),
        ),
        bottomSheet: selectedChapters.value.isNotEmpty
            ? MultiChaptersActionsBottomAppBar(
                afterOptionSelected: () async =>
                    ref.read(chapterListProvider.notifier).refresh(),
                selectedChapters: selectedChapters,
              )
            : null,
        floatingActionButton: FloatingActionButton.extended(
          isExtended: context.isTablet,
          label: Text(
            data?.lastChapterRead?.index != null
                ? LocaleKeys.resume.tr()
                : LocaleKeys.start.tr(),
          ),
          icon: const Icon(Icons.play_arrow_rounded),
          onPressed: () {
            context.push(
              Routes.getReader(
                  "${data?.id}", "${data?.lastChapterRead?.index ?? 1}"),
            );
          },
        ),
        body: data != null
            ? context.isTablet
                ? BigScreenMangaDetails(
                    chapterList: chapterList,
                    manga: data,
                    mangaId: mangaId,
                    onRefresh: refresh,
                    selectedChapters: selectedChapters,
                  )
                : SmallScreenMangaDetails(
                    chapterList: chapterList,
                    manga: data,
                    mangaId: mangaId,
                    onRefresh: refresh,
                    selectedChapters: selectedChapters,
                  )
            : Emoticons(
                text: LocaleKeys.noMangaFound.toString(),
                button: TextButton(
                  onPressed: refresh,
                  child: Text(LocaleKeys.refresh.tr()),
                ),
              ),
      ),
      refresh: refresh,
      wrapper: (body) => Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.manga.tr()),
          centerTitle: true,
        ),
        body: body,
      ),
    );
  }
}
