// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tachidesk_sorayomi/src/utils/misc/toast/toast.dart';

// 🌎 Project imports:
import '../../../../../i18n/locale_keys.g.dart';
import '../../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../../utils/extensions/custom_extensions/string_extensions.dart';
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
    final defaultCategory = useState(category?.defaultCategory ?? false);
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
            context.navPop();
          },
          child: Text(LocaleKeys.save.tr()),
        ),
      ],
    );
  }
}
