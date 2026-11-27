// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.
//
// Tests for the single-touch drag recognizers used by
// DirectionalSwipeGestureHandler. The whole point of the subclasses is that
// they refuse to claim multi-touch gestures, so a two-finger pinch can fall
// through to ZoomView's scale recognizer.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tachidesk_sorayomi/src/widgets/zoom/single_touch_drag_recognizers.dart';

const double _viewportWidth = 400.0;
const double _viewportHeight = 800.0;

const _testKey = ValueKey('test-drag-target');

Future<void> _pumpWithSingleTouchRecognizer(
  WidgetTester tester, {
  required void Function(DragEndDetails) onHorizontalDragEnd,
}) async {
  tester.view.devicePixelRatio = 1.0;
  tester.view.physicalSize = const Size(_viewportWidth, _viewportHeight);
  addTearDown(() {
    tester.view.resetDevicePixelRatio();
    tester.view.resetPhysicalSize();
  });

  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: _viewportWidth,
          height: _viewportHeight,
          child: RawGestureDetector(
              key: _testKey,
              behavior: HitTestBehavior.translucent,
              gestures: <Type, GestureRecognizerFactory>{
                SingleTouchHorizontalDragGestureRecognizer:
                    GestureRecognizerFactoryWithHandlers<
                        SingleTouchHorizontalDragGestureRecognizer>(
                  () => SingleTouchHorizontalDragGestureRecognizer(),
                  (recognizer) {
                    recognizer.onEnd = onHorizontalDragEnd;
                  },
                ),
                // A scale recognizer is included to keep the gesture
                // arena from eagerly accepting our drag recognizer on the
                // first pointer down. In the real reader, ZoomView's
                // scale recognizer plays this role.
                ScaleGestureRecognizer:
                    GestureRecognizerFactoryWithHandlers<
                        ScaleGestureRecognizer>(
                  () => ScaleGestureRecognizer(),
                  (recognizer) {
                    // No-op handlers; just need it in the arena.
                    recognizer.onStart = (_) {};
                    recognizer.onUpdate = (_) {};
                    recognizer.onEnd = (_) {};
                  },
                ),
              },
            child: const SizedBox.expand(
              child: ColoredBox(color: Colors.transparent),
            ),
          ),
        ),
      ),
    ),
  );
}

void main() {
  group('SingleTouchHorizontalDragGestureRecognizer', () {
    testWidgets(
        'single-finger horizontal drag DOES trigger the end callback',
        (tester) async {
      var endCount = 0;
      await _pumpWithSingleTouchRecognizer(
        tester,
        onHorizontalDragEnd: (_) => endCount++,
      );

      await tester.drag(
        find.byKey(_testKey),
        const Offset(200, 0),
      );
      await tester.pumpAndSettle();

      expect(endCount, 1,
          reason: 'single-finger drag should fire the end callback');
    });

    testWidgets(
        'two-finger drag does NOT trigger the end callback (this is the '
        'whole point of the subclass)', (tester) async {
      var endCount = 0;
      await _pumpWithSingleTouchRecognizer(
        tester,
        onHorizontalDragEnd: (_) => endCount++,
      );

      // Manually simulate two fingers landing then dragging horizontally.
      const center = Offset(_viewportWidth / 2, _viewportHeight / 2);
      final g1 =
          await tester.startGesture(center + const Offset(-30, 0));
      final g2 =
          await tester.startGesture(center + const Offset(30, 0));
      // Move them apart horizontally over several frames.
      for (var i = 0; i < 10; i++) {
        await g1.moveBy(const Offset(-10, 0));
        await g2.moveBy(const Offset(10, 0));
        await tester.pump(const Duration(milliseconds: 16));
      }
      await g1.up();
      await g2.up();
      await tester.pumpAndSettle();

      expect(endCount, 0,
          reason: 'two-finger gesture must NOT be claimed by the '
              'single-touch drag recognizer — that lets ZoomView win.');
    });

    testWidgets(
        'after a multi-touch gesture, a fresh single-finger drag still works',
        (tester) async {
      var endCount = 0;
      await _pumpWithSingleTouchRecognizer(
        tester,
        onHorizontalDragEnd: (_) => endCount++,
      );

      // First: a two-finger gesture that should be ignored.
      const center = Offset(_viewportWidth / 2, _viewportHeight / 2);
      final g1 =
          await tester.startGesture(center + const Offset(-30, 0));
      final g2 =
          await tester.startGesture(center + const Offset(30, 0));
      for (var i = 0; i < 5; i++) {
        await g1.moveBy(const Offset(-10, 0));
        await g2.moveBy(const Offset(10, 0));
        await tester.pump(const Duration(milliseconds: 16));
      }
      await g1.up();
      await g2.up();
      await tester.pumpAndSettle();

      expect(endCount, 0, reason: 'multi-touch should not have fired');

      // Now: a single-finger drag should still work.
      await tester.drag(
        find.byKey(_testKey),
        const Offset(200, 0),
      );
      await tester.pumpAndSettle();

      expect(endCount, 1,
          reason: 'a fresh single-finger drag must still fire — the '
              'recognizer must not be left in a broken state');
    });
  });
}
