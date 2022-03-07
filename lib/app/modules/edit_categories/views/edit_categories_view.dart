import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/values/api_url.dart';
import '../../../data/category_model.dart';
import '../../../widgets/emoticons.dart';
import '../controllers/edit_categories_controller.dart';

class EditCategoriesView extends GetView<EditCategoriesController> {
  Future<void> categoryDialog(BuildContext context,
      {Category? category}) async {
    if (category != null) {
      controller.textEditingController.text = category.name ?? "";
      controller.defaultCategory = category.defaultCategory ?? false;
    }
    await Get.defaultDialog(
      title: category != null
          ? LocaleKeys.editCategoriesScreen_editCategory.tr
          : LocaleKeys.editCategoriesScreen_addCategory.tr,
      content: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: (LocaleKeys.screenTitle_categories.tr),
              ),
              controller: controller.textEditingController,
            ),
            Obx(() => CheckboxListTile(
                  title:
                      Text(LocaleKeys.editCategoriesScreen_defaultCategory.tr),
                  value: controller.defaultCategory,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (value) =>
                      controller.defaultCategory = value ?? false,
                )),
          ],
        ),
      ),
      onConfirm: () async {
        if (controller.textEditingController.text.isEmpty) {
          Get.rawSnackbar(
            title: LocaleKeys.editCategoriesScreen_emptyCategory_title.tr,
            message: LocaleKeys.editCategoriesScreen_emptyCategory_message.tr,
          );
          return;
        }
        if (category != null) {
          await controller.editCategory(category: category);
        } else {
          await controller.createCategory();
        }
        controller.textEditingController.clear();
        Get.back();
      },
      onCancel: () {
        controller.textEditingController.clear();
        controller.defaultCategory = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.screenTitle_categories.tr),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await categoryDialog(context);
        },
        icon: Icon(Icons.add),
        label: Text(LocaleKeys.editCategoriesScreen_add.tr),
        isExtended: context.width > 600 ? true : false,
      ),
      body: Obx(
        () => controller.categoryList.isNotEmpty
            ? ReorderableListView.builder(
                dragStartBehavior: DragStartBehavior.down,
                buildDefaultDragHandles: false,
                header: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: context.height * .05),
                      child: ImageIcon(
                        AssetImage(iconLightTextNbgPngURL),
                        size: context.height * .1,
                      ),
                    ),
                    Divider(thickness: 2)
                  ],
                ),
                onReorder: (int oldIndex, int newIndex) async {
                  await controller.reorder(from: oldIndex, to: newIndex);
                },
                itemCount: controller.categoryList.length,
                itemBuilder: (context, index) => ListTile(
                  key: ValueKey(controller.categoryList[index]!.name),
                  title: Text(controller.categoryList[index]!.name ?? ""),
                  leading: ReorderableDragStartListener(
                    index: index,
                    child: Icon(
                      Icons.drag_handle_outlined,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => categoryDialog(context,
                            category: controller.categoryList[index]),
                        icon: Icon(Icons.edit_outlined),
                      ),
                      IconButton(
                        onPressed: () => controller.deleteCategory(
                          controller.categoryList[index]!.id!,
                        ),
                        icon: Icon(Icons.delete_outline),
                      ),
                    ],
                  ),
                ),
              )
            : EmoticonsView(
                emptyType: LocaleKeys.screenTitle_categories.tr,
              ),
      ),
    );
  }
}
