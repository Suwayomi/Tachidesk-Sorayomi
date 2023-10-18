// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../constants/app_sizes.dart';

import '../../../../../routes/router_config.dart';
import '../../../../../utils/extensions/custom_extensions.dart';
import '../../../../../utils/launch_url_in_web.dart';
import '../../../../../utils/misc/toast/toast.dart';
import '../../../../../widgets/async_buttons/async_text_button_icon.dart';
import '../../../../../widgets/manga_cover/list/manga_cover_descriptive_list_tile.dart';
import '../../../../settings/presentation/tracking/widgets/tracker_setting_widget.dart';
import '../../../domain/manga/manga_model.dart';

class MangaDescription extends HookConsumerWidget {
  const MangaDescription({
    super.key,
    required this.manga,
    required this.removeMangaFromLibrary,
    required this.addMangaToLibrary,
    required this.refresh,
  });
  final Manga manga;
  final AsyncCallback refresh;
  final AsyncCallback removeMangaFromLibrary;
  final AsyncCallback addMangaToLibrary;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = useState(context.isTablet);
    final trackerAvailable = manga.trackers?.isNotEmpty == true;
    final trackerCount = useState(0);
    useEffect(() {
      trackerCount.value =
          manga.trackers?.where((t) => t.record != null).length ?? 0;
    }, [manga]);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MangaCoverDescriptiveListTile(
          manga: manga,
          showBadges: false,
          onTitleClicked: (query) =>
              GlobalSearchRoute(query: query).push(context),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  child: AsyncTextButtonIcon(
                onPressed: () async {
                  final val = await AsyncValue.guard(() async {
                    if (manga.inLibrary.ifNull()) {
                      await removeMangaFromLibrary();
                    } else {
                      await addMangaToLibrary();
                    }
                    await refresh();
                  });
                  if (context.mounted) {
                    val.showToastOnError(ref.read(toastProvider(context)));
                  }
                },
                isPrimary: manga.inLibrary.ifNull(),
                primaryIcon: const Icon(Icons.favorite_rounded),
                primaryStyle: TextButton.styleFrom(padding: EdgeInsets.zero),
                secondaryIcon: const Icon(Icons.favorite_border_outlined),
                secondaryStyle: TextButton.styleFrom(
                    foregroundColor: Colors.grey, padding: EdgeInsets.zero),
                primaryLabel: Text(context.l10n!.inLibrary),
                secondaryLabel: Text(context.l10n!.addToLibrary),
              )),
              if (trackerAvailable)
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {
                      refresh();
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: context.theme.cardColor,
                        clipBehavior: Clip.hardEdge,
                        builder: (context) => TrackerSettingWidget(
                            mangaId: manga.id ?? 0, refresh: refresh),
                      );
                    },
                    icon: trackerCount.value > 0
                        ? const Icon(Icons.done_rounded)
                        : const Icon(Icons.sync_outlined),
                    style: trackerCount.value > 0
                        ? TextButton.styleFrom(padding: EdgeInsets.zero)
                        : TextButton.styleFrom(
                            foregroundColor: Colors.grey,
                            padding: EdgeInsets.zero),
                    label: trackerCount.value > 0
                        ? (trackerCount.value == 1
                            ? Text(context.l10n!.oneTracker)
                            : Text(context.l10n!.nTracker(trackerCount.value)))
                        : Text(context.l10n!.tracking),
                  ),
                ),
              if (manga.realUrl.isNotBlank)
                Expanded(
                    child: TextButton.icon(
                  onPressed: () async {
                    launchUrlInWeb(
                      context,
                      (manga.realUrl ?? ""),
                      ref.read(toastProvider(context)),
                    );
                  },
                  icon: const Icon(Icons.public),
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.grey, padding: EdgeInsets.zero),
                  label: Text(context.l10n!.webView),
                )),
            ],
          ),
        ),
        if (manga.description.isNotBlank)
          Padding(
            padding: KEdgeInsets.a16.size,
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Text(
                  "${manga.description}\n",
                  maxLines: isExpanded.value ? null : 3,
                ),
                InkWell(
                  child: Container(
                    margin: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: context.theme.canvasColor.withOpacity(.7),
                        ),
                      ],
                      gradient: LinearGradient(
                        colors: [
                          context.theme.canvasColor.withOpacity(0),
                          context.theme.canvasColor.withOpacity(.3),
                          context.theme.canvasColor.withOpacity(.5),
                          context.theme.canvasColor.withOpacity(.6),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        isExpanded.value
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                      ),
                    ),
                  ),
                  onTap: () => isExpanded.value = (!isExpanded.value),
                ),
              ],
            ),
          ),
        if (isExpanded.value)
          Padding(
            padding: KEdgeInsets.h16.size,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              // alignment: WrapAlignment.spaceBetween,
              children: [
                ...?manga.genre
                    ?.map<Widget>(
                      (e) => Chip(label: Text(e)),
                    )
                    .toList()
              ],
            ),
          )
        else
          Padding(
            padding: KEdgeInsets.h16.size,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...?manga.genre
                      ?.map<Widget>(
                        (e) => Padding(
                          padding: KEdgeInsets.h4.size,
                          child: Chip(label: Text(e)),
                        ),
                      )
                      .toList()
                ],
              ),
            ),
          ),
      ],
    );
  }
}
