// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:

// 🌎 Project imports:
import '../../../constants/app_sizes.dart';
import '../../../features/manga_book/domain/manga/manga_model.dart';
import '../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../server_image.dart';
import '../widgets/badge/badge.dart';

// @riverpod
// class LanguageBadge extends _$LanguageBadge
//     with SharedPreferenceClient<bool> {
//   @override
//   bool? build() => initialize(
//   client: ref.watch(sharedPreferencesProvider),
//   key: DBKeys.languageBadge.name,
//   initial: DBKeys.languageBadge.initial,
// );
// }

class MangaCoverGridTile extends StatelessWidget {
  const MangaCoverGridTile({
    super.key,
    required this.manga,
    this.needCountBadges = false,
    this.onTap,
    this.onLongPress,
  });
  final Manga manga;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final bool needCountBadges;
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: KBorderRadius.r12.radius),
        child: GridTile(
          header: BadgesRow(manga: manga, needCountBadges: needCountBadges),
          footer: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            dense: true,
            title: Text(
              (manga.title ?? manga.author ?? ""),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          child: manga.thumbnailUrl != null && manga.thumbnailUrl!.isNotEmpty
              ? Container(
                  foregroundDecoration: BoxDecoration(
                    border: Border.all(
                      width: 0,
                      color: context.theme.canvasColor,
                    ),
                    boxShadow: !needCountBadges && (manga.inLibrary ?? false)
                        ? [
                            BoxShadow(
                                color:
                                    context.theme.canvasColor.withOpacity(.5))
                          ]
                        : null,
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        context.theme.canvasColor.withOpacity(0),
                        context.theme.canvasColor.withOpacity(0.4),
                        context.theme.canvasColor.withOpacity(0.9),
                      ],
                    ),
                  ),
                  child: ServerImage(imageUrl: manga.thumbnailUrl.toString()),
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
