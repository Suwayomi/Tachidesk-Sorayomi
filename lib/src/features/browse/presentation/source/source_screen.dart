// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../../../../constants/language_list.dart';
import '../../../../utils/extensions/custom_extensions/iterable_extensions.dart';
import '../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../widgets/emoticons.dart';
import 'controller/source_controller.dart';
import 'source_list_tile.dart';

class SourceScreen extends HookConsumerWidget {
  const SourceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sourceController = ref.watch(sourceControllerProvider);
    final sourceMap = {...ref.watch(sourceMapFilteredProvider)};
    final localSource = sourceMap.remove("localsourcelang");
    final lastUsed = sourceMap.remove("lastUsed");
    useEffect(() {
      ref.invalidate(sourceControllerProvider);
      return;
    }, []);
    return sourceController.when(
      data: (data) {
        if ((sourceMap.isEmpty && localSource.isBlank && lastUsed.isBlank)) {
          return Emoticons(
            text: LocaleKeys.noSourcesFound.tr(),
            button: TextButton(
              onPressed: () => ref.refresh(sourceControllerProvider.future),
              child: Text(LocaleKeys.refresh.tr()),
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: () => ref.refresh(sourceControllerProvider.future),
          child: CustomScrollView(
            slivers: [
              if (lastUsed.isNotBlank) ...[
                SliverToBoxAdapter(
                  child: ListTile(
                    title: Text(languageMap["lastUsed"]?.displayName ?? ""),
                  ),
                ),
                SliverToBoxAdapter(
                    child: SourceListTile(source: lastUsed!.first))
              ],
              for (final k in sourceMap.keys) ...[
                if (sourceMap[k].isNotBlank) ...[
                  SliverToBoxAdapter(
                    child:
                        ListTile(title: Text(languageMap[k]?.displayName ?? k)),
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
                    title:
                        Text(languageMap["localsourcelang"]?.displayName ?? ""),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SourceListTile(source: localSource!.first),
                )
              ],
            ],
          ),
        );
      },
      loading: () => const CenterCircularProgressIndicator(),
      error: (error, trace) => Emoticons(
        text: error.toString(),
        button: TextButton(
          onPressed: () => ref.refresh(sourceControllerProvider.future),
          child: Text(LocaleKeys.refresh.tr()),
        ),
      ),
    );
  }
}
