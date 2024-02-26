// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import '../../../../utils/extensions/custom_extensions.dart';
import 'widgets/show_nsfw_switch/show_nsfw_switch.dart';

class BrowseSettingsScreen extends StatelessWidget {
  const BrowseSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.browse)),
      body: ListView(
        children: [
          const ShowNSFWTile(),
          ListTile(
            subtitle: Text(context.l10n.nsfwInfo),
            leading: const Icon(Icons.info_rounded),
            dense: true,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
