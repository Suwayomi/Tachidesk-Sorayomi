// Copyright (c) 2023 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NextScrollIntent extends Intent {}

class NextChapterIntent extends Intent {}

class PreviousScrollIntent extends Intent {}

class PreviousChapterIntent extends Intent {}

class HideQuickOpenIntent extends Intent {}

ShortcutManager readerShortcutManager(Axis scrollDirection) => ShortcutManager(
      shortcuts: {
        const SingleActivator(LogicalKeyboardKey.space): NextScrollIntent(),
        const SingleActivator(LogicalKeyboardKey.space, shift: true):
            PreviousScrollIntent(),
        const SingleActivator(LogicalKeyboardKey.arrowLeft):
            scrollDirection == Axis.horizontal
                ? PreviousScrollIntent()
                : PreviousChapterIntent(),
        const SingleActivator(LogicalKeyboardKey.keyA):
            scrollDirection == Axis.horizontal
                ? PreviousScrollIntent()
                : PreviousChapterIntent(),
        const SingleActivator(LogicalKeyboardKey.arrowRight):
            scrollDirection == Axis.horizontal
                ? NextScrollIntent()
                : NextChapterIntent(),
        const SingleActivator(LogicalKeyboardKey.keyD):
            scrollDirection == Axis.horizontal
                ? NextScrollIntent()
                : NextChapterIntent(),
        const SingleActivator(LogicalKeyboardKey.arrowUp):
            scrollDirection == Axis.vertical
                ? PreviousScrollIntent()
                : NextChapterIntent(),
        const SingleActivator(LogicalKeyboardKey.keyW):
            scrollDirection == Axis.vertical
                ? PreviousScrollIntent()
                : NextChapterIntent(),
        const SingleActivator(LogicalKeyboardKey.arrowDown):
            scrollDirection == Axis.vertical
                ? NextScrollIntent()
                : PreviousChapterIntent(),
        const SingleActivator(LogicalKeyboardKey.keyS):
            scrollDirection == Axis.vertical
                ? NextScrollIntent()
                : PreviousChapterIntent(),
        const SingleActivator(LogicalKeyboardKey.escape): HideQuickOpenIntent(),
      },
    );
