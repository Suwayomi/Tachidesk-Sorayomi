// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// 🌎 Project imports:
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../utils/extensions/custom_extensions/string_extensions.dart';
import '../../../../widgets/pop_button.dart';
import '../../domain/category/category_model.dart';

class EditCategoryDialog extends HookWidget {
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
  Widget build(BuildContext context) {
    final categoryName = useTextEditingController(text: category?.name);
    final defaultCategory = useState(category?.defaultCategory ?? false);
    return AlertDialog(
      title: Text(
        category == null
            ? LocaleKeys.editCategoriesScreen_addCategory.tr()
            : LocaleKeys.editCategoriesScreen_editCategory.tr(),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: categoryName,
            autofocus: true,
            decoration: InputDecoration(
              hintText: LocaleKeys.editCategoriesScreen_name.tr(),
              border: const OutlineInputBorder(),
            ),
            onSubmitted: (categoryName.text).isNotBlank
                ? (text) {
                    submitEditCategory(
                      categoryName.text,
                      defaultCategory.value,
                    );
                    context.navPop();
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
            title: Text(LocaleKeys.editCategoriesScreen_defaultCategory.tr()),
          )
        ],
      ),
      actions: [
        const PopButton(),
        ElevatedButton(
          onPressed: (categoryName.text).isNotBlank
              ? () {
                  submitEditCategory(categoryName.text, defaultCategory.value);
                  context.navPop();
                }
              : null,
          child: Text(LocaleKeys.common_save.tr()),
        ),
      ],
    );
  }
}
