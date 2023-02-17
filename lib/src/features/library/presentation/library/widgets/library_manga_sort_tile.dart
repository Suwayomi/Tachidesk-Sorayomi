// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../constants/enum.dart';
import '../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../widgets/sort_list_tile.dart';
import '../controller/library_controller.dart';

class LibraryMangaSortTile extends ConsumerWidget {
  const LibraryMangaSortTile({
    super.key,
    required this.sortType,
  });
  final MangaSort sortType;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortedBy = ref.watch(libraryMangaSortProvider);
    final sortedDirection = ref.watch(libraryMangaSortDirectionProvider);
    return SortListTile(
      selected: sortType == sortedBy,
      title: Text(sortType.toString().tr()),
      ascending: sortedDirection.ifNull(true),
      onChanged: (bool? value) => ref
          .read(libraryMangaSortDirectionProvider.notifier)
          .update(!(sortedDirection.ifNull())),
      onSelected: () =>
          ref.read(libraryMangaSortProvider.notifier).update(sortType),
    );
  }
}
