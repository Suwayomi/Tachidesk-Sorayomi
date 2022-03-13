import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../generated/locales.g.dart';
import '../../../../main.dart';
import '../../../data/manga_model.dart';
import '../../../routes/app_pages.dart';

class MangaDescription extends StatelessWidget {
  const MangaDescription(
      {Key? key,
      required this.manga,
      required this.removeMangaFromLibrary,
      required this.addMangaToLibrary})
      : super(key: key);
  final Manga manga;
  final Future<void> Function() removeMangaFromLibrary;
  final Future<void> Function() addMangaToLibrary;
  @override
  Widget build(BuildContext context) {
    final LocalStorageService localStorageService =
        Get.find<LocalStorageService>();
    return Column(
      children: [
        Container(
          height: context.height * .3,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(16.0),
                child: GridTile(
                  child: (manga.thumbnailUrl ?? "").isNotEmpty
                      ? Image.network(
                          localStorageService.baseURL +
                              (manga.thumbnailUrl ?? "") +
                              "/?useCache=true",
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              SizedBox(
                            height: context.height * .3,
                            child: Icon(
                              Icons.book_rounded,
                              color: Colors.grey,
                              size: context.height * .2,
                            ),
                          ),
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => Get.toNamed(
                        Routes.globalSearch + "?query=${manga.title}",
                      ),
                      child: Text(
                        (manga.title ?? LocaleKeys.mangaScreen_unknown.tr),
                        style: context.textTheme.headline6,
                        overflow: TextOverflow.ellipsis,
                        semanticsLabel: manga.title,
                      ),
                    ),
                    Text(
                      LocaleKeys.mangaScreen_author.tr +
                          ": " +
                          (manga.author ?? LocaleKeys.mangaScreen_unknown.tr),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      LocaleKeys.mangaScreen_artist.tr +
                          ": " +
                          (manga.artist ?? LocaleKeys.mangaScreen_unknown.tr),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      LocaleKeys.mangaScreen_status.tr +
                          ": " +
                          (manga.status ?? LocaleKeys.mangaScreen_unknown.tr),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      LocaleKeys.mangaScreen_source.tr +
                          ": " +
                          (manga.source?.displayName ??
                              LocaleKeys.mangaScreen_unknown.tr),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                onPressed: () async {
                  if (manga.inLibrary ?? false) {
                    await removeMangaFromLibrary();
                  } else {
                    await addMangaToLibrary();
                  }
                },
                icon: Icon(
                  manga.inLibrary ?? false
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_outlined,
                ),
                style: TextButton.styleFrom(
                  primary: manga.inLibrary ?? false ? null : Colors.grey,
                ),
                label: Text(
                  LocaleKeys.mangaScreen_addToLibrary.tr,
                ),
              ),
              TextButton.icon(
                onPressed: () async {
                  if (!await launch(manga.realUrl ?? "",
                      forceSafariVC: false, forceWebView: false)) {
                    Clipboard.setData(
                      ClipboardData(
                        text: manga.realUrl ?? "",
                      ),
                    );
                    Get.rawSnackbar(
                      title: LocaleKeys.error_launchURL_title.trParams({
                        "website":
                            manga.title ?? LocaleKeys.mangaScreen_manga.tr,
                      }),
                      message: LocaleKeys.error_launchURL_message.trParams(
                        {
                          "url": manga.realUrl ?? "",
                        },
                      ),
                    );
                  }
                },
                icon: Icon(Icons.public),
                style: TextButton.styleFrom(primary: Colors.grey),
                label: Text(
                  LocaleKeys.mangaScreen_webView.tr,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ReadMoreText(
            manga.description ?? "",
            style: context.textTheme.bodyText1,
            moreStyle: TextStyle(color: context.theme.colorScheme.primary),
            lessStyle: TextStyle(color: context.theme.colorScheme.primary),
          ),
        ),
        Wrap(
          children: (manga.genre
                  ?.map<Widget>(
                    (e) => Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Chip(
                        label: Text(e),
                      ),
                    ),
                  )
                  .toList()) ??
              [Container()],
        ),
      ],
    );
  }
}
