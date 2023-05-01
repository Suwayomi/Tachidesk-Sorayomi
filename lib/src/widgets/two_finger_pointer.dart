// Copyright (c) 2023 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TwoFingerPointerWidget extends StatelessWidget {
  final Widget child;
  final OnUpdate onUpdate;

  const TwoFingerPointerWidget({
    Key? key,
    required this.child,
    required this.onUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: <Type, GestureRecognizerFactory>{
        CustomVerticalMultiDragGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<
                CustomVerticalMultiDragGestureRecognizer>(
          () => CustomVerticalMultiDragGestureRecognizer(debugOwner: null),
          (CustomVerticalMultiDragGestureRecognizer instance) {
            instance.onStart = (Offset position) {
              return CustomDrag(
                events: instance.events,
                onUpdate: onUpdate,
              );
            };
          },
        ),
      },
      child: child,
    );
  }
}

typedef OnUpdate = Function(DragUpdateDetails details);

class CustomDrag extends Drag {
  final List<PointerDownEvent> events;

  final OnUpdate onUpdate;

  CustomDrag({required this.events, required this.onUpdate});

  @override
  void update(DragUpdateDetails details) {
    super.update(details);
    final delta = details.delta;
    if (delta.dy.abs() > 0 && events.length == 2) {
      onUpdate.call(DragUpdateDetails(
        sourceTimeStamp: details.sourceTimeStamp,
        delta: Offset(0, delta.dy),
        primaryDelta: details.primaryDelta,
        globalPosition: details.globalPosition,
        localPosition: details.localPosition,
      ));
    }
  }
}

class CustomVerticalMultiDragGestureRecognizer
    extends MultiDragGestureRecognizer {
  final List<PointerDownEvent> events = [];

  CustomVerticalMultiDragGestureRecognizer({required Object? debugOwner})
      : super(debugOwner: debugOwner);

  @override
  createNewPointerState(PointerDownEvent event) {
    events.add(event);
    return _CustomVerticalPointerState(event.position, onDisposeState: () {
      events.remove(event);
    });
  }

  @override
  String get debugDescription => 'custom vertical multi drag';
}

typedef OnDisposeState = Function();

class _CustomVerticalPointerState extends MultiDragPointerState {
  final OnDisposeState onDisposeState;

  _CustomVerticalPointerState(Offset initialPosition,
      {required this.onDisposeState})
      : super(initialPosition, PointerDeviceKind.touch, null);

  @override
  void checkForResolutionAfterMove() {
    if (pendingDelta!.dy.abs() > kTouchSlop) {
      resolve(GestureDisposition.accepted);
    }
  }

  @override
  void accepted(GestureMultiDragStartCallback starter) {
    starter(initialPosition);
  }

  @override
  void dispose() {
    onDisposeState.call();
    super.dispose();
  }
}
