// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../constants/app_constants.dart';
import '../../../../../../constants/enum.dart';
import '../../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../settings/presentation/reader/widgets/reader_invert_tap_tile/reader_invert_tap_tile.dart';
import '../../../../../settings/presentation/reader/widgets/reader_navigation_layout_tile/reader_navigation_layout_tile.dart';
import 'layouts/edge_layout.dart';
import 'layouts/kindlish_layout.dart';
import 'layouts/l_shaped_layout.dart';
import 'layouts/right_and_left_layout.dart';

class ReaderNavigationLayoutWidget extends HookConsumerWidget {
  const ReaderNavigationLayoutWidget({
    super.key,
    this.navigationLayout,
    required this.onPrevious,
    required this.onNext,
  });
  final ReaderNavigationLayout? navigationLayout;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationController = useAnimationController(duration: kLongDuration);
    useAnimation(animationController);
    final nextColorTween =
        ColorTween(begin: Colors.green).animate(animationController).value;

    final prevColorTween =
        ColorTween(begin: Colors.blue).animate(animationController).value;
    useEffect(() {
      animationController.forward();
      return;
    }, []);

    final layout = navigationLayout == null ||
            navigationLayout == ReaderNavigationLayout.defaultNavigation
        ? ref.watch(readerNavigationLayoutKeyProvider)
        : navigationLayout;
    final invertTap = ref.watch(invertTapProvider).ifNull();
    final VoidCallback? onLeftTap;
    final VoidCallback? onRightTap;
    final Color? leftColor;
    final Color? rightColor;
    if (invertTap) {
      onLeftTap = onNext;
      onRightTap = onPrevious;
      leftColor = nextColorTween;
      rightColor = prevColorTween;
    } else {
      onLeftTap = onPrevious;
      onRightTap = onNext;
      leftColor = prevColorTween;
      rightColor = nextColorTween;
    }
    return switch (layout) {
      ReaderNavigationLayout.edge => EdgeLayout(
          onLeftTap: onLeftTap,
          onRightTap: onRightTap,
          leftColor: leftColor,
          rightColor: rightColor,
        ),
      ReaderNavigationLayout.kindlish => KindlishLayout(
          onLeftTap: onLeftTap,
          onRightTap: onRightTap,
          leftColor: leftColor,
          rightColor: rightColor,
        ),
      ReaderNavigationLayout.lShaped => LShapedLayout(
          onLeftTap: onLeftTap,
          onRightTap: onRightTap,
          leftColor: leftColor,
          rightColor: rightColor,
        ),
      ReaderNavigationLayout.rightAndLeft => RightAndLeftLayout(
          onLeftTap: onLeftTap,
          onRightTap: onRightTap,
          leftColor: leftColor,
          rightColor: rightColor,
        ),
      ReaderNavigationLayout.defaultNavigation ||
      ReaderNavigationLayout.disabled ||
      null =>
        const SizedBox.shrink(),
    };
  }
}
