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

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.settings.tr()),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(LocaleKeys.appearance.tr()),
            leading: const Icon(Icons.color_lens_rounded),
            onTap: () => context
                .push([Routes.settings, Routes.appearanceSettings].toPath),
          ),
          ListTile(
            title: Text(LocaleKeys.library.tr()),
            leading: const Icon(Icons.collections_bookmark_rounded),
            onTap: () =>
                context.push([Routes.settings, Routes.librarySettings].toPath),
          ),
          ListTile(
            title: Text(LocaleKeys.reader.tr()),
            leading: const Icon(Icons.chrome_reader_mode_rounded),
            onTap: () =>
                context.push([Routes.settings, Routes.readerSettings].toPath),
          ),
          ListTile(
            title: Text(LocaleKeys.browse.tr()),
            leading: const Icon(Icons.explore_rounded),
            onTap: () =>
                context.push([Routes.settings, Routes.browseSettings].toPath),
          ),
          ListTile(
            title: Text(LocaleKeys.backup.tr()),
            leading: const Icon(Icons.settings_backup_restore_rounded),
            onTap: () => context.push([Routes.settings, Routes.backup].toPath),
          ),
          ListTile(
            title: Text(LocaleKeys.server.tr()),
            leading: const Icon(Icons.computer_rounded),
            onTap: () =>
                context.push([Routes.settings, Routes.serverSettings].toPath),
          ),
        ],
      ),
    );
  }
}
