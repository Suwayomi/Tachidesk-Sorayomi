// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../routes/router_config.dart';
import '../../../../utils/extensions/custom_extensions.dart';

class LibrarySettingsScreen extends StatelessWidget {
  const LibrarySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n!.library),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(context.l10n!.categories),
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
