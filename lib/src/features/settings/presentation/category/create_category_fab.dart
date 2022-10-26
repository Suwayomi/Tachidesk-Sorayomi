import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/context_extensions.dart';

import '../../../../i18n/locale_keys.g.dart';
import '../../../../widgets/custom_circular_progress_indicator.dart';
import 'controller/edit_category_controller.dart';
import 'edit_category_dialog.dart';

class CreateCategoryFab extends HookConsumerWidget {
  const CreateCategoryFab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    return FloatingActionButton.extended(
      onPressed: isLoading.value
          ? null
          : () {
              showDialog(
                context: context,
                builder: (context) => EditCategoryDialog(
                  editCategory: (newCategory) async {
                    isLoading.value = true;
                    await ref
                        .read(categoryControllerProvider.notifier)
                        .editCategory(newCategory);
                    isLoading.value = false;
                  },
                ),
              );
            },
      isExtended: context.isTablet && !isLoading.value,
      label: Text(LocaleKeys.editCategoriesScreen_add.tr()),
      icon: isLoading.value
          ? MiniCircularProgressIndicator(color: context.theme.iconTheme.color)
          : const Icon(Icons.add_rounded),
    );
  }
}
