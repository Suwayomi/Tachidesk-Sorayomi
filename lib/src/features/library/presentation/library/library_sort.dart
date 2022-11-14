// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../../constants/enum.dart';
import 'widgets/library_sort_tile.dart';

class LibrarySort extends ConsumerWidget {
  const LibrarySort({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: const [
        Divider(height: .5),
        LibrarySortTile(sortType: MangaSort.alphabetical),
        LibrarySortTile(sortType: MangaSort.dateAdded),
        LibrarySortTile(sortType: MangaSort.unread),
      ],
    );
  }
}
