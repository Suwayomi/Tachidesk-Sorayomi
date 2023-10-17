import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../routes/router_config.dart';
import '../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../widgets/server_image.dart';
import '../../../../manga_book/domain/manga/manga_model.dart';
import '../../../domain/tracking/tracking_model.dart';


import '../controller/tracking_controller.dart';

class TrackerAddWidget extends ConsumerWidget {
  const TrackerAddWidget(
      {super.key,
      required this.manga,
      required this.tracker,
      required this.refresh});

  final Manga manga;
  final MangaTracker tracker;
  final AsyncCallback refresh;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: ServerImage(
            imageUrl: tracker.icon ?? "",
            size: const Size.square(48),
          ),
        ),
        title: Text(context.l10n!.addTracking),
        onTap: () async {
          ref.watch(trackSearchQueryProvider);
          ref.read(trackSearchQueryProvider.notifier).update(manga.title ?? "");
          await MangaTrackSearchRoute(
              trackerId: tracker.id!,
              mangaId: manga.id!
          ).push(context);
          await refresh();
        });
  }
}
