// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../utils/hooks/hook_primitives_wrapper.dart';
import '../../../../../widgets/custom_circular_progress_indicator.dart';
import '../controller/edit_category_controller.dart';
import 'edit_category_dialog.dart';

class CategoryCreateFab extends HookConsumerWidget {
  const CategoryCreateFab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (isLoading, setIsLoading) = useStateRecord(false);
    return FloatingActionButton.extended(
      onPressed: isLoading
          ? null
          : () {
              showDialog(
                context: context,
                builder: (context) => EditCategoryDialog(
                  editCategory: (newCategory) async {
                    try {
                      setIsLoading(true);
                      await ref
                          .read(categoryControllerProvider.notifier)
                          .editCategory(newCategory);
                      setIsLoading(false);
                    } catch (e) {
                      //
                    }
                  },
                ),
              );
            },
      isExtended: context.isTablet && !isLoading,
      label: Text(context.l10n!.addCategory),
      icon: isLoading
          ? MiniCircularProgressIndicator(color: context.iconColor)
          : const Icon(Icons.add_rounded),
    );
  }
}
