// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tachidesk_sorayomi/src/features/library/presentation/category/controller/edit_category_controller.dart';
import 'package:tachidesk_sorayomi/src/features/manga_book/presentation/manga_details/controller/manga_details_controller.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/async_value_extensions.dart';
import 'package:tachidesk_sorayomi/src/widgets/loading_widgets/loading_checkbox_list_tile.dart';

import '../../../../../widgets/pop_button.dart';
import '../../../data/manga_book_repository.dart';

class EditMangaCategoryDialog extends HookConsumerWidget {
  const EditMangaCategoryDialog({
    Key? key,
    required this.mangaId,
  }) : super(key: key);
  final String mangaId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryList = ref.watch(categoryListProvider());
    final provider = mangaCategoryListProvider(mangaId);
    final mangaCategoryList = ref.watch(provider);
    return AlertDialog(
      title: Text(LocaleKeys.editCategory.tr()),
      content: categoryList.showUiWhenData(
        (data) => data.isEmpty
            ? Text(LocaleKeys.noCategoriesFoundAlt.tr())
            : SingleChildScrollView(
                child: mangaCategoryList.showUiWhenData(
                  (selectedCategoryList) => Column(
                    children: [
                      for (int index = 0; index < data.length; index++)
                        LoadingCheckboxListTile(
                          onChanged: (value) async {
                            await AsyncValue.guard(
                              () => value
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
                          title: data[index].name ?? LocaleKeys.category.tr(),
                        ),
                    ],
                  ),
                ),
              ),
      ),
      actions: [
        PopButton(
          popText: LocaleKeys.close.tr(),
        ),
      ],
    );
  }
}
