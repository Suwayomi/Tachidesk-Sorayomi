// Copyright (c) 2023 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../utils/extensions/custom_extensions.dart';
import '../../../../utils/hooks/hook_primitives_wrapper.dart';
import '../../../../widgets/two_finger_pointer.dart';
import '../quick_search/quick_search_screen.dart';

class ShowQuickOpenIntent extends Intent {}

class HideQuickOpenIntent extends Intent {}

class SearchStackScreen extends HookWidget {
  const SearchStackScreen({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    final (visible, setVisible) = useStateRecord(false);
    return QuickSearchShortcutWrapper(
      visible: visible,
      setVisible: setVisible,
      child: Stack(
        children: [
          if (child != null) child!,
          if (visible)
            GestureDetector(
              onTap: () => setVisible(false),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  constraints: const BoxConstraints.expand(),
                  decoration: BoxDecoration(
                    color: context.theme.canvasColor.withOpacity(.1),
                  ),
                  child: QuickSearchScreen(
                    afterClick: () => setVisible(false),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class QuickSearchShortcutWrapper extends StatelessWidget {
  const QuickSearchShortcutWrapper({
    super.key,
    required this.child,
    required this.visible,
    required this.setVisible,
  });
  final Widget child;
  final bool visible;
  final ValueSetter<bool> setVisible;
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        SingleActivator(
          LogicalKeyboardKey.keyP,
          control: kIsWeb || !Platform.isMacOS,
          meta: kIsWeb ? false : Platform.isMacOS,
        ): ShowQuickOpenIntent(),
        const SingleActivator(LogicalKeyboardKey.escape): HideQuickOpenIntent(),
      },
      child: Actions(
        actions: {
          ShowQuickOpenIntent: CallbackAction<ShowQuickOpenIntent>(
            onInvoke: (ShowQuickOpenIntent intent) {
              setVisible(true);
              return null;
            },
          ),
          HideQuickOpenIntent: CallbackAction<HideQuickOpenIntent>(
            onInvoke: (HideQuickOpenIntent intent) {
              setVisible(false);
              return null;
            },
          ),
        },
        child: TwoFingerPointerWidget(
          onUpdate: (details) => setVisible(true),
          child: child,
        ),
      ),
    );
  }
}
