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
import '../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../widgets/emoticons.dart';
import '../../domain/category/category_model.dart';
import 'category_create_fab.dart';
import 'category_tile.dart';
import 'controller/edit_category_controller.dart';

class EditCategoryScreen extends HookConsumerWidget {
  const EditCategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toast = ref.watch(toastProvider(context));
    final categoryController = ref.watch(categoryControllerProvider)
      ..showToastOnError(toast);
    final categoryList = ref.watch(categoryListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.editCategoriesScreen_editCategory.tr()),
      ),
      floatingActionButton: categoryController.asError?.error != null
          ? null
          : const CategoryCreateFab(),
      body: categoryController.when(
        data: (data) {
          if (categoryList.isEmpty) {
            return Emoticons(
              text: LocaleKeys.editCategoriesScreen_emptyCategory.tr(),
              button: TextButton(
                onPressed: () => ref.refresh(categoryControllerProvider.future),
                child: Text(LocaleKeys.common_refresh.tr()),
              ),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () => ref.refresh(categoryControllerProvider.future),
              child: ReorderableListView.builder(
                buildDefaultDragHandles: false,
                itemCount: categoryList.length,
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
                footer: Box.h96.size,
                onReorder: (int oldIndex, int newIndex) async {
                  if (oldIndex < newIndex) newIndex -= 1;
                  await ref
                      .read(categoryControllerProvider.notifier)
                      .reorderCategory(oldIndex + 1, newIndex + 1);
                },
                itemBuilder: (context, index) {
                  final category = categoryList[index];
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
        error: (error, stackTrace) => Emoticons(
          text: error.toString(),
          button: TextButton(
            onPressed: () => ref.refresh(categoryControllerProvider.future),
            child: Text(LocaleKeys.common_refresh.tr()),
          ),
        ),
        loading: () => const CenterCircularProgressIndicator(),
      ),
    );
  }
}
