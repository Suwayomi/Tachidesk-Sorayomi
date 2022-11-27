// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../../../constants/app_sizes.dart';
import '../../../../../i18n/locale_keys.g.dart';
import '../../../../../routes/router_config.dart';
import '../../../../../utils/extensions/custom_extensions/async_value_extensions.dart';
import '../../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../../utils/extensions/custom_extensions/string_extensions.dart';
import '../../../../../utils/launch_url_in_web.dart';
import '../../../../../utils/misc/custom_typedef.dart';
import '../../../../../utils/misc/toast/toast.dart';
import '../../../../../widgets/loading_widgets/loading_text_icon_button.dart';
import '../../../../../widgets/manga_cover/list/manga_cover_descriptive_list_tile.dart';
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
    final toast = ref.watch(toastProvider(context));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MangaCoverDescriptiveListTile(
          manga: manga,
          showBadges: false,
          onTitleClicked: (query) =>
              context.push(Routes.getGlobalSearch(query)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LoadingTextIconButton(
                onPressed: () async {
                  final val = await AsyncValue.guard(() async {
                    if (manga.inLibrary ?? false) {
                      await removeMangaFromLibrary();
                    } else {
                      await addMangaToLibrary();
                    }
                    await refresh();
                  });
                  val.showToastOnError(toast);
                },
                icon: Icon(
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
                  launchUrlInWeb(
                    (manga.realUrl ?? ""),
                    toast,
                  );
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
