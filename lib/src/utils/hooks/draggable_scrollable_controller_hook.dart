// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';

/// Creates [DraggableScrollableController] that will be disposed automatically.
///
/// See also:
/// - [DraggableScrollableController]
DraggableScrollableController useDraggableScrollableController() {
  return use<DraggableScrollableController>(
    const _DraggableScrollableControllerHook(),
  );
}

class _DraggableScrollableControllerHook
    extends Hook<DraggableScrollableController> {
  const _DraggableScrollableControllerHook();
  @override
  HookState<DraggableScrollableController, Hook<DraggableScrollableController>>
      createState() => _DraggableScrollableControllerHookState();
}

class _DraggableScrollableControllerHookState extends HookState<
    DraggableScrollableController, _DraggableScrollableControllerHook> {
  late final controller = DraggableScrollableController();

  @override
  DraggableScrollableController build(BuildContext context) => controller;

  @override
  void dispose() => controller.dispose();

  @override
  String get debugLabel => 'useDraggableScrollableController';
}
