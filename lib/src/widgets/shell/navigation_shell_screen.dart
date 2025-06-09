// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pub_semver/pub_semver.dart';

import '../../features/about/data/about_repository.dart';
import '../../features/about/presentation/about/controllers/about_controller.dart';
import '../../features/about/presentation/about/widget/app_update_dialog.dart';
import '../../utils/extensions/custom_extensions.dart';
import '../../utils/misc/toast/toast.dart';
import 'big_screen_navigation_bar.dart';
import 'small_screen_navigation_bar.dart';

class NavigationShellScreen extends HookConsumerWidget {
  const NavigationShellScreen({
    super.key,
    required this.child,
  });
  final StatefulNavigationShell child;

  Future<void> checkForUpdate({
    required String? title,
    required BuildContext context,
    required Future<AsyncValue<Version?>> Function() updateCallback,
    required Toast? toast,
  }) async {
    final AsyncValue<Version?> versionResult = await updateCallback();
    toast?.close();
    if (!context.mounted) return;
    versionResult.whenOrNull(
      data: (version) {
        if (version != null) {
          appUpdateDialog(
            title: title ?? context.l10n.appTitle,
            newRelease: "v${version.canonicalizedVersion}",
            context: context,
            toast: toast,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.microtask(
        () async {
          if (!context.mounted) return;
          await checkForUpdate(
            title: ref.read(packageInfoProvider).appName,
            context: context,
            updateCallback: ref.read(aboutRepositoryProvider).checkUpdate,
            toast: ref.read(toastProvider),
          );
        },
      );
      return;
    }, []);

    // Handle different navigation indices for tablet vs phone
    int getAdjustedIndex(int index) {
      if (context.isTablet) {
        // Tablet: Library(0), Updates(1), History(2), Browse(3), Downloads(4), More(5)
        return index;
      } else {
        // Phone: Library(0), Updates(1), Browse(2), Downloads(3), More(4)
        // Skip history index (2) by adjusting indices
        if (index >= 2) {
          return index +
              1; // Browse becomes 3, Downloads becomes 4, More becomes 5
        }
        return index;
      }
    }

    int getReverseAdjustedIndex(int index) {
      if (context.isTablet) {
        return index;
      } else {
        // Convert back: if index > 2, subtract 1 to skip history
        if (index > 2) {
          return index - 1;
        }
        return index;
      }
    }

    if (context.isTablet) {
      return Scaffold(
        body: Row(
          children: [
            BigScreenNavigationBar(
              selectedIndex: child.currentIndex,
              onDestinationSelected: (index) => child.goBranch(
                getAdjustedIndex(index),
                initialLocation: index == child.currentIndex,
              ),
            ),
            Expanded(child: child),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: child,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: SmallScreenNavigationBar(
          selectedIndex: getReverseAdjustedIndex(child.currentIndex),
          onDestinationSelected: (index) => child.goBranch(
            getAdjustedIndex(index),
            initialLocation: index == child.currentIndex,
          ),
        ),
      );
    }
  }
}
