// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../utils/extensions/custom_extensions.dart';
import '../../../../widgets/emoticons.dart';
import '../../../../widgets/search_field.dart';
import '../../../browse_center/presentation/source/controller/source_controller.dart';
import '../../../manga_book/domain/manga/manga_model.dart';
import '../widgets/migration_source_short_search.dart';
import '../../controller/migration_controller.dart';

class MigrationGlobalSearchScreen extends HookConsumerWidget {
  const MigrationGlobalSearchScreen({
    super.key,
    required this.sourceManga,
  });

  final MangaDto sourceManga;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = useState<String?>(sourceManga?.title);
    final migrationSearchResult = ref.watch(migrationGlobalSearchResultsProvider(query: query.value));
    
    // Auto-search with source manga title on screen load
    useEffect(() {
      final initialQuery = sourceManga?.title ?? '';
      if (initialQuery.isNotEmpty) {
        query.value = initialQuery;
      }
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.searchAllSources),
        bottom: PreferredSize(
          preferredSize: kCalculateAppBarBottomSize([true]),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: SearchField(
                  initialText: query.value,
                  onSubmitted: (value) => query.value = value,
                ),
              ),
            ],
          ),
        ),
      ),
      body: migrationSearchResult.showUiWhenData(
        context,
        (data) => data.isBlank
            ? Emoticons(
                title: context.l10n.noSourcesFound,
                button: TextButton(
                  onPressed: () => ref.invalidate(sourceMapFilteredProvider),
                  child: Text(context.l10n.refresh),
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return MigrationSourceShortSearch(
                    source: data[index].source,
                    mangaList: data[index].mangaList,
                    query: query.value,
                    sourceManga: sourceManga,
                  );
                },
                itemCount: data.length,
              ),
      ),
    );
  }
} 