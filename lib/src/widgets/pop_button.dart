// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';

// 🌎 Project imports:
import '../i18n/locale_keys.g.dart';
import '../utils/extensions/custom_extensions/context_extensions.dart';

class PopButton extends StatelessWidget {
  const PopButton({super.key, this.popText});
  final String? popText;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.navPop(),
      child: Text(popText ?? LocaleKeys.cancel.tr()),
    );
  }
}
