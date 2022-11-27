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
import '../../../../constants/gen/assets.gen.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/async_value_extensions.dart';
import '../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../utils/misc/toast/toast.dart';
import '../../../../widgets/emoticons.dart';
import '../../domain/category/category_model.dart';
import 'controller/edit_category_controller.dart';
import 'widgets/category_create_fab.dart';
import 'widgets/category_tile.dart';

class EditCategoryScreen extends ConsumerWidget {
  const EditCategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toast = ref.watch(toastProvider(context));
    final categoryList = ref.watch(categoryListProvider())
      ..showToastOnError(toast, withMicrotask: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.editCategory.tr()),
      ),
      floatingActionButton: categoryList.asError?.error != null
          ? null
          : const CategoryCreateFab(),
      body: categoryList.showUiWhenData(
        (data) {
          if (data.isEmpty) {
            return Emoticons(
              text: LocaleKeys.noCategoriesFound.tr(),
              button: TextButton(
                onPressed: () => ref.refresh(categoryControllerProvider.future),
                child: Text(LocaleKeys.refresh.tr()),
              ),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () => ref.refresh(categoryControllerProvider.future),
              child: ReorderableListView.builder(
                buildDefaultDragHandles: false,
                itemCount: data.length,
                header: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ImageIcon(
                      AssetImage(Assets.icons.darkIcon.path),
                      size: context.height * .2,
                    ),
                    const Divider(),
                  ],
                ),
                footer: KSizedBox.h96.size,
                onReorder: (int oldIndex, int newIndex) async {
                  if (oldIndex < newIndex) newIndex -= 1;
                  await ref
                      .read(categoryControllerProvider.notifier)
                      .reorderCategory(oldIndex + 1, newIndex + 1);
                },
                itemBuilder: (context, index) {
                  final category = data[index];
                  return CategoryTile(
                    key: ValueKey(category.id),
                    leading: ReorderableDragStartListener(
                      index: index,
                      child: const Icon(Icons.drag_handle_rounded),
                    ),
                    category: category,
                    deleteCategory: (Category category) => ref
                        .read(categoryControllerProvider.notifier)
                        .deleteCategory(category),
                    editCategory: (Category category) => ref
                        .read(categoryControllerProvider.notifier)
                        .editCategory(category),
                  );
                },
              ),
            );
          }
        },
        refresh: () => ref.refresh(categoryControllerProvider.future),
      ),
    );
  }
}
