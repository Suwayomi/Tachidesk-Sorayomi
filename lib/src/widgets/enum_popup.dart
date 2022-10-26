import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tachidesk_sorayomi/src/constants/app_sizes.dart';
import 'package:tachidesk_sorayomi/src/widgets/pop_button.dart';
import 'package:tachidesk_sorayomi/src/i18n/locale_keys.g.dart';

class EnumPopup<T extends Enum> extends StatelessWidget {
  const EnumPopup({
    super.key,
    required this.enumList,
    required this.value,
    required this.onChange,
    required this.onCancel,
  });

  final List<T> enumList;
  final T value;
  final ValueChanged<T> onChange;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: Edge.v8.size,
      title: Text(LocaleKeys.appearanceScreen_appTheme.tr()),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: enumList
            .map(
              (e) => RadioListTile<T>(
                title: Text(e.toString().tr()),
                value: e,
                groupValue: value,
                onChanged: (value) {
                  if (value != null) {
                    onChange(value);
                  }
                },
              ),
            )
            .toList(),
      ),
      actions: const [PopButton()],
    );
  }
}
