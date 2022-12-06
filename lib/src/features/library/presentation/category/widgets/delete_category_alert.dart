// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../i18n/locale_keys.g.dart';
import '../../../../../widgets/pop_button.dart';

class DeleteCategoryAlert extends StatelessWidget {
  const DeleteCategoryAlert({super.key, required this.deleteCategory});
  final VoidCallback deleteCategory;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(LocaleKeys.deleteCategory_title.tr()),
      content: Text(LocaleKeys.deleteCategory_content.tr()),
      actions: [
        const PopButton(),
        ElevatedButton(
          onPressed: () {
            deleteCategory();
            context.pop();
          },
          child: Text(LocaleKeys.delete.tr()),
        ),
      ],
    );
  }
}
