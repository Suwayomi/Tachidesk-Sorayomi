// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 🌎 Project imports:
import '../utils/extensions/custom_extensions/context_extensions.dart';

class CustomCheckboxListTile<NotifierT extends AutoDisposeNotifier<bool?>>
    extends ConsumerWidget {
  const CustomCheckboxListTile({
    Key? key,
    required this.title,
    required this.provider,
    required this.onChanged,
    this.tristate = true,
  }) : super(key: key);
  final String title;
  final AutoDisposeNotifierProvider<NotifierT, bool?> provider;
  final ValueChanged<bool?> onChanged;
  final bool tristate;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final val = ref.watch(provider);
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: context.theme.indicatorColor,
      value: tristate ? val : (val ?? true),
      title: Text(title),
      tristate: tristate,
      onChanged: onChanged,
    );
  }
}
