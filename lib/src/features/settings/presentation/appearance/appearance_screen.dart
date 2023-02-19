// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import '../../../../utils/extensions/custom_extensions.dart';
import '../../widgets/theme_mode_tile/theme_mode_tile.dart';
import 'widgets/grid_cover_min_width.dart';

class AppearanceScreen extends StatelessWidget {
  const AppearanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n!.appearance)),
      body: ListView(
        children: const [
          AppThemeTile(),
          GridCoverMinWidth(),
        ],
      ),
    );
  }
}
