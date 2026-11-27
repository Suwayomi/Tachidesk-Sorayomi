// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// Drag gesture recognizers that refuse to claim multi-touch gestures.
//
// Flutter's stock `HorizontalDragGestureRecognizer` / `VerticalDragGestureRecognizer`
// happily accept the gesture arena even when a second finger is already on
// screen. Inside the reader, that means a two-finger pinch is silently
// stolen from `ZoomView`'s scale recognizer as soon as either finger drifts
// past drag slop — which is the root cause of upstream #256 ("two-finger
// pinch is almost unusable").
//
// These subclasses track the pointers they personally see. When a second
// pointer arrives, the recognizer rejects its in-flight gesture for the
// first pointer (via `resolve(rejected)`) and does not track the second
// pointer at all. Net effect in the gesture arena: single-finger drags
// still drive `DirectionalSwipeGestureHandler`'s swipe-at-chapter-boundary
// navigation; two-finger gestures fall through to `ZoomView` cleanly.
//
// Self-tracking is used rather than a globally shared counter because
// pointer-down events reach the gesture recognizer BEFORE they reach an
// outer `Listener` widget in Flutter's hit-test order, so a Listener-
// maintained count would always be stale by one event.

import 'package:flutter/gestures.dart';

class SingleTouchHorizontalDragGestureRecognizer
    extends HorizontalDragGestureRecognizer {
  SingleTouchHorizontalDragGestureRecognizer({super.debugOwner});

  final Set<int> _selfTracked = <int>{};

  @override
  void addAllowedPointer(PointerDownEvent event) {
    if (_selfTracked.isNotEmpty) {
      _selfTracked.clear();
      resolve(GestureDisposition.rejected);
      return;
    }
    _selfTracked.add(event.pointer);
    super.addAllowedPointer(event);
  }

  @override
  void didStopTrackingLastPointer(int pointer) {
    _selfTracked.remove(pointer);
    super.didStopTrackingLastPointer(pointer);
  }
}

class SingleTouchVerticalDragGestureRecognizer
    extends VerticalDragGestureRecognizer {
  SingleTouchVerticalDragGestureRecognizer({super.debugOwner});

  final Set<int> _selfTracked = <int>{};

  @override
  void addAllowedPointer(PointerDownEvent event) {
    if (_selfTracked.isNotEmpty) {
      _selfTracked.clear();
      resolve(GestureDisposition.rejected);
      return;
    }
    _selfTracked.add(event.pointer);
    super.addAllowedPointer(event);
  }

  @override
  void didStopTrackingLastPointer(int pointer) {
    _selfTracked.remove(pointer);
    super.didStopTrackingLastPointer(pointer);
  }
}

class SingleTouchPanGestureRecognizer extends PanGestureRecognizer {
  SingleTouchPanGestureRecognizer({super.debugOwner});

  final Set<int> _selfTracked = <int>{};

  @override
  void addAllowedPointer(PointerDownEvent event) {
    if (_selfTracked.isNotEmpty) {
      _selfTracked.clear();
      resolve(GestureDisposition.rejected);
      return;
    }
    _selfTracked.add(event.pointer);
    super.addAllowedPointer(event);
  }

  @override
  void didStopTrackingLastPointer(int pointer) {
    _selfTracked.remove(pointer);
    super.didStopTrackingLastPointer(pointer);
  }
}
