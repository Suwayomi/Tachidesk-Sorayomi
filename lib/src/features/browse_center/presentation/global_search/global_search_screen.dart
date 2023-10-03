// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../utils/extensions/custom_extensions.dart';
import '../../../../utils/hooks/hook_primitives_wrapper.dart';
import '../../../../widgets/emoticons.dart';
import '../../../../widgets/search_field.dart';
import '../source/controller/source_controller.dart';
import 'controller/source_quick_search_controller.dart';
import 'widgets/source_short_search.dart';

class GlobalSearchScreen extends HookConsumerWidget {
  const GlobalSearchScreen({super.key, this.initialQuery});
  final String? initialQuery;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (query, setQuery) = useStateRecord(initialQuery);
    final quickSearchResult =
        ref.watch(quickSearchResultsProvider(query: query));
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n!.globalSearch),
        bottom: PreferredSize(
          preferredSize: kCalculateAppBarBottomSize([true]),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: SearchField(
                  initialText: query,
                  onSubmitted: setQuery,
                ),
              ),
            ],
          ),
        ),
      ),
      body: quickSearchResult.showUiWhenData(
        context,
        (data) => data.isBlank
            ? Emoticons(
                text: context.l10n!.noSourcesFound,
                button: TextButton(
                  onPressed: () => ref.invalidate(sourceListProvider),
                  child: Text(context.l10n!.refresh),
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  if (data[index].source.id == null) {
                    return const SizedBox.shrink();
                  } else {
                    return SourceShortSearch(
                      source: data[index].source,
                      mangaList: data[index].mangaList,
                      query: query,
                    );
                  }
                },
                itemCount: data.length,
              ),
      ),
    );
  }
}
