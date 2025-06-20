// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';

import '../../../utils/extensions/custom_extensions.dart';

enum HistoryMenuAction {
  viewManga,
  removeFromHistory;

  String toLocale(BuildContext context) => switch (this) {
        HistoryMenuAction.viewManga => context.l10n.viewManga,
        HistoryMenuAction.removeFromHistory => context.l10n.removeFromHistory,
      };

  IconData get icon => switch (this) {
        HistoryMenuAction.viewManga => Icons.book,
        HistoryMenuAction.removeFromHistory => Icons.delete_outline,
      };
}
