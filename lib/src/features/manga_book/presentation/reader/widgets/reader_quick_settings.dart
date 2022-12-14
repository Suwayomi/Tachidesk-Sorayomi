// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../constants/enum.dart';
import '../../../../../i18n/locale_keys.g.dart';
import '../../../../../widgets/enum_popup.dart';
import '../../../data/manga_book_repository.dart';
import '../../../domain/manga/manga_model.dart';
import '../../manga_details/controller/manga_details_controller.dart';

class ReaderQuickSettings extends HookConsumerWidget {
  const ReaderQuickSettings({
    Key? key,
    required this.manga,
    required this.defaultReaderMode,
    required this.defaultReaderNavigationLayout,
  }) : super(key: key);
  final ReaderMode defaultReaderMode;
  final ReaderNavigationLayout defaultReaderNavigationLayout;
  final Manga manga;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showReaderModePopup = useCallback(
        (BuildContext context) => showDialog(
              context: context,
              builder: (context) => EnumPopup<ReaderMode>(
                enumList: ReaderMode.values,
                value: defaultReaderMode,
                onChange: (enumValue) async {
                  if (context.mounted) context.pop();

                  await AsyncValue.guard(
                    () => ref.read(mangaBookRepositoryProvider).patchMangaMeta(
                          mangaId: "${manga.id}",
                          key: ChapterMeta.readerMode.key,
                          value: enumValue.name,
                        ),
                  );
                  ref.invalidate(
                    mangaWithIdProvider(mangaId: "${manga.id}"),
                  );
                },
              ),
            ),
        []);

    final VoidCallback showReaderNavigationLayoutPopup = useCallback(
        () => showDialog(
              context: context,
              builder: (context) => EnumPopup<ReaderNavigationLayout>(
                enumList: ReaderNavigationLayout.values,
                value: defaultReaderNavigationLayout,
                onChange: (enumValue) async {
                  if (context.mounted) context.pop();

                  await AsyncValue.guard(
                    () => ref.read(mangaBookRepositoryProvider).patchMangaMeta(
                          mangaId: "${manga.id}",
                          key: ChapterMeta.readerNavigationLayout.key,
                          value: enumValue.name,
                        ),
                  );
                  ref.invalidate(
                    mangaWithIdProvider(mangaId: "${manga.id}"),
                  );
                },
              ),
            ),
        []);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: const Icon(
            Icons.app_settings_alt_outlined,
          ),
          title: Text(
            LocaleKeys.readerMode.tr(),
          ),
          subtitle: Text(
            defaultReaderMode.toString().tr(),
          ),
          onTap: () {
            context.pop();
            showReaderModePopup(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.touch_app_rounded,
          ),
          title: Text(
            LocaleKeys.readerNavigationLayout.tr(),
          ),
          subtitle: Text(
            defaultReaderNavigationLayout.toString().tr(),
          ),
          onTap: () {
            context.pop();
            showReaderNavigationLayoutPopup();
          },
        ),
      ],
    );
  }
}
