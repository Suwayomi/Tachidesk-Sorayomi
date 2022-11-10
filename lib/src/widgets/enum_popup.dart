// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import '../constants/app_sizes.dart';
import '../i18n/locale_keys.g.dart';
import 'pop_button.dart';

class EnumPopup<T extends Enum> extends StatelessWidget {
  const EnumPopup({
    super.key,
    required this.enumList,
    required this.value,
    required this.onChange,
  });

  final List<T> enumList;
  final T value;
  final ValueChanged<T> onChange;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: KEdgeInsets.v8.size,
      title: Text(LocaleKeys.appTheme.tr()),
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
