// Copyright (c) 2023 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../constants/db_keys.dart';
import '../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../utils/mixin/shared_preferences_client_mixin.dart';

part 'grid_cover_min_width.g.dart';

@riverpod
class GridMinWidth extends _$GridMinWidth
    with SharedPreferenceClientMixin<double> {
  @override
  double? build() => initialize(
        ref,
        key: DBKeys.gridMangaCoverWidth.name,
        initial: DBKeys.gridMangaCoverWidth.initial,
      );
}

class GridCoverMinWidth extends ConsumerWidget {
  const GridCoverMinWidth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double width =
        ref.watch(gridMinWidthProvider) ?? DBKeys.gridMangaCoverWidth.initial;
    return ListTile(
      dense: true,
      leading: const Icon(Icons.grid_view_rounded),
      title: Text(context.l10n!.mangaGridSize),
      trailing: IconButton(
        onPressed: () => ref
            .read(gridMinWidthProvider.notifier)
            .update(DBKeys.gridMangaCoverWidth.initial),
        icon: const Icon(Icons.refresh),
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Slider(
              label: width.toString(),
              value: width,
              min: 100,
              max: 999,
              onChanged: (value) => ref
                  .read(gridMinWidthProvider.notifier)
                  .update(value.roundToDouble()),
            ),
          ),
          Text(width.round().toString()),
        ],
      ),
    );
  }
}
