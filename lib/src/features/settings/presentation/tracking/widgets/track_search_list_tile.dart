// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../constants/app_sizes.dart';
import '../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../utils/misc/toast/toast.dart';
import '../../../../../widgets/server_image.dart';
import '../../../data/tracking/tracking_repository.dart';
import '../../../domain/tracking/tracking_model.dart';

class TrackSearchListTile extends ConsumerWidget {
  const TrackSearchListTile({
    super.key,
    required this.mangaId,
    required this.trackSearch,
  });

  final int mangaId;
  final TrackSearch trackSearch;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toast = ref.watch(toastProvider(context));

    return Padding(
      padding: KEdgeInsets.h16v8.size,
      child: InkWell(
        onTap: () async {
          toast.show(context.l10n!.processing);
          (await AsyncValue.guard(
            () async {
              await ref.read(trackingRepositoryProvider).bind(mangaId, trackSearch);
              toast.close();
              if (context.mounted) {
                context.pop();
              }
            },
          ))
              .showToastOnError(toast);
        },
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.transparent,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: SizedBox(
                    width: 80,
                    height: 120,
                    child: ServerImage(imageUrl: trackSearch.coverUrl ?? ""),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text(
                        trackSearch.title ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "${context.l10n!.trackingType} : ",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          trackSearch.publishingType ?? "",
                          style: context.textTheme.labelLarge,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("${context.l10n!.trackingStatus} : ",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.bold)),
                        Text(
                          trackSearch.publishingStatus ?? "",
                          style: context.textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ],
                )),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              trackSearch.summary ?? "",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(overflow: TextOverflow.ellipsis),
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
