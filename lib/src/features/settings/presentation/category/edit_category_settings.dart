// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../../constants/app_sizes.dart';
import '../../../../constants/gen/assets.gen.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/async_value_extensions.dart';
import '../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../utils/misc/toast.dart';
import '../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../widgets/emoticons.dart';
import '../../domain/category/category_model.dart';
import 'category_tile.dart';
import 'controller/edit_category_controller.dart';
import 'create_category_fab.dart';

// 🐦 Flutter imports:

// 📦 Package imports:

// 🌎 Project imports:

final categoryListProvider = Provider((ref) {
  final categoryList = List<Category>.from(
      ref.watch(categoryControllerProvider).asData?.value ?? []);
  if (categoryList.isNotEmpty) categoryList.removeAt(0);
  return categoryList;
});

class EditCategorySettings extends HookConsumerWidget {
  const EditCategorySettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toast = ref.watch(toastProvider(context));
    final categoryController = ref.watch(categoryControllerProvider);
    final categoryList = ref.watch(categoryListProvider);

    ref.listen(
      categoryControllerProvider,
      ((_, state) => state.showToastOnError(toast)),
    );

    useEffect(() {
      Future.microtask(
        ref.read(categoryControllerProvider.notifier).loadCategories,
      );
      return;
    }, []);

    final Widget body;

    if (categoryController.isLoading) {
      body = const CenterCircularProgressIndicator();
    } else {
      if (categoryController.asError?.error != null) {
        body = Emoticons(
          text: categoryController.asError?.error.toString(),
          button: TextButton(
            onPressed:
                ref.read(categoryControllerProvider.notifier).loadCategories,
            child: Text(LocaleKeys.common_refresh.tr()),
          ),
        );
      } else {
        if (categoryList.isEmpty) {
          body = Emoticons(
            text: LocaleKeys.editCategoriesScreen_emptyCategory.tr(),
          );
        } else {
          body = RefreshIndicator(
            onRefresh:
                ref.read(categoryControllerProvider.notifier).loadCategories,
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
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.editCategoriesScreen_editCategory.tr()),
      ),
      floatingActionButton: categoryController.asError?.error != null
          ? null
          : const CreateCategoryFab(),
      body: body,
    );
  }
}
