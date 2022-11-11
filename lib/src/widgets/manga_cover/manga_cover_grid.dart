// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 🌎 Project imports:
import '../../constants/app_sizes.dart';
import '../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../utils/extensions/custom_extensions/int_extensions.dart';
import '../server_image.dart';
import '../../constants/db_keys.dart';
import '../../features/manga_book/domain/manga/manga_model.dart';
import '../../i18n/locale_keys.g.dart';
import '../../utils/storage/local/shared_preferences_client.dart';

part 'manga_cover_grid.g.dart';

@riverpod
class DownloadedBadge extends _$DownloadedBadge
    with SharedPreferenceClient<bool> {
  @override
  bool? build() {
    client = ref.watch(sharedPreferencesProvider);
    initial = DBKeys.downloadedBadge.initial;
    key = DBKeys.downloadedBadge.name;
    return get;
  }
}

@riverpod
class UnreadBadge extends _$UnreadBadge with SharedPreferenceClient<bool> {
  @override
  bool? build() {
    client = ref.watch(sharedPreferencesProvider);
    initial = DBKeys.unreadBadge.initial;
    key = DBKeys.unreadBadge.name;
    return get;
  }
}

// @riverpod
// class LanguageBadge extends _$LanguageBadge
//     with SharedPreferenceClient<bool> {
//   @override
//   bool? build() {
//     client = ref.watch(sharedPreferencesProvider);
//     initial = DBKeys.languageBadge.initial;
//     key = DBKeys.languageBadge.name;
//     return get;
//   }
// }

class MangaCoverGrid extends StatelessWidget {
  const MangaCoverGrid({
    super.key,
    required this.manga,
    this.isLibraryScreen = false,
    this.onTap,
    this.onLongPress,
  });
  final Manga manga;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final bool isLibraryScreen;
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: KBorderRadius.r12.radius),
        child: GridTile(
          header: !isLibraryScreen
              ? manga.inLibrary ?? false
                  ? Row(
                      children: [
                        Badge(
                          text: LocaleKeys.inLibrary.tr(),
                          color: context.theme.colorScheme.primary,
                          textColor: context.theme.colorScheme.onPrimary,
                        ),
                      ],
                    )
                  : null
              : BadgesRow(manga: manga),
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
                    boxShadow: !isLibraryScreen && (manga.inLibrary ?? false)
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

class BadgesRow extends ConsumerWidget {
  const BadgesRow({super.key, required this.manga});
  final Manga manga;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final downloadedBadge = ref.watch(downloadedBadgeProvider) ?? true;
    final unreadBadge = ref.watch(unreadBadgeProvider) ?? true;
    // final languageBadge = ref.watch(languageBadgeProvider) ?? false;
    return Padding(
      padding: KEdgeInsets.a8.size,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: KBorderRadius.r8.radius,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (manga.unreadCount.isGreaterThan(0) && downloadedBadge)
                  Badge(
                    text: "${manga.unreadCount ?? 0}",
                    color: context.theme.colorScheme.primary,
                    textColor: context.theme.colorScheme.onPrimary,
                  ),
                if (manga.downloadCount.isGreaterThan(0) && unreadBadge)
                  Badge(
                    text: "${manga.unreadCount ?? 0}",
                    color: context.theme.colorScheme.secondary,
                    textColor: context.theme.colorScheme.onSecondary,
                  ),
              ],
            ),
          ),
          const Spacer(),
          // if ((manga.source?.lang?.code) != null && languageBadge)
          //   ClipRRect(
          //     borderRadius: KBorderRadius.r8.radius,
          //     child: Badge(
          //       text: manga.source!.lang!.code!,
          //       color: context.theme.colorScheme.tertiary,
          //       textColor: context.theme.colorScheme.onTertiary,
          //     ),
          //   )
        ],
      ),
    );
  }
}

class Badge extends StatelessWidget {
  const Badge({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
  });
  final String text;
  final Color color;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: color,
      shape: const RoundedRectangleBorder(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
        child: Text(text, style: TextStyle(color: textColor)),
      ),
    );
  }
}
