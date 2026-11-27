// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//
// Tests for the pinch-to-zoom wiring used by the reader modes.
//
// Background: ZoomView is wrapped around a ScrollablePositionedList (or a
// PageView in the single-page case) and is supposed to capture two-finger
// scale gestures. Without `forceHoldOnPointerDown: true`, the underlying
// scrollable's pan recognizer wins the gesture arena and `ZoomView` never
// sees the scale start — pinch does literally nothing on device. These
// tests pin both behaviours: the scale callback fires when forceHold is
// on, and the single-finger scroll path still works regardless.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:tachidesk_sorayomi/src/widgets/zoom/scroll_offset_to_scroll_controller.dart';
import 'package:zoom_view/zoom_view.dart';

const double _viewportWidth = 400.0;
const double _viewportHeight = 800.0;
const double _itemHeight = 200.0;

Future<void> _pumpZoomWrappedList(
  WidgetTester tester, {
  required bool forceHoldOnPointerDown,
  required void Function(double scale) onScaleChanged,
}) async {
  tester.view.devicePixelRatio = 1.0;
  tester.view.physicalSize = const Size(_viewportWidth, _viewportHeight);
  addTearDown(() {
    tester.view.resetDevicePixelRatio();
    tester.view.resetPhysicalSize();
  });

  final scrollOffsetController = ScrollOffsetController();

  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: _viewportWidth,
          height: _viewportHeight,
          child: ZoomView(
            controller: ScrollOffsetToScrollController(
              scrollOffsetController: scrollOffsetController,
            ),
            scrollAxis: Axis.vertical,
            maxScale: 5,
            forceHoldOnPointerDown: forceHoldOnPointerDown,
            onScaleChanged: onScaleChanged,
            child: ScrollablePositionedList.builder(
              scrollOffsetController: scrollOffsetController,
              itemCount: 50,
              itemBuilder: (context, index) => SizedBox(
                height: _itemHeight,
                child: Text('Item $index'),
              ),
            ),
          ),
        ),
      ),
    ),
  );
  // Let the list mount and attach controllers.
  await tester.pumpAndSettle();
}

/// Drive a two-finger pinch-out gesture (two pointers moving apart).
Future<void> _simulatePinchOut(WidgetTester tester) async {
  final center = const Offset(_viewportWidth / 2, _viewportHeight / 2);
  // Start two fingers near the center, ~60px apart, then pull them apart
  // along the diagonal so the scale delta is significant.
  final start1 = center + const Offset(-30, -30);
  final start2 = center + const Offset(30, 30);
  final g1 = await tester.startGesture(start1);
  final g2 = await tester.startGesture(start2);
  // Pull them apart over several frames to give the scale recognizer time
  // to accept past its slop threshold.
  for (var i = 0; i < 10; i++) {
    await g1.moveBy(const Offset(-10, -10));
    await g2.moveBy(const Offset(10, 10));
    await tester.pump(const Duration(milliseconds: 16));
  }
  await g1.up();
  await g2.up();
  await tester.pumpAndSettle();
}

