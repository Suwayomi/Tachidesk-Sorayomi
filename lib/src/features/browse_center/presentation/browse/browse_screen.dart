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
import '../../../../routes/router_config.dart';
import '../../../../utils/extensions/custom_extensions/string_extensions.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../widgets/search_field.dart';
import '../extension/controller/extension_controller.dart';
import '../extension/extension_screen.dart';
import '../extension/widgets/extension_language_filter_dialog.dart';
import '../extension/widgets/install_extension_file.dart';
import '../source/source_screen.dart';
import '../source/widgets/source_language_filter.dart';

class BrowseScreen extends HookConsumerWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 2);
    useListenable(tabController);
    final key = useMemoized(() => GlobalKey());
    final showSearch = useState(false);
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.browse.tr()),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => showSearch.value = true,
            icon: Icon(
              tabController.index == 0
                  ? Icons.travel_explore_rounded
                  : Icons.search_rounded,
            ),
          ),
          if (tabController.index == 1) ...[
            const InstallExtensionFile(),
          ],
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => tabController.index == 0
                  ? const SourceLanguageFilter()
                  : const ExtensionLanguageFilterDialog(),
            ),
            icon: const Icon(Icons.translate_rounded),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: kCalculateAppBarBottomSize([true, showSearch.value]),
          child: Column(
            children: [
              TabBar(
                padding: KEdgeInsets.a8.size,
                isScrollable: context.isTablet,
                labelColor: context.theme.indicatorColor,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: context.theme.indicatorColor.withOpacity(.3),
                ),
                controller: tabController,
                tabs: [
                  Tab(text: LocaleKeys.sources.tr()),
                  Tab(text: LocaleKeys.extensions.tr()),
                ],
              ),
              if (showSearch.value)
                Align(
                  alignment: Alignment.centerRight,
                  child: tabController.index == 0
                      ? SearchField(
                          key: const ValueKey(0),
                          onSubmitted: (value) {
                            if (value.isNotBlank) {
                              context.push(Routes.getGlobalSearch(value));
                            }
                          },
                          onClose: () => showSearch.value = false,
                        )
                      : SearchField(
                          key: const ValueKey(1),
                          initialText: ref.read(extensionQueryProvider),
                          onChanged: (val) => ref
                              .read(extensionQueryProvider.notifier)
                              .state = val,
                          onClose: () => showSearch.value = false,
                        ),
                ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        key: key,
        controller: tabController,
        children: const [
          SourceScreen(),
          ExtensionScreen(),
        ],
      ),
    );
  }
}
