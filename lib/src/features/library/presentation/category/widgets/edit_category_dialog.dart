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

import '../../../../../i18n/locale_keys.g.dart';
import '../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../utils/misc/toast/toast.dart';
import '../../../../../widgets/pop_button.dart';
import '../../../domain/category/category_model.dart';

class EditCategoryDialog extends HookConsumerWidget {
  const EditCategoryDialog({
    super.key,
    required this.editCategory,
    this.category,
  });
  final Category? category;
  final void Function(Category) editCategory;

  Future<void> submitEditCategory(
    String categoryName,
    bool defaultCategory,
  ) async {
    return editCategory((category ?? Category())
        .copyWith(name: categoryName, defaultCategory: defaultCategory));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryName = useTextEditingController(text: category?.name);
    final defaultCategory = useState((category?.defaultCategory).ifNull());
    return AlertDialog(
      title: Text(
        category == null
            ? LocaleKeys.addCategory.tr()
            : LocaleKeys.editCategory.tr(),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: categoryName,
            autofocus: true,
            decoration: InputDecoration(
              hintText: LocaleKeys.editCategory.tr(),
              border: const OutlineInputBorder(),
            ),
            onSubmitted: (categoryName.text).isNotBlank
                ? (text) {
                    submitEditCategory(
                      categoryName.text,
                      defaultCategory.value,
                    );
                    context.pop();
                  }
                : null,
          ),
          CheckboxListTile(
            value: defaultCategory.value,
            dense: true,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (value) {
              if (value != null) defaultCategory.value = value;
            },
            title: Text(LocaleKeys.defaultCategory.tr()),
          )
        ],
      ),
      actions: [
        const PopButton(),
        ElevatedButton(
          onPressed: () {
            if ((categoryName.text).isBlank) {
              ref
                  .read(toastProvider(context))
                  .show(LocaleKeys.emptyCategory.tr());
              return;
            }
            submitEditCategory(categoryName.text, defaultCategory.value);
            context.pop();
          },
          child: Text(LocaleKeys.save.tr()),
        ),
      ],
    );
  }
}
