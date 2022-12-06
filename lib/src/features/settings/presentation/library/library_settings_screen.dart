// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../i18n/locale_keys.g.dart';
import '../../../../routes/router_config.dart';
import '../../../../utils/extensions/custom_extensions.dart';

class LibrarySettingsScreen extends StatelessWidget {
  const LibrarySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.library.tr()),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(LocaleKeys.categories.tr()),
            leading: const Icon(Icons.label_rounded),
            onTap: () => context.push([
              Routes.settings,
              Routes.librarySettings,
              Routes.editCategories
            ].toPath),
          ),
        ],
      ),
    );
  }
}
