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
import '../../../../constants/app_sizes.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/async_value_extensions.dart';
import '../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../utils/extensions/custom_extensions/int_extensions.dart';
import '../../../../utils/extensions/custom_extensions/iterable_extensions.dart';
import '../../../../utils/misc/toast/toast.dart';
import '../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../widgets/search_field.dart';
import '../../../manga_book/widgets/update_status_popup_menu.dart';
import '../category/controller/edit_category_controller.dart';
import 'category_manga_list.dart';
import 'controller/library_controller.dart';
import 'library_organizer.dart';

class LibraryScreen extends HookConsumerWidget {
  const LibraryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toast = ref.watch(toastProvider(context));
    final categoryProvider = ref.watch(categoryControllerProvider);
    categoryProvider.whenOrNull(
      loading: () => const CenterCircularProgressIndicator(),
      error: (e, s) =>
          categoryProvider.showToastOnError(toast, withMicrotask: true),
    );

    final categoryList = ref.watch(categoryListProvider(getDefault: true));
    final showSearch = ref.watch(libraryScreenShowSearchProvider);
    return DefaultTabController(
      length: categoryList.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.library.tr()),
          bottom: categoryList.length.isGreaterThan(1)
              ? TabBar(
                  padding: KEdgeInsets.a8.size,
                  isScrollable: true,
                  labelColor: context.theme.indicatorColor,
                  unselectedLabelColor: context.textTheme.bodyLarge!.color,
                  indicator: BoxDecoration(
                    borderRadius: KBorderRadius.r16.radius,
                    color: context.theme.indicatorColor.withOpacity(.3),
                  ),
                  tabs:
                      categoryList.map((e) => Tab(text: e.name ?? "")).toList(),
                )
              : null,
          actions: [
            IconButton(
              onPressed:
                  ref.read(libraryScreenShowSearchProvider.notifier).toggle,
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
                      builder: (_) => const LibraryOrganizer(),
                    );
                  }
                },
                icon: const Icon(Icons.filter_list_rounded),
              ),
            ),
            Builder(
              builder: (context) {
                return UpdateStatusPopupMenu(
                  getCategoryId: () => categoryList.isNotBlank
                      ? categoryList[
                              DefaultTabController.of(context)?.index ?? 0]
                          .id
                      : null,
                );
              },
            ),
          ],
        ),
        endDrawerEnableOpenDragGesture: false,
        endDrawer: const Drawer(child: LibraryOrganizer()),
        body: categoryList.isEmpty
            ? const CenterCircularProgressIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (showSearch)
                    SearchField(
                      onChanged: (text) =>
                          ref.read(libraryQueryProvider.notifier).state = text,
                      onClose: ref
                          .read(libraryScreenShowSearchProvider.notifier)
                          .toggle,
                    ),
                  Expanded(
                    child: Padding(
                      padding: KEdgeInsets.a8.size,
                      child: TabBarView(
                        children: categoryList
                            .map(
                                (e) => CategoryMangaList(categoryId: e.id ?? 0))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
