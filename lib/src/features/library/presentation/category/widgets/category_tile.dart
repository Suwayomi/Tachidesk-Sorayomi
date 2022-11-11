// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// 🌎 Project imports:
import '../../../../../constants/app_sizes.dart';
import '../../../../../i18n/locale_keys.g.dart';
import '../../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../domain/category/category_model.dart';
import 'delete_category_alert.dart';
import 'edit_category_dialog.dart';

class CategoryTile extends HookWidget {
  const CategoryTile({
    super.key,
    required this.category,
    required this.deleteCategory,
    required this.editCategory,
    this.leading,
  });

  final Category category;
  final Future<void> Function(Category) deleteCategory;
  final Future<void> Function(Category) editCategory;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    return ListTile(
      title: Text(category.name ?? ""),
      leading: leading,
      trailing: isLoading.value
          ? const MiniCircularProgressIndicator()
          : PopupMenuButton(
              shape: RoundedRectangleBorder(
                borderRadius: KBorderRadius.r8.radius,
              ),
              padding: EdgeInsets.zero,
              child: const Icon(Icons.more_vert_rounded),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text(LocaleKeys.edit.tr()),
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => EditCategoryDialog(
                      category: category,
                      editCategory: (newCategory) async {
                        try {
                          isLoading.value = true;
                          await editCategory(newCategory);
                          isLoading.value = false;
                        } catch (e) {
                          //
                        }
                      },
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: Text(LocaleKeys.delete.tr()),
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => DeleteCategoryAlert(
                      deleteCategory: () async {
                        try {
                          isLoading.value = true;
                          await deleteCategory(category);
                          isLoading.value = false;
                        } catch (e) {
                          //
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