void main() {
  group('ZoomView + ScrollablePositionedList pinch wiring', () {
    testWidgets(
        'WITH forceHoldOnPointerDown=true (our fix): pinch fires the scale '
        'callback with scale > 1.0', (tester) async {
      double? lastScale;
      await _pumpZoomWrappedList(
        tester,
        forceHoldOnPointerDown: true,
        onScaleChanged: (scale) => lastScale = scale,
      );

      await _simulatePinchOut(tester);

      expect(lastScale, isNotNull,
          reason: 'onScaleChanged should fire when forceHoldOnPointerDown '
              'is set — that is the whole point of the flag for SPL');
      expect(lastScale!, greaterThan(1.0),
          reason: 'pinch-out should produce a scale > 1.0');
    });

    testWidgets(
        'single-finger drag still scrolls the underlying list through the '
        'ZoomView wrapper (does not block normal scrolling)', (tester) async {
      await _pumpZoomWrappedList(
        tester,
        forceHoldOnPointerDown: true,
        onScaleChanged: (_) {},
      );

      // Item 0 should be at the top of the viewport initially.
      expect(tester.getTopLeft(find.text('Item 0')).dy, closeTo(0.0, 0.5),
          reason: 'sanity: list starts at the top');

      // One-finger drag upward through the ZoomView wrapper.
      await tester.drag(
        find.byType(ScrollablePositionedList),
        const Offset(0, -400),
      );
      await tester.pumpAndSettle();

      // Item 0 should have scrolled out of view (above the viewport).
      final item0Finder = find.text('Item 0');
      if (item0Finder.evaluate().isNotEmpty) {
        final item0Y = tester.getTopLeft(item0Finder).dy;
        expect(item0Y, lessThan(-50.0),
            reason: 'after a single-finger drag, Item 0 should have moved '
                'off the top of the viewport — ZoomView must not block '
                'normal scrolling');
      }
      // If Item 0 isn't found at all, that's also evidence the list scrolled.
    });
  });

  group('reproducing the reader\'s real gesture stack', () {
    testWidgets(
        'GestureDetector(onPanEnd + onLongPress + onTap) wrapping ZoomView: '
        'does the outer pan recognizer eat the pinch?', (tester) async {
      tester.view.devicePixelRatio = 1.0;
      tester.view.physicalSize = const Size(_viewportWidth, _viewportHeight);
      addTearDown(() {
        tester.view.resetDevicePixelRatio();
        tester.view.resetPhysicalSize();
      });

      double? lastScale;
      var outerPanEnds = 0;
      final scrollOffsetController = ScrollOffsetController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: _viewportWidth,
              height: _viewportHeight,
              // This mimics the structure inside ReaderWrapper:
              // DirectionalSwipeGestureHandler wraps everything in a
              // GestureDetector with onPanEnd, onTap, onLongPress*. That
              // GestureDetector sits ABOVE ZoomView in the widget tree.
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {},
                onLongPressStart: (_) {},
                onLongPressEnd: (_) {},
                onLongPressMoveUpdate: (_) {},
                onPanEnd: (_) => outerPanEnds++,
                child: ZoomView(
                  controller: ScrollOffsetToScrollController(
                    scrollOffsetController: scrollOffsetController,
                  ),
                  scrollAxis: Axis.vertical,
                  maxScale: 5,
                  forceHoldOnPointerDown: true,
                  onScaleChanged: (s) => lastScale = s,
                  child: ScrollablePositionedList.builder(
                    scrollOffsetController: scrollOffsetController,
                    itemCount: 50,
                    itemBuilder: (context, index) => SizedBox(
                      height: _itemHeight,
                      child: Text('Item $index'),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await _simulatePinchOut(tester);

      printOnFailure('lastScale: $lastScale');
      printOnFailure('outerPanEnds: $outerPanEnds');

      // If the outer GestureDetector eats the pinch (the device-side
      // hypothesis), lastScale stays null and outerPanEnds increments.
      // If ZoomView still wins, lastScale is non-null.
      if (lastScale == null && outerPanEnds > 0) {
        fail(
          'OUTER GESTURE DETECTOR ATE THE PINCH (reproduced in test env). '
          'lastScale=$lastScale, outerPanEnds=$outerPanEnds. This is '
          'the device-side bug.',
        );
      } else if (lastScale == null) {
        fail(
          'pinch did not fire scale but the outer GestureDetector also '
          'did not see a pan-end. Some other recognizer is eating the '
          'gesture. lastScale=$lastScale, outerPanEnds=$outerPanEnds.',
        );
      }
      // If we reach here, scale fired despite the outer wrapper — the
      // outer-GD-eats-pinch hypothesis is wrong (in test env at least).
      expect(lastScale, greaterThan(1.0));
    });
  });

  group('limitations of these tests (read this before relying on them)', () {
    test(
        'widget-test gesture arena does NOT reproduce real-device multi-touch '
        'arena losses', () {
      // Documented in code, not asserted: in the Flutter widget-test
      // environment the scale recognizer wins the arena over the underlying
      // scrollable\'s pan recognizer EVEN WITHOUT `forceHoldOnPointerDown`.
      // On a real Android device the scrollable wins and the scale gesture
      // never starts. That is the entire bug `forceHoldOnPointerDown: true`
      // exists to work around. Therefore a passing pinch test here does
      // NOT prove the fix works on hardware; the hardware verification is
      // a separate step.
      //
      // This test exists only to keep the limitation explicit in the file.
      expect(true, isTrue);
    });
  });
}
