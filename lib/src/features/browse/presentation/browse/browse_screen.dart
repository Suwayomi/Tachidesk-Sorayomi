// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';

// 🌎 Project imports:
import '../../../../constants/app_sizes.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../sources/source_screen.dart';

// 🐦 Flutter imports:

// 📦 Package imports:

// 🌎 Project imports:

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
