// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/manga_book/widgets/update_status_fab.dart';
import '../../utils/extensions/custom_extensions.dart';
import 'big_screen_navigation_bar.dart';
import 'small_screen_navigation_bar.dart';

class ShellScreen extends ConsumerWidget {
  const ShellScreen({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return context.isTablet
        ? Scaffold(
            body: Row(
              children: [
                BigScreenNavigationBar(
                  selectedScreen: GoRouter.of(context).location,
                ),
                Expanded(child: child),
              ],
            ),
          )
        : Scaffold(
            body: child,
            floatingActionButton: const UpdateStatusFab(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            bottomNavigationBar: SmallScreenNavigationBar(
              selectedScreen: GoRouter.of(context).location,
            ),
          );
  }
}
