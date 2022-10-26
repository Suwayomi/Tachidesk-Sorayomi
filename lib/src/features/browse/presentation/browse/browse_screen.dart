import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tachidesk_sorayomi/src/constants/app_sizes.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/context_extensions.dart';

import '../sources/source_screen.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.screenTitle_browse.tr()),
          bottom: TabBar(
              padding: Edge.a8.size,
              isScrollable: context.isTablet,
              labelColor: context.theme.indicatorColor,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: context.theme.indicatorColor.withOpacity(.3),
              ),
              tabs: [
                Tab(text: LocaleKeys.screenTitle_sources.tr()),
                Tab(text: LocaleKeys.screenTitle_extensions.tr()),
              ]),
        ),
        body: const TabBarView(
          children: [
            SourceScreen(),
            Scaffold(),
          ],
        ),
      ),
    );
  }
}
