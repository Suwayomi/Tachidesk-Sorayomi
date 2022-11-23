// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// 🌎 Project imports:
import '../../../../../constants/db_keys.dart';
import '../../../../../constants/enum.dart';
import '../controller/source_manga_controller.dart';
import 'source_manga_grid_view.dart';
import 'source_manga_list_view.dart';
import '../../../../manga_book/domain/manga/manga_model.dart';
import '../../../domain/source/source_model.dart';

class SourceMangaDisplayView extends ConsumerWidget {
  const SourceMangaDisplayView({
    Key? key,
    required this.controller,
    this.source,
  }) : super(key: key);

  final PagingController<int, Manga> controller;
  final Source? source;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayMode = ref.watch(sourceDisplayModeProvider) ??
        DBKeys.sourceDisplayMode.initial;
    switch (displayMode) {
      case DisplayMode.grid:
        return SourceMangaGridView(controller: controller, source: source);
      case DisplayMode.list:
      default:
        return SourceMangaListView(controller: controller, source: source);
    }
  }
}
