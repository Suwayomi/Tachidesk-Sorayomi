// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../../../../constants/language_list.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../../../../utils/extensions/custom_extensions/context_extensions.dart';
import '../../../../utils/extensions/custom_extensions/iterable_extensions.dart';
import '../../../../utils/misc/custom_typedef.dart';
import '../../../../widgets/custom_circular_progress_indicator.dart';
import '../../../../widgets/emoticons.dart';
import '../../domain/extension/extension_model.dart';
import '../browse/controller/browse_controller.dart';
import 'controller/extension_controller.dart';
import 'extension_list_tile.dart';
import 'extension_search_field.dart';

class ExtensionScreen extends HookConsumerWidget {
  const ExtensionScreen({Key? key}) : super(key: key);

  List<Widget> extensionSet({
    Key? key,
    required String title,
    required List<Extension>? extensions,
    required AsyncVoidCallBack refresh,
  }) {
    if (extensions.isBlank) return [];
    return [
      SliverToBoxAdapter(
        child: ListTile(
          title: Text(title),
        ),
      ),
      SliverList(
        key: key,
        delegate: SliverChildBuilderDelegate(
          (context, index) => ExtensionListTile(
            key: ValueKey(extensions[index].pkgName),
            extension: extensions[index],
            refresh: refresh,
          ),
          childCount: extensions!.length,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showSearch = ref.watch(browseScreenShowSearchProvider);
    final extensionQuery = ref.watch(extensionQueryProvider);
    final extensionController = ref.watch(extensionControllerProvider);
    final extensionMap = {
      ...ref.watch(
        extensionMapFilteredAndQueriedProvider(query: extensionQuery),
      )
    };
    final installed = extensionMap.remove("installed");
    final update = extensionMap.remove("update");
    final all = extensionMap.remove("all");
    refresh() => ref.refresh(extensionControllerProvider.future);
    return extensionController.when(
      loading: () => const CenterCircularProgressIndicator(),
      error: (error, trace) => Emoticons(
        text: error.toString(),
        button: TextButton(
          onPressed: refresh,
          child: Text(LocaleKeys.refresh.tr()),
        ),
      ),
      data: (data) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (showSearch)
            SizedBox(
              width:
                  context.isLargeTablet ? context.widthScale(scale: .3) : null,
              child: const ExtensionSearchField(),
            ),
          Expanded(
            child: (extensionMap.isEmpty &&
                    installed.isBlank &&
                    update.isBlank &&
                    all.isBlank)
                ? Emoticons(
                    text: LocaleKeys.extensionListEmpty.tr(),
                    button: TextButton(
                      onPressed: refresh,
                      child: Text(LocaleKeys.refresh.tr()),
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: () =>
                        ref.refresh(extensionControllerProvider.future),
                    child: CustomScrollView(
                      slivers: [
                        if (installed.isNotBlank)
                          ...extensionSet(
                            key: const ValueKey("installed"),
                            title: languageMap["installed"]?.displayName ?? "",
                            extensions: installed,
                            refresh: refresh,
                          ),
                        if (update.isNotBlank)
                          ...extensionSet(
                            key: const ValueKey("update"),
                            title: languageMap["update"]?.displayName ?? "",
                            extensions: update,
                            refresh: refresh,
                          ),
                        if (all.isNotBlank)
                          ...extensionSet(
                            key: const ValueKey("all"),
                            title: languageMap["all"]?.displayName ?? "",
                            extensions: all,
                            refresh: refresh,
                          ),
                        for (final k in extensionMap.keys)
                          ...extensionSet(
                            key: ValueKey(k),
                            title: languageMap[k]?.displayName ?? k,
                            extensions: extensionMap[k],
                            refresh: refresh,
                          ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
