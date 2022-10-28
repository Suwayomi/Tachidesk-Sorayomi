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
import '../../domain/extension/extension_model.dart';
import 'controller/extension_controller.dart';
import 'extension_list_tile.dart';

class ExtensionScreen extends HookConsumerWidget {
  const ExtensionScreen({Key? key}) : super(key: key);

  List<Widget> extensionSet({
    required String title,
    required List<Extension>? extensions,
  }) {
    if (extensions.isBlank) return [];
    return [
      SliverToBoxAdapter(
        child: ListTile(
          title: Text(title),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => ExtensionListTile(
            extension: extensions[index],
          ),
          childCount: extensions!.length,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toast = ref.watch(toastProvider(context));
    final extensionMap = {...ref.watch(extensionMapFilteredAndQueriedProvider)};
    final installed = extensionMap.remove("installed");
    final update = extensionMap.remove("update");
    final all = extensionMap.remove("all");
    ref.listen(
      extensionControllerProvider,
      ((_, state) => state.showToastOnError(toast)),
    );
    useEffect(() {
      Future.microtask(
          ref.read(extensionControllerProvider.notifier).loadExtensions);
      return;
    }, []);
    return RefreshIndicator(
      onRefresh: ref.read(extensionControllerProvider.notifier).loadExtensions,
      child: CustomScrollView(
        slivers: [
          if (installed.isNotBlank)
            ...extensionSet(
              title: languageMap["installed"]?.displayName ?? "",
              extensions: installed,
            ),
          if (update.isNotBlank)
            ...extensionSet(
              title: languageMap["update"]?.displayName ?? "",
              extensions: update,
            ),
          if (all.isNotBlank)
            ...extensionSet(
              title: languageMap["all"]?.displayName ?? "",
              extensions: all,
            ),
          for (final k in extensionMap.keys)
            ...extensionSet(
              title: languageMap[k]?.displayName ?? k,
              extensions: extensionMap[k],
            ),
        ],
      ),
    );
  }
}
