// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '../../../constants/app_sizes.dart';
import '../../../features/manga_book/domain/manga/manga_model.dart';
import '../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../server_image.dart';
import '../widgets/manga_badges.dart';

// 📦 Package imports:

class MangaCoverGridTile extends StatelessWidget {
  const MangaCoverGridTile({
    super.key,
    required this.manga,
    this.needCountBadges = false,
    this.onPressed,
    this.onLongPress,
    this.showTitle = true,
    this.showBadges = true,
  });
  final Manga manga;
  final void Function()? onPressed;
  final void Function()? onLongPress;
  final bool needCountBadges;
  final bool showTitle;
  final bool showBadges;
  @override
  Widget build(BuildContext context) {
    final showShadow = showBadges || showTitle;
    return InkResponse(
      onTap: onPressed,
      onLongPress: onLongPress,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: KBorderRadius.r12.radius),
        child: GridTile(
          header: showBadges
              ? MangaBadgesRow(manga: manga, showCountBadges: needCountBadges)
              : null,
          footer: showTitle
              ? ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  dense: true,
                  title: Text(
                    (manga.title ?? manga.author ?? ""),
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              : null,
          child: manga.thumbnailUrl != null && manga.thumbnailUrl!.isNotEmpty
              ? Container(
                  foregroundDecoration: BoxDecoration(
                    border: Border.all(
                      width: 0,
                      color: context.theme.canvasColor,
                    ),
                    boxShadow: showShadow
                        ? [
                            BoxShadow(
                                color:
                                    context.theme.canvasColor.withOpacity(.5))
                          ]
                        : null,
                    gradient: showShadow
                        ? LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: [
                              context.theme.canvasColor.withOpacity(0),
                              context.theme.canvasColor.withOpacity(0.4),
                              context.theme.canvasColor.withOpacity(0.9),
                            ],
                          )
                        : null,
                  ),
                  child: ServerImage(imageUrl: manga.thumbnailUrl ?? ""),
                )
              : SizedBox(
                  height: context.height * .3,
                  child: Icon(
                    Icons.book_rounded,
                    color: Colors.grey,
                    size: context.height * .2,
                  ),
                ),
        ),
      ),
    );
  }
}
