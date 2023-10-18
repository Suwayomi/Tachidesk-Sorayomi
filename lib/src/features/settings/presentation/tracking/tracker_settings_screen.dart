// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/urls.dart';
import '../../../../utils/extensions/custom_extensions.dart';
import '../../../../utils/launch_url_in_web.dart';
import '../../../../utils/misc/toast/toast.dart';
import '../../../../widgets/emoticons.dart';
import 'controller/tracking_controller.dart';
import 'widgets/tracker_list_tile.dart';

class TrackerSettingsScreen extends HookConsumerWidget {
  const TrackerSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(trackerListProvider);
    final toast = ref.read(toastProvider(context));

    refresh() => ref.refresh(trackerListProvider.future);

    useEffect(() {
      list.showToastOnError(toast, withMicrotask: true);
      return;
    }, [list]);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n!.tracking),
      ),
      body: list.showUiWhenData(
        context,
        (data) {
          if (data.isBlank) {
            return Emoticons(
              text: "no tracker found",
              button: TextButton(
                onPressed: refresh,
                child: Text(context.l10n!.refresh),
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: refresh,
            child: ListView.builder(
              itemCount: data?.length ?? 0,
              itemBuilder: (context, index) => TrackerListTile(
                tracker: data![index],
                refresh: refresh,
              ),
            ),
          );
        },
        refresh: refresh,
      ),
    );
  }
}
