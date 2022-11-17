// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';

// 🌎 Project imports:
import '../../../constants/app_sizes.dart';
import '../../../features/manga_book/domain/manga/manga_model.dart';
import '../../../i18n/locale_keys.g.dart';
import '../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../grid/manga_cover_grid_tile.dart';
import '../widgets/manga_badges.dart';
import '../widgets/manga_chips.dart';

class MangaCoverWithDescriptionTile extends StatelessWidget {
  const MangaCoverWithDescriptionTile({
    super.key,
    required this.manga,
    this.onPressed,
    this.onLongPress,
    this.showCountBadges = true,
  });
  final Manga manga;
  final bool showCountBadges;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  @override
  Widget build(BuildContext context) {
    final sourceName =
        " • ${manga.source?.displayName ?? LocaleKeys.unknownSource.tr()}";
    return InkWell(
      onTap: onPressed,
      onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 128,
              height: 160,
              child: MangaCoverGridTile(
                manga: manga,
                showBadges: false,
                showTitle: false,
                showDarkOverlay: false,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      // onTap: () => context.push(
                      //   "${Routes.globalSearch}?query=${manga.title}",
                      // ),
                      child: Text(
                        (manga.title ?? LocaleKeys.unknownManga.tr()),
                        style: context.textTheme.titleLarge,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        semanticsLabel: manga.title,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text(
                        "${manga.author ?? LocaleKeys.unknownAuthor.tr}",
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.textTheme.bodySmall?.color,
                        ),
                      ),
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        if (manga.status != null) ...[
                          Icon(
                            manga.status!.icon,
                            size: 16,
                            color: context.textTheme.bodySmall?.color,
                          ),
                          Text(
                            " ${manga.status!.toString().tr()}",
                            style: context.textTheme.bodySmall,
                          ),
                        ],
                        if (manga.source?.displayName != null)
                          Text(
                            sourceName,
                            style: context.textTheme.bodySmall,
                          ),
                      ],
                    ),
                    if (showCountBadges)
                      context.isTablet
                          ? MangaChipsRow(
                              manga: manga,
                              showCountBadges: true,
                            )
                          : MangaBadgesRow(
                              padding: KEdgeInsets.v8.size,
                              manga: manga,
                              showCountBadges: true,
                            ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
