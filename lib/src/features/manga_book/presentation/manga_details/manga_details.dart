// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../widgets/emoticons.dart';
import 'controller/manga_details_controller.dart';
import 'widgets/big_screen_manga_details.dart';
import 'widgets/small_screen_manga_details.dart';

class MangaDetails extends ConsumerWidget {
  const MangaDetails({super.key, required this.mangaId});
  final String mangaId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = mangaWithIdProvider(mangaId: mangaId);
    final manga = ref.watch(provider);
    return manga.when(
      data: (data) => Scaffold(
        appBar: AppBar(
          title: Text(data?.title ?? LocaleKeys.manga.tr()),
        ),
        body: data != null
            ? context.isTablet
                ? BigScreenMangaDetails(
                    manga: data,
                    mangaId: mangaId,
                    onRefresh: (val) =>
                        ref.read(provider.notifier).refresh(val),
                  )
                : SmallScreenMangaDetails(
                    manga: data,
                    mangaId: mangaId,
                    onRefresh: (val) =>
                        ref.read(provider.notifier).refresh(val),
                  )
            : Emoticons(
                text: LocaleKeys.noMangaFound.toString(),
                button: TextButton(
                  onPressed: () => ref.invalidate(provider),
                  child: Text(
                    LocaleKeys.refresh.tr(),
                  ),
                ),
              ),
      ),
      error: (error, stackTrace) => Scaffold(
        appBar: AppBar(title: Text(LocaleKeys.manga.tr())),
        body: Emoticons(
          text: error.toString(),
          button: TextButton(
            onPressed: () => ref.invalidate(provider),
            child: Text(
              LocaleKeys.refresh.tr(),
            ),
          ),
        ),
      ),
      loading: () => Scaffold(
        appBar: AppBar(title: Text(LocaleKeys.manga.tr())),
        body: const CenterCircularProgressIndicator(),
      ),
    );
  }
}
