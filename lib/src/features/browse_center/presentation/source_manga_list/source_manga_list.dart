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
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// 🌎 Project imports:
import '../../../../constants/enum.dart';
import '../../data/source_repository/source_repository.dart';
import 'controller/source_manga_controller.dart';
import '../../../manga_book/domain/manga/manga_model.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/async_value_extensions.dart';
import '../../../../utils/extensions/custom_extensions/iterable_extensions.dart';
import '../../../../utils/hooks/paging_controller_hook.dart';

class SourceMangaList extends HookConsumerWidget {
  const SourceMangaList({
    Key? key,
    required this.sourceId,
    required this.sourceType,
  }) : super(key: key);
  final String sourceId;
  final SourceType sourceType;

  Future<void> _fetchPage(
    SourceRepository repository,
    PagingController<int, Manga> controller,
    int pageKey,
  ) async {
    AsyncValue.guard(
      () async => await repository.getMangaList(
        sourceId: sourceId,
        sourceType: sourceType,
        pageNum: pageKey,
      ),
    ).then(
      (value) => value.whenOrNull(
        data: (recentChaptersPage) {
          if (recentChaptersPage != null &&
              recentChaptersPage.mangaList.isNotBlank) {
            if (recentChaptersPage.hasNextPage ?? false) {
              controller.appendPage(
                [...?recentChaptersPage.mangaList],
                pageKey + 1,
              );
            } else {
              controller.appendLastPage([...?recentChaptersPage.mangaList]);
            }
          }
        },
        error: (error, stackTrace) => controller.error = error,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final source = ref.watch(sourceProvider(sourceId));
    final controller = usePagingController<int, Manga>(firstPageKey: 0);
    final sourceRepository = ref.watch(sourceRepositoryProvider);
    useEffect(() {
      controller.addPageRequestListener(
        (pageKey) => _fetchPage(
          sourceRepository,
          controller,
          pageKey,
        ),
      );
      return;
    }, []);
    return source.showUiWhenData(
      data: (data) => Scaffold(
        appBar: AppBar(
          title: Text("${data?.displayName ?? ""} ${sourceType.name}"),
        ),
        body: Container(),
      ),
      refresh: () => ref.refresh(sourceProvider(sourceId)),
      wrapper: (body) => Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.source.tr()),
        ),
        body: body,
      ),
    );
  }
}
