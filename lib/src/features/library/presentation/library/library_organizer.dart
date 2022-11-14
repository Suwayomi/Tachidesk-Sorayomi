// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';

// 🌎 Project imports:
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../constants/app_sizes.dart';
import 'library_display.dart';
import 'library_filter.dart';
import 'library_sort.dart';

class LibraryOrganizer extends StatelessWidget {
  const LibraryOrganizer({
    Key? key,
    /* required this.controller */
  }) : super(key: key);
  // final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: TabBar(
            padding: KEdgeInsets.a8.size,
            labelColor: context.theme.indicatorColor,
            unselectedLabelColor: context.textTheme.bodyLarge!.color,
            indicator: BoxDecoration(
              borderRadius: KBorderRadius.r16.radius,
              color: context.theme.indicatorColor.withOpacity(.3),
            ),
            tabs: [
              Tab(text: LocaleKeys.filter.tr()),
              Tab(text: LocaleKeys.sort.tr()),
              Tab(text: LocaleKeys.display.tr()),
            ]),
        body: const TabBarView(
          children: [
            LibraryFilter(),
            LibrarySort(),
            LibraryDisplay(),
          ],
        ),
      ),
    );
  }
}
