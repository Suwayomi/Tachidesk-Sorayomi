// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';

// 🌎 Project imports:
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../widgets/pop_button.dart';

// 🐦 Flutter imports:

// 📦 Package imports:

// 🌎 Project imports:

class DeleteCategoryAlert extends StatelessWidget {
  const DeleteCategoryAlert({super.key, required this.deleteCategory});
  final void Function() deleteCategory;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(LocaleKeys.editCategoriesScreen_deleteCategory_title.tr()),
      content:
          Text(LocaleKeys.editCategoriesScreen_deleteCategory_content.tr()),
      actions: [
        const PopButton(),
        ElevatedButton(
          onPressed: () {
            deleteCategory();
            context.navPop();
          },
          child: Text(LocaleKeys.common_delete.tr()),
        ),
      ],
    );
  }
}
