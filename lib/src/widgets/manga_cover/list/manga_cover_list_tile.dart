// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '../../../constants/app_sizes.dart';
import '../widgets/badge/badge.dart';
import '../../../features/manga_book/domain/manga/manga_model.dart';
import '../../server_image.dart';

class MangaCoverListTile extends StatelessWidget {
  const MangaCoverListTile({
    Key? key,
    required this.manga,
    this.onTap,
    this.onLongPress,
    this.needCountBadges = false,
  }) : super(key: key);

  final Manga manga;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final bool needCountBadges;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: KEdgeInsets.a8.size,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ServerImage(
          imageUrl: manga.thumbnailUrl ?? "",
          size: const Size.square(48),
        ),
      ),
      trailing: BadgesRow(manga: manga, needCountBadges: needCountBadges),
      dense: true,
      title: Text(
        (manga.title ?? manga.author ?? ""),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
