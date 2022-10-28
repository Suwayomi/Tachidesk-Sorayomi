// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import 'package:tachidesk_sorayomi/src/constants/language_list.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/iterable_extensions.dart';
import '../../../../utils/extensions/custom_extensions/async_value_extensions.dart';
import '../../../../utils/misc/toast.dart';
import 'controller/source_controller.dart';
import 'source_list_tile.dart';

class SourceScreen extends HookConsumerWidget {
  const SourceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toast = ref.watch(toastProvider(context));
    final sourceMap = {...ref.watch(sourceMapFilteredProvider)};
    final localSource = sourceMap.remove("localsourcelang");
    final lastUsed = sourceMap.remove("lastUsed");
    ref.listen(
      sourceControllerProvider,
      ((_, state) => state.showToastOnError(toast)),
    );
    useEffect(() {
      Future.microtask(ref.read(sourceControllerProvider.notifier).loadSources);
      return;
    }, []);
    return RefreshIndicator(
      onRefresh: ref.read(sourceControllerProvider.notifier).loadSources,
      child: CustomScrollView(
        slivers: [
          if (lastUsed.isNotBlank) ...[
            SliverToBoxAdapter(
              child: ListTile(
                title: Text(languageMap["lastUsed"]?.displayName ?? ""),
              ),
            ),
            SliverToBoxAdapter(child: SourceListTile(source: lastUsed!.first))
          ],
          for (final k in sourceMap.keys) ...[
            if (sourceMap[k].isNotBlank) ...[
              SliverToBoxAdapter(
                child: ListTile(title: Text(languageMap[k]?.displayName ?? k)),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => SourceListTile(
                    source: sourceMap[k]![index],
                  ),
                  childCount: sourceMap[k]?.length,
                ),
              )
            ]
          ],
          if (localSource.isNotBlank) ...[
            SliverToBoxAdapter(
              child: ListTile(
                title: Text(languageMap["localsourcelang"]?.displayName ?? ""),
              ),
            ),
            SliverToBoxAdapter(
              child: SourceListTile(source: localSource!.first),
            )
          ],
        ],
      ),
    );
  }
}
