// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// 🌎 Project imports:
import '../../../../constants/app_sizes.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../sources/source_language_filter.dart';
import '../sources/source_screen.dart';

class BrowseScreen extends HookWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 2);
    final index = useState(0);
    final key = useMemoized(() => GlobalKey());
    useEffect(() {
      listener() => index.value = tabController.index;
      tabController.addListener(listener);
      return () => tabController.removeListener(listener);
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.screenTitle_browse.tr()),
        actions: [
          if (index.value == 0) ...[
            IconButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => const SourceLanguageFilter(),
              ),
              icon: const Icon(Icons.translate_rounded),
            )
          ],
        ],
        bottom: TabBar(
            padding: Edge.a8.size,
            isScrollable: context.isTablet,
            labelColor: context.theme.indicatorColor,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: context.theme.indicatorColor.withOpacity(.3),
            ),
            controller: tabController,
            tabs: [
              Tab(text: LocaleKeys.screenTitle_sources.tr()),
              Tab(text: LocaleKeys.screenTitle_extensions.tr()),
            ]),
      ),
      body: TabBarView(
        key: key,
        controller: tabController,
        children: const [
          SourceScreen(),
          Scaffold(),
        ],
      ),
    );
  }
}
