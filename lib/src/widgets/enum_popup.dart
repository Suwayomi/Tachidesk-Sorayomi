// Copyright (c) 2022 Contributors to the Suwayomi project
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';

// 🌎 Project imports:
import '../constants/app_sizes.dart';
import '../i18n/locale_keys.g.dart';
import '../utils/extensions/custom_extensions/context_extensions.dart';
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
      content: EnumRadio(
        enumList: enumList,
        value: value,
        onChange: onChange,
      ),
      actions: const [PopButton()],
    );
  }
}

class EnumRadio<T extends Enum> extends StatelessWidget {
  const EnumRadio({
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: enumList
          .map(
            (e) => RadioListTile<T>(
              activeColor: context.theme.indicatorColor,
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
    );
  }
}
