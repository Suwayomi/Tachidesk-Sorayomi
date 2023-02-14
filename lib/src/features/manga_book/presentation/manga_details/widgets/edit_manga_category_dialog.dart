// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../constants/app_sizes.dart';
import '../../../../../i18n/locale_keys.g.dart';
import '../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../widgets/pop_button.dart';
import '../../../../library/presentation/category/controller/edit_category_controller.dart';
import '../../../data/manga_book_repository.dart';
import '../controller/manga_details_controller.dart';

class EditMangaCategoryDialog extends HookConsumerWidget {
  const EditMangaCategoryDialog({
    super.key,
    required this.mangaId,
  });
  final String mangaId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryList = ref.watch(categoryListProvider());
    final provider = mangaCategoryListProvider(mangaId);
    final mangaCategoryList = ref.watch(provider);
    return AlertDialog(
      title: Text(LocaleKeys.editCategory.tr()),
      contentPadding: KEdgeInsets.h8v16.size,
      actions: [PopButton(popText: LocaleKeys.close.tr())],
      content: categoryList.showUiWhenData(
        (data) => ConstrainedBox(
          constraints: BoxConstraints(maxHeight: context.height * .4),
          child: data.isEmpty
              ? Padding(
                  padding: KEdgeInsets.h16.size,
                  child: Text(LocaleKeys.noCategoriesFoundAlt.tr()),
                )
              : SingleChildScrollView(
                  child: mangaCategoryList.showUiWhenData(
                    (selectedCategoryList) => Column(
                      children: [
                        for (int index = 0; index < data.length; index++)
                          CheckboxListTile(
                            onChanged: (value) async {
                              await AsyncValue.guard(
                                () => value.ifNull()
                                    ? ref
                                        .read(mangaBookRepositoryProvider)
                                        .addMangaToCategory(
                                          mangaId,
                                          "${data[index].id!}",
                                        )
                                    : ref
                                        .read(mangaBookRepositoryProvider)
                                        .removeMangaFromCategory(
                                          mangaId,
                                          "${data[index].id!}",
                                        ),
                              );
                              await ref.read(provider.notifier).refresh();
                            },
                            value: selectedCategoryList?.containsKey(
                                  "${data[index].id}",
                                ) ??
                                false,
                            title: Text(
                              data[index].name ?? LocaleKeys.category.tr(),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
