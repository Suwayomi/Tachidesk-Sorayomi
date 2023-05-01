// Copyright (c) 2023 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../utils/extensions/custom_extensions.dart';
import '../controller/quick_search_controller.dart';
import 'search_result_to_widget.dart';

class QuickQueryResult extends ConsumerWidget {
  const QuickQueryResult({
    super.key,
    required this.afterClick,
    this.controller,
  });
  final VoidCallback afterClick;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(processesQuickSearchProvider(context: context));
    if (results.isBlank) return const SizedBox.shrink();
    return Card(
      clipBehavior: Clip.hardEdge,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: results!
              .map(
                (e) => SearchResultToWidget(
                  result: e,
                  afterClick: afterClick,
                  controller: controller,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
