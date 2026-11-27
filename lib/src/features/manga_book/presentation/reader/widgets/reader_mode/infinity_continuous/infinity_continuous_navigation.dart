// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'infinity_continuous_config.dart';
import 'infinity_continuous_utils.dart';

/// Navigation helper for infinity continuous reader mode
class InfinityContinuousNavigation {
  const InfinityContinuousNavigation._();

  /// Handle navigation (next/previous page)
  static void handleNavigation(
    ItemScrollController scrollController,
    ItemPositionsListener positionsListener,
    bool isAnimationEnabled, {
    required bool isNext,
  }) {
    final List<ItemPosition> positions =
        positionsListener.itemPositions.value.toList();
    if (positions.isEmpty) return;

    // Find current position
    ItemPosition? currentPosition;
    for (final ItemPosition position in positions) {
      final double visibleArea =
          InfinityContinuousUtils.calculateVisibleArea(position);
      if (visibleArea > InfinityContinuousConfig.minVisibleAreaThreshold) {
        currentPosition = position;
        break;
      }
    }

    if (currentPosition == null) return;

    final int targetIndex;
    final double alignment;

    if (isNext) {
      // Move to next item
      if (currentPosition.itemTrailingEdge >
          InfinityContinuousConfig.navigationTrailingThreshold) {
        targetIndex = currentPosition.index + 1;
        alignment = 0.0;
      } else {
        targetIndex = currentPosition.index;
        alignment = 0.0;
      }
    } else {
      // Move to previous item
      if (currentPosition.itemLeadingEdge <
          InfinityContinuousConfig.navigationLeadingThreshold) {
        targetIndex =
            (currentPosition.index - 1).clamp(0, double.infinity).toInt();
        alignment = 0.0;
      } else {
        targetIndex = currentPosition.index;
        alignment = 0.0;
      }
    }

    // Use gentle navigation
    if (isAnimationEnabled) {
      scrollController.scrollTo(
        index: targetIndex,
        duration: InfinityContinuousConfig.scrollAnimationDuration,
        curve: InfinityContinuousConfig.scrollAnimationCurve,
        alignment: alignment,
      );
    } else {
      scrollController.jumpTo(
        index: targetIndex,
        alignment: alignment,
      );
    }
  }
}
