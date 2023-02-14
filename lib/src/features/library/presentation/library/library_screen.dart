// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions.dart';
import '../../../../utils/misc/toast/toast.dart';
import '../../../../widgets/emoticons.dart';
import '../../../../widgets/search_field.dart';
import '../../../manga_book/widgets/update_status_popup_menu.dart';
import '../category/controller/edit_category_controller.dart';
import 'category_manga_list.dart';
import 'controller/library_controller.dart';
import 'widgets/library_manga_organizer.dart';

class LibraryScreen extends HookConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toast = ref.watch(toastProvider(context));
    final categoryList = ref.watch(categoryListProvider(getDefault: true))
      ..showToastOnError(toast, withMicrotask: true);
    final showSearch = useState(false);
    return categoryList.showUiWhenData(
      (data) => DefaultTabController(
        length: data.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.library.tr()),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: kCalculateAppBarBottomSize(
                [data.length.isGreaterThan(1), showSearch.value],
              ),
              child: Column(
                children: [
                  if (data.length.isGreaterThan(1))
                    TabBar(
                      isScrollable: true,
                      tabs: data.map((e) => Tab(text: e.name ?? "")).toList(),
                      dividerColor: Colors.transparent,
                    ),
                  if (showSearch.value)
                    Align(
                      alignment: Alignment.centerRight,
                      child: SearchField(
                        initialText: ref.read(libraryQueryProvider),
                        onChanged: (val) =>
                            ref.read(libraryQueryProvider.notifier).state = val,
                        onClose: () => showSearch.value = false,
                      ),
                    ),
                ],
              ),
            ),
            actions: [
              IconButton(
                onPressed: () => showSearch.value = true,
                icon: const Icon(Icons.search_rounded),
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
                        builder: (_) => const LibraryMangaOrganizer(),
                      );
                    }
                  },
                  icon: const Icon(Icons.filter_list_rounded),
                ),
              ),
              Builder(
                builder: (context) {
                  return UpdateStatusPopupMenu(
                    getCategory: () => data.isNotBlank
                        ? data[DefaultTabController.of(context).index]
                        : null,
                  );
                },
              ),
            ],
          ),
          endDrawerEnableOpenDragGesture: false,
          endDrawer: const Drawer(
            width: kDrawerWidth,
            child: LibraryMangaOrganizer(),
          ),
          body: data.isEmpty
              ? Emoticons(
                  text: LocaleKeys.noCategoryMangaFound.tr(),
                  button: TextButton(
                    onPressed: () => ref.refresh(categoryControllerProvider),
                    child: Text(LocaleKeys.refresh.tr()),
                  ),
                )
              : Padding(
                  padding: KEdgeInsets.h8.size,
                  child: TabBarView(
                    children: data
                        .map((e) => CategoryMangaList(categoryId: e.id ?? 0))
                        .toList(),
                  ),
                ),
        ),
      ),
      refresh: () => ref.refresh(categoryControllerProvider),
      wrapper: (body) => Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.library.tr()),
          centerTitle: true,
        ),
        body: body,
      ),
    );
  }
}
