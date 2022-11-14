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
