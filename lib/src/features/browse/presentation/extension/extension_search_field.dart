// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../../../../constants/app_sizes.dart';
import 'controller/extension_controller.dart';
import '../../../../i18n/locale_keys.g.dart';
import '../browse/controller/browse_controller.dart';

class ExtensionSearchField extends HookConsumerWidget {
  const ExtensionSearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    useEffect(() {
      listener() =>
          ref.read(extensionQueryProvider.notifier).state = controller.text;
      controller.addListener(listener);
      return () => controller.removeListener(listener);
    }, []);
    return Padding(
      padding: KEdgeInsets.h16v8.size,
      child: TextField(
        autofocus: true,
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          border: const OutlineInputBorder(),
          hintText: LocaleKeys.search.tr(),
          suffixIcon: IconButton(
            onPressed: ref.read(browseScreenShowSearchProvider.notifier).toggle,
            icon: const Icon(Icons.close_rounded),
          ),
        ),
      ),
    );
  }
}
