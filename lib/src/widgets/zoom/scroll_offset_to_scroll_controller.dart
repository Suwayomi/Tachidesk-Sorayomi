// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// Adapter that exposes a `ScrollablePositionedList.scrollOffsetController` as
// a standard `ScrollController`. Required by `zoom_view`, which needs a
// `ScrollController` to coordinate scroll position with pinch-zoom but
// `ScrollablePositionedList` only exposes `ScrollOffsetController`.
//
// Depends on the `position` getter that yakagami's fork of
// scrollable_positioned_list adds to `ScrollOffsetController` — see the
// pubspec comment on that dependency.

import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScrollOffsetToScrollController extends ScrollController {
  ScrollOffsetToScrollController({required this.scrollOffsetController});

  final ScrollOffsetController scrollOffsetController;

  @override
  ScrollPosition get position => scrollOffsetController.position;

  @override
  void jumpTo(double value) {
    // ScrollOffsetController doesn't expose a public jumpTo; go through the
    // underlying ScrollPosition directly (which the fork makes available).
    scrollOffsetController.position.jumpTo(value);
  }

  @override
  Future<void> animateTo(
    double offset, {
    required Curve curve,
    required Duration duration,
  }) {
    // ScrollOffsetController.animateScroll takes a RELATIVE offset (from
    // current pixels); translate the absolute target ScrollController users
    // pass in.
    final delta = offset - scrollOffsetController.position.pixels;
    return scrollOffsetController.animateScroll(
      offset: delta,
      duration: duration,
      curve: curve,
    );
  }
}
