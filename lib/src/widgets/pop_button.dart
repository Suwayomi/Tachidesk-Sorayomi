import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';
import 'package:tachidesk_sorayomi/src/utils/extensions/custom_extensions/context_extensions.dart';

class PopButton extends StatelessWidget {
  const PopButton({super.key, this.popText});
  final String? popText;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.navPop(),
      child: Text(popText ?? LocaleKeys.common_cancel.tr()),
    );
  }
}
