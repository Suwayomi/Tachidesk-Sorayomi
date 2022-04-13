import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../controllers/global_search_controller.dart';

class GlobalSearchField extends StatelessWidget {
  const GlobalSearchField({Key? key, required this.controller})
      : super(key: key);

  final GlobalSearchController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.textEditingController,
      onEditingComplete: () =>
          controller.query = controller.textEditingController.text,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            controller.query = controller.textEditingController.text;
          },
        ),
        border: OutlineInputBorder(),
        hintText: LocaleKeys.searchManga_searchManga.tr,
      ),
    );
  }
}
