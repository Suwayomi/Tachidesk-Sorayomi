// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

// 🌎 Project imports:
import '../../../../../constants/app_sizes.dart';
import '../../../../../i18n/locale_keys.g.dart';
import '../../../../../utils/extensions/custom_extensions/async_value_extensions.dart';
import '../../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../../utils/extensions/custom_extensions/string_extensions.dart';
import '../../../../../utils/misc/custom_typedef.dart';
import '../../../../../utils/misc/toast/toast.dart';
import '../../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../../widgets/manga_cover/list/manga_cover_with_description_tile.dart';
import '../../../domain/manga/manga_model.dart';

class MangaDescription extends HookConsumerWidget {
  const MangaDescription({
    Key? key,
    required this.manga,
    required this.removeMangaFromLibrary,
    required this.addMangaToLibrary,
    required this.refresh,
  }) : super(
          key: key,
        );
  final Manga manga;
  final AsyncVoidCallBack refresh;
  final AsyncVoidCallBack removeMangaFromLibrary;
  final AsyncVoidCallBack addMangaToLibrary;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = useState(context.isTablet);
    final isFavLoading = useState(false);
    final toast = ref.watch(toastProvider(context));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MangaCoverWithDescriptionTile(
          manga: manga,
          showCountBadges: false,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                onPressed: isFavLoading.value
                    ? null
                    : () async {
                        isFavLoading.value = true;
                        final val = await AsyncValue.guard(() async {
                          if (manga.inLibrary ?? false) {
                            await removeMangaFromLibrary();
                          } else {
                            await addMangaToLibrary();
                          }
                          await refresh();
                        });
                        val.showToastOnError(toast);
                        isFavLoading.value = false;
                      },
                icon: isFavLoading.value
                    ? const MiniCircularProgressIndicator()
                    : Icon(
                        manga.inLibrary ?? false
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_outlined,
                      ),
                style: TextButton.styleFrom(
                  foregroundColor:
                      manga.inLibrary ?? false ? null : Colors.grey,
                ),
                label: Text(
                  manga.inLibrary ?? false
                      ? LocaleKeys.inLibrary.tr()
                      : LocaleKeys.addToLibrary.tr(),
                ),
              ),
              TextButton.icon(
                onPressed: () async {
                  if (!await launchUrl(
                    Uri.tryParse(manga.realUrl ?? "") ?? Uri(),
                    mode: LaunchMode.externalApplication,
                  )) {
                    Clipboard.setData(
                      ClipboardData(
                        text: manga.realUrl ?? "",
                      ),
                    );
                    // Get.rawSnackbar(
                    //   title: LocaleKeys.error_launchURL_title.trParams({
                    //     "website":
                    //         manga.title ?? LocaleKeys.mangaScreen_manga.tr,
                    //   }),
                    //   message: LocaleKeys.error_launchURL_message.trParams(
                    //     {
                    //       "url": manga.realUrl ?? "",
                    //     },
                    //   ),
                    // );
                  }
                },
                icon: const Icon(Icons.public),
                style: TextButton.styleFrom(foregroundColor: Colors.grey),
                label: Text(LocaleKeys.webView.tr()),
              ),
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
                  onTap: () => isExpanded.value = !isExpanded.value,
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
              children: [
                ...?manga.genre
                    ?.map<Widget>((e) => MangaGenreChip(text: e))
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
                          child: MangaGenreChip(text: e),
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

class MangaGenreChip extends StatelessWidget {
  const MangaGenreChip({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(text));
  }
}
