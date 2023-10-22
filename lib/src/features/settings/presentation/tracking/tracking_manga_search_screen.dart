// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../utils/extensions/custom_extensions.dart';
import '../../../../utils/misc/toast/toast.dart';
import '../../../../widgets/emoticons.dart';
import 'controller/tracking_controller.dart';
import 'widgets/track_search_list_tile.dart';

class TrackingMangaSearchScreen extends HookConsumerWidget {
  const TrackingMangaSearchScreen(
      {super.key, required this.trackerId, required this.mangaId});

  final int trackerId;
  final int mangaId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = trackSearchWithIdProvider(trackerId: trackerId);
    final list = ref.watch(provider);
    final toast = ref.read(toastProvider(context));

    refresh() => ref.refresh(provider.future);

    useEffect(() {
      list.showToastOnError(toast, withMicrotask: true);
      return;
    }, [list]);

    final searchController =
        useTextEditingController(text: ref.read(trackSearchQueryProvider));
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: const InputDecoration(
            isDense: true,
            border: OutlineInputBorder(),
            labelText: "",
          ),
          onSubmitted: (value) {
            ref.read(trackSearchQueryProvider.notifier).update(value);
          },
        ),
      ),
      body: list.showUiWhenData(
        context,
        (data) {
          if (data.isBlank) {
            return Emoticons(
              text: context.l10n!.noMangaFound,
              button: TextButton(
                onPressed: refresh,
                child: Text(context.l10n!.refresh),
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: refresh,
            child: ListView.builder(
              itemCount: data?.length ?? 0,
              itemBuilder: (context, index) => TrackSearchListTile(
                mangaId: mangaId,
                trackSearch: data![index],
              ),
            ),
          );
        },
        refresh: refresh,
      ),
    );
  }
}
